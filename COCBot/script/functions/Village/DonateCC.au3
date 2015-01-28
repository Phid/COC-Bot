;Donates troops

Func DonateCC()
	Global $Donate = True
	While $Donate
		Click(1, 1) ;Click Away
		If _ColorCheck(_GetPixelColor(331, 330), Hex(0xF0A03B, 6), 20) = False Then
			Click(19, 349) ;Clicks chat thing
		EndIf
		If _Sleep(2000) = True Then Return
		Local $offColors[3][3] = [[0x000000, 0, -2], [0x262926, 0, 1], [0xF8FCF0, 0, 11]]
		Global $DonatePixel = _MultiPixelSearch(202, 119, 203, 670, 1, 1, Hex(0x262926, 6), $offColors, 20)
		If IsArray($DonatePixel) Then
			If $ichkDonateBarbarians = 1 Or $ichkDonateArchers = 1 Or $ichkDonateGiants = 1 Then
				_CaptureRegion(0, 0, 435, $DonatePixel[1] + 50)
				Local $String = getString($DonatePixel[1] - 17)
				SetLog("Donate Text: " & $String, $COLOR_GREEN)
				If $ichkDonateBarbarians = 1 Then
					Local $Barbs = StringSplit($itxtDonateBarbarians, @CRLF)
					For $i = 0 to UBound($Barbs) - 1
						If $String = $Barbs[$i] Then
							DonateBarbs()
							ExitLoop
						EndIf
					Next
				EndIf

				If $ichkDonateArchers = 1 Then
					Local $Archers = StringSplit($itxtDonateArchers, @CRLF)
					For $i = 0 to UBound($Archers) - 1
						If $String = $Archers[$i] Then
							DonateArchers()
							ExitLoop
						EndIf
					Next
				EndIf

				If $ichkDonateGiants = 1 Then
					Local $Giants = StringSplit($itxtDonateGiants, @CRLF)
					For $i = 0 to UBound($Giants) - 1
						If $String = $Giants[$i] Then
							DonateGiants()
							ExitLoop
						EndIf
					Next
				EndIf
			Else
				Select
					Case $ichkDonateAllBarbarians = 1
						DonateBarbs
					Case $ichkDonateAllArchers = 1
						DonateArchers
					Case $ichkDonateAllGiants = 1
						DonateGiants
				EndSelect
			EndIf
		Else
			$Donate = False
		EndIf
	WEnd

	_CaptureRegion()
	If _ColorCheck(_GetPixelColor(331, 330), Hex(0xF0A03B, 6), 20) Then
		Click(331, 330) ;Clicks chat thing
	EndIf
EndFunc   ;==>DonateCC

Func DonateBarbs()
	If $ichkDonateBarbarians = 1 Or $ichkDonateAllBarbarians = 1 Then
		Click($DonatePixel[0], $DonatePixel[1] + 11)
		If _Sleep(1000) = True Then Return
		_CaptureRegion(0, 0, 435, $DonatePixel[1] + 50)
		If _ColorCheck(_GetPixelColor(237, $DonatePixel[1] - 5), Hex(0x507C00, 6), 10) Then
			SetLog("Donating Barbarians", $COLOR_BLUE)
			If _Sleep(500) = True Then Return
			Click(237, $DonatePixel[1] - 5, 5, 50)
		Else
			DonateArchers()
			Return
		EndIf
		If _Sleep(500) = True Then Return
		Click(1, 1)
		SetLog("Finished Donating", $COLOR_BLUE)
	Else
		DonateArchers()
		Return
	EndIf
EndFunc

Func DonateArchers()
	If $ichkDonateArchers = 1 Or $ichkDonateAllArchers = 1 Then
		Click($DonatePixel[0], $DonatePixel[1] + 11)
		If _Sleep(1000) = True Then Return
		_CaptureRegion(0, 0, 435, $DonatePixel[1] + 50)
		If _ColorCheck(_GetPixelColor(315, $DonatePixel[1] - 5), Hex(0x507C00, 6), 10) Then
			SetLog("Donating Archers", $COLOR_BLUE)
			If _Sleep(500) = True Then Return
			Click(315, $DonatePixel[1] - 5, 5, 50)
		Else
			DonateGiants()
			Return
		EndIf
		If _Sleep(500) = True Then Return
		Click(1, 1)
		SetLog("Finished Donating", $COLOR_BLUE)
	Else
		DonateGiants()
		Return
	EndIf
EndFunc

Func DonateGiants()
	If $ichkDonateGiants = 1 Or $ichkDonateAllGiants = 1 Then
		Click($DonatePixel[0], $DonatePixel[1] + 11)
		If _Sleep(1000) = True Then Return
		_CaptureRegion(0, 0, 435, $DonatePixel[1] + 50)
		If _ColorCheck(_GetPixelColor(480, $DonatePixel[1] - 5), Hex(0x507C00, 6), 10) Then
			SetLog("Donating Giants", $COLOR_BLUE)
			If _Sleep(500) = True Then Return
			Click(480, $DonatePixel[1] - 5, 5, 50)
		Else
			SetLog("No troops available for donation, donating later...", $COLOR_ORANGE)
			$Donate = False
		EndIf
		If _Sleep(500) = True Then Return
		Click(1, 1)
		SetLog("Finished Donating", $COLOR_BLUE)
	Else
		SetLog("No troops available for donation, donating later...", $COLOR_ORANGE)
		$Donate = False
	EndIf
EndFunc