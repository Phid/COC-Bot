;Locates collectors manually (Temporary)

Func LocateCollectors()
	SetLog("Locating Collectors...", $COLOR_BLUE)
	Local $MsgBox
	For $i = 0 To 16
		$MsgBox = MsgBox(6 + 262144, "Locate collector #" & $i + 1, "Click Continue then click on your collector #" & $i + 1 & ". Cancel if not available. Try again to start over.", 0, $frmBot)
		If $MsgBox = 11 Then
			$collectorPos[$i][0] = FindPos()[0]
			$collectorPos[$i][1] = FindPos()[1]
		ElseIf $MsgBox = 10 Then
			ExitLoop (2)
		Else
			$collectorPos[$i][0] = ""
			$collectorPos[$i][1] = ""
		EndIf
		SetLog("-Collector #" & $i + 1 & " = " & "(" & $collectorPos[$i][0] & "," & $collectorPos[$i][1] & ")", $COLOR_GREEN)
	Next
	SaveConfig()
	SetLog("-Locating Complete-", $COLOR_BLUE)
EndFunc   ;==>LocateCollectors