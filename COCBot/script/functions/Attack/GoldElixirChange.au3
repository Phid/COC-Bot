;Checks if the gold/elixir changes values within 30 seconds, Returns True if changed
;If gold/elixir = "" it will return True, meaning battle is over.

Func GoldElixirChange() ;Checks 30 seconds if gold changes
	Local $Gold1, $Gold2
	While 1
		$Gold1 = getGold(51, 66)
		$Elixir1 = getElixir(51, 66 + 29)
		Local $iBegin = TimerInit()
		While TimerDiff($iBegin) < 30000
			If $RunState = False Then ExitLoop
			Sleep(100)
			If _ColorCheck(_GetPixelColor(75, 530), Hex(0xC00000, 6), 20) Then Return False
		WEnd
		$Gold2 = getGold(51, 66)
		$Elixir2 = getElixir(51, 66 + 29)
		If $Gold1 = $Gold2 Or $Elixir1 = $Elixir2 Or $Gold2 = "" Or $Elixir2 = "" Then
			Return False
		Else
			SetLog("Gold & Elixir change detected, waiting...", $COLOR_GREEN)
			Return True
		EndIf
		ExitLoop
	WEnd
EndFunc   ;==>GoldElixirChange