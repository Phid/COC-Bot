;Returns home when in battle, will take screenshot and check for gold/elixir change unless specified not to.

Func ReturnHome($TakeSS = True, $GoldChangeCheck = True) ;Return main screen
	While 1
		If $GoldChangeCheck = True Then
			If $checkKPower Or $checkQPower Then
				If _Sleep(50000 - $delayActivateKQ) Then ExitLoop
			Else
				If _Sleep(50000) Then ExitLoop
			EndIf
			While GoldElixirChange()
				If _Sleep(1000) Then ExitLoop (2)
			WEnd
		EndIf

		$checkKPower = False
		$checkQPower = False
		SetLog("Returning Home", $COLOR_BLUE)
		If $RunState = False Then ExitLoop
		Click(62, 519) ;Click Surrender
		If _Sleep(500) Then ExitLoop
		Click(512, 394) ;Click Confirm
		If _Sleep(2000) Then ExitLoop

		If $TakeSS = True Then
			SetLog("Taking snapshot of your loot", $COLOR_ORANGE)
			Local $Date = @MDAY & "." & @MON & "." & @YEAR
			Local $Time = @HOUR & "." & @MIN
			_CaptureRegion()
			_GDIPlus_ImageSaveToFile($hBitmap, @ScriptDir & "\Loots\" & $Date & " at " & $Time & ".jpg")
		EndIf

		If _Sleep(2000) Then ExitLoop
		Click(428, 544) ;Click Return Home Button

		Local $counter = 0
		While 1
			If _Sleep(2000) Then ExitLoop (2)
			_CaptureRegion()
			If _ColorCheck(_GetPixelColor(284, 28), Hex(0x41B1CD, 6), 20) Then
				_GUICtrlEdit_SetText($txtLog, "")
				ExitLoop (2)
			EndIf

			$counter += 1

			If $counter >= 50 Then
				SetLog("Cannot return home.", $COLOR_RED)
				checkMainScreen()
				ExitLoop (2)
			EndIf
		WEnd
		ExitLoop
	WEnd
EndFunc   ;==>ReturnHome