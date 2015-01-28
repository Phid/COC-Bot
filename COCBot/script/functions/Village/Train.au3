;Uses the location of manually set Barracks to train specified troops

Func Train()
	If $barrackPos[0][0] = "" Then
		LocateBarrack()
		SaveConfig()
		If _Sleep(2000) Then Return
	EndIf
	SetLog("Training Troops...", $COLOR_BLUE)

	While 1
		For $i = 0 To 3
			If _Sleep(500) Then ExitLoop (2)

			Click(1, 1) ;Click Away

			If _Sleep(500) Then ExitLoop (2)

			Click($barrackPos[$i][0], $barrackPos[$i][1]) ;Click Barrack

			If _Sleep(500) Then ExitLoop (2)

			Local $TrainPos = _PixelSearch(155, 603, 694, 605, Hex(0x603818, 6), 5) ;Finds Train Troops button
			If IsArray($TrainPos) = False Then
				SetLog("Barrack " & $i + 1 & " is not available", $COLOR_RED)
				If _Sleep(500) Then ExitLoop (2)
			Else
				Click($TrainPos[0], $TrainPos[1]) ;Click Train Troops button
				If _Sleep(500) Then ExitLoop (2)

				CheckFullArmy()

				_CaptureRegion()
				Switch $barrackTroop[$i]
					Case 0
						While _ColorCheck(_GetPixelColor(329, 297), Hex(0xDC3F70, 6), 20)
							_CaptureRegion()
							Click(220, 320) ;Barbarian
							If _Sleep(10) Then ExitLoop
						WEnd
					Case 1
						While _ColorCheck(_GetPixelColor(217, 297), Hex(0xF8AD20, 6), 20)
							_CaptureRegion()
							Click(331, 320) ;Archer
							If _Sleep(10) Then ExitLoop
						WEnd
					Case 2
						While _ColorCheck(_GetPixelColor(217, 297), Hex(0xF8AD20, 6), 20)
							_CaptureRegion()
							Click(432, 320) ;Giant
							If _Sleep(10) Then ExitLoop
						WEnd
					Case 3
						While _ColorCheck(_GetPixelColor(217, 297), Hex(0xF8AD20, 6), 20)
							_CaptureRegion()
							Click(546, 320) ;Goblins
							If _Sleep(10) Then ExitLoop
						WEnd
				EndSwitch
			EndIf
			If _Sleep(500) Then ExitLoop (2)
			Click(1, 1, 2, 250); Click away twice with 250ms delay
		Next

		SetLog("Training Troops Complete", $COLOR_BLUE)
		ExitLoop
	WEnd
EndFunc   ;==>Train