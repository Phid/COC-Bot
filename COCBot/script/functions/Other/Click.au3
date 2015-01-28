Func Click($x, $y, $times = 1, $speed = 0)
	If $times <> 1 Then
		For $i = 0 To ($times - 1)
			ControlClick("BlueStacks App Player", "", "", "left", "1", $x, $y)
			If _Sleep($speed, False) Then ExitLoop
		Next
	Else
		ControlClick("BlueStacks App Player", "", "", "left", "1", $x, $y)
	EndIf
EndFunc   ;==>Click