Opt("GUIOnEventMode", 1)
Opt("MouseClickDelay", 10)
Opt("MouseClickDownDelay", 10)

_GDIPlus_Startup()

Func GUIControl($hWind, $iMsg, $wParam, $lParam)
	Local $nNotifyCode = BitShift($wParam, 16)
	Local $nID = BitAND($wParam, 0x0000FFFF)
	Local $hCtrl = $lParam
	#forceref $hWind, $iMsg, $wParam, $lParam
	Switch $iMsg
		Case 273
			Switch $nID
				Case $GUI_EVENT_CLOSE
					If WinExists("BlueStacks App Player") Then
						EnableBS($HWnD, $SC_MINIMIZE)
						EnableBS($HWnD, $SC_CLOSE)
						EnableBS($HWnD, $SC_MOVE)
					EndIf
					_GDIPlus_Shutdown()
					_GUICtrlRichEdit_Destroy($txtLog)
					SaveConfig()
					Exit
				Case $btnStop
					If $RunState Then btnStop()
				Case $btnHide
					If $RunState Then btnHide()
				Case $cmbTroopComp
					cmbTroopComp()
				Case $chkRequest
					chkRequest()
				Case $tabMain
					tabMain()
			EndSwitch
		Case 274
			Switch $wParam
				Case 0xf060
					If WinExists("BlueStacks App Player") Then
						EnableBS($HWnD, $SC_MINIMIZE)
						EnableBS($HWnD, $SC_CLOSE)
						EnableBS($HWnD, $SC_MOVE)
					EndIf
					_GDIPlus_Shutdown()
					_GUICtrlRichEdit_Destroy($txtLog)
					SaveConfig()
					Exit
			EndSwitch
	EndSwitch
	Return $GUI_RUNDEFMSG
EndFunc   ;==>GUIControl

Func btnStart()
	CreateLogFile()

	SaveConfig()
	readConfig()
	applyConfig()

	_GUICtrlEdit_SetText($txtLog, "")

	If WinExists("BlueStacks App Player") Then
		DisableBS($HWnD, $SC_MINIMIZE)
		DisableBS($HWnD, $SC_CLOSE)
		DisableBS($HWnD, $SC_MOVE)
		If IsArray(ControlGetPos("BlueStacks App Player", "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")) Then
			Local $BSsize = [ControlGetPos("BlueStacks App Player", "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")[2], ControlGetPos("BlueStacks App Player", "_ctl.Window", "[CLASS:BlueStacksApp; INSTANCE:1]")[3]]
			If $BSsize[0] <> 860 Or $BSsize[1] <> 720 Then
				SetLog("BlueStacks is not set to 860x720!", $COLOR_RED)
				SetLog("Download the '860x720.reg' file and run it, restart BlueStacks", $COLOR_ORANGE)
				SetLog("Download the '860x720.reg' here: http://www.goo.gl/YgQ5II", $COLOR_ORANGE)
			Else
				WinActivate("BlueStacks App Player")

				SetLog("~~~~Welcome to " & @ScriptName & "!~~~~")
				SetLog($Compiled & " running on " & @OSArch & " OS", $COLOR_GREEN)
				SetLog("Bot is starting...", $COLOR_ORANGE)

				$RunState = True
				GUICtrlSetState($btnLocateBarracks, $GUI_DISABLE)
				GUICtrlSetState($btnSearchMode, $GUI_DISABLE)
				GUICtrlSetState($cmbTroopComp, $GUI_DISABLE)
				GUICtrlSetState($chkBackground, $GUI_DISABLE)
				GUICtrlSetState($btnLocateCollectors, $GUI_DISABLE)

				GUICtrlSetState($btnStart, $GUI_HIDE)
				GUICtrlSetState($btnStop, $GUI_SHOW)
				runBot()
			EndIf
		Else
			SetLog("Not in Game!", $COLOR_RED)
		EndIf
	Else
		SetLog("BlueStacks was not found!", $COLOR_RED)
	EndIf
EndFunc   ;==>btnStart

Func btnStop()
	If $RunState Then
		$RunState = False
		EnableBS($HWnD, $SC_MINIMIZE)
		EnableBS($HWnD, $SC_CLOSE)
		EnableBS($HWnD, $SC_MOVE)
		GUICtrlSetState($btnLocateBarracks, $GUI_ENABLE)
		GUICtrlSetState($btnSearchMode, $GUI_ENABLE)
		GUICtrlSetState($cmbTroopComp, $GUI_ENABLE)
		GUICtrlSetState($btnLocateCollectors, $GUI_ENABLE)
		GUICtrlSetState($chkBackground, $GUI_ENABLE)

		GUICtrlSetState($btnStart, $GUI_SHOW)
		GUICtrlSetState($btnStop, $GUI_HIDE)

		FileClose($hLogFileHandle)
		SetLog("Bot has stopped", $COLOR_ORANGE)
	EndIf
EndFunc   ;==>btnStop

