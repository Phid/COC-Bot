Func getBSPos()
	$aPos = ControlGetPos("BlueStacks App Player", "", "[CLASS:BlueStacksApp; INSTANCE:1]")
	$tPoint = DllStructCreate("int X;int Y")
	DllStructSetData($tPoint, "X", $aPos[0])
	DllStructSetData($tPoint, "Y", $aPos[1])
	_WinAPI_ClientToScreen(WinGetHandle(WinGetTitle("BlueStacks App Player")), $tPoint)

	$BSpos[0] = DllStructGetData($tPoint, "X")
	$BSpos[1] = DllStructGetData($tPoint, "Y")
EndFunc   ;==>getBSPos