Func btnLocateBarracks()
	$RunState = True
	While 1
		ZoomOut()
		LocateBarrack()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateBarracks

Func btnLocateClanClastle()
	$RunState = True
	While 1
		ZoomOut()
		LocateClanClastle()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateClanClastle

Func btnSearchMode()
	While 1
		GUICtrlSetState($btnStart, $GUI_HIDE)
		GUICtrlSetState($btnStop, $GUI_SHOW)

		GUICtrlSetState($btnLocateBarracks, $GUI_DISABLE)
		GUICtrlSetState($btnSearchMode, $GUI_DISABLE)
		GUICtrlSetState($cmbTroopComp, $GUI_DISABLE)
		GUICtrlSetState($chkBackground, $GUI_DISABLE)
		GUICtrlSetState($btnLocateCollectors, $GUI_DISABLE)

		$RunState = True
		VillageSearch()
		$RunState = False

		GUICtrlSetState($btnStart, $GUI_SHOW)
		GUICtrlSetState($btnStop, $GUI_HIDE)

		GUICtrlSetState($btnLocateBarracks, $GUI_ENABLE)
		GUICtrlSetState($btnSearchMode, $GUI_ENABLE)
		GUICtrlSetState($cmbTroopComp, $GUI_ENABLE)
		GUICtrlSetState($chkBackground, $GUI_ENABLE)
		GUICtrlSetState($btnLocateCollectors, $GUI_ENABLE)
		ExitLoop
	WEnd
EndFunc   ;==>btnSearchMode

Func btnHide()
	If $Hide = False Then
		GUICtrlSetData($btnHide, "Show")
		$botPos[0] = WinGetPos("BlueStacks App Player")[0]
		$botPos[1] = WinGetPos("BlueStacks App Player")[1]
		WinMove("BlueStacks App Player", "", -32000, -32000)
		$Hide = True
	Else
		GUICtrlSetData($btnHide, "Hide")

		If $botPos[0] = -32000 Then
			WinMove("BlueStacks App Player", "", 0, 0)
		Else
			WinMove("BlueStacks App Player", "", $botPos[0], $botPos[1])
		EndIf
		$Hide = False
	EndIf
EndFunc   ;==>btnHide

Func cmbTroopComp()
	If _GUICtrlComboBox_GetCurSel($cmbTroopComp) <> $icmbTroopComp Then
		$icmbTroopComp = _GUICtrlComboBox_GetCurSel($cmbTroopComp)
		SetComboTroopComp()
	EndIf
EndFunc   ;==>cmbTroopComp

Func SetComboTroopComp()
	Switch _GUICtrlComboBox_GetCurSel($cmbTroopComp)
		Case 0
			GUICtrlSetState($cmbBarrack1, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_DISABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_DISABLE)

			GUICtrlSetData($txtBarbarians, "50")
			GUICtrlSetData($txtArchers, "50")
			GUICtrlSetData($txtGoblins, "0")

			GUICtrlSetData($txtNumGiants, "0")
			GUICtrlSetData($txtNumWallbreakers, "0")
		Case 1
			GUICtrlSetState($cmbBarrack1, $GUI_ENABLE)
			GUICtrlSetState($cmbBarrack2, $GUI_ENABLE)
			GUICtrlSetState($cmbBarrack3, $GUI_ENABLE)
			GUICtrlSetState($cmbBarrack4, $GUI_ENABLE)
	EndSwitch
EndFunc   ;==>SetComboTroopComp

Func chkBackground()
	If GUICtrlRead($chkBackground) = $GUI_CHECKED Then
		$ichkBackground = 1
		GUICtrlSetState($btnHide, $GUI_ENABLE)
	Else
		$ichkBackground = 0
		GUICtrlSetState($btnHide, $GUI_DISABLE)
	EndIf
EndFunc   ;==>chkBackground

Func btnLocateCollectors()
	$RunState = True
	While 1
		ZoomOut()
		LocateCollectors()
		ExitLoop
	WEnd
	$RunState = False
EndFunc   ;==>btnLocateCollectors

Func chkRequest()
	If GUICtrlRead($chkRequest) = $GUI_CHECKED Then
		$ichkRequest = 1
		GUICtrlSetState($txtRequest, $GUI_ENABLE)
	Else
		$ichkRequest = 0
		GUICtrlSetState($txtRequest, $GUI_DISABLE)
	EndIf
EndFunc

Func tabMain()
	If _GUICtrlTab_GetCurSel($tabMain) = 0 Then
		ControlShow("", "", $txtLog)
	Else
		ControlHide("", "", $txtLog)
	EndIf
EndFunc ;==>tabMain

;---------------------------------------------------
If FileExists($config) Then
	readConfig()
	applyConfig()
EndIf

GUIRegisterMsg($WM_COMMAND, "GUIControl")
GUIRegisterMsg($WM_SYSCOMMAND, "GUIControl")
;---------------------------------------------------