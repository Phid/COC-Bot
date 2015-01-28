;Uses the getGold,getElixir... functions and uses CompareResources until it meets conditions.
;Will wait ten seconds until getGold returns a value other than "", if longer than 10 seconds - calls checkNextButton
;-clicks next if checkNextButton returns true, otherwise will restart the bot.

Func GetResources() ;Reads resources
	While 1
		Local $i = 0
		While getGold(51, 66) = "" ; Loops until gold is readable
			If _Sleep(500) Then ExitLoop (2)
			$i += 1
			If $i >= 20 Then ; If gold cannot be read by 10 seconds
				If checkNextButton() Then ;Checks for Out of Sync or Connection Error during search
					Click(750, 500) ;Click Next
				Else
					SetLog("Cannot locate Next button, Restarting Bot", $COLOR_RED)
					checkMainScreen()
					$Restart = True
					ExitLoop (2)
				EndIf
				$i = 0
			EndIf
		WEnd
		If _Sleep(300) Then ExitLoop (2)

		$searchGold = getGold(51, 66)
		$searchElixir = getElixir(51, 66 + 29)
		$searchTrophy = getTrophy(51, 66 + 90)

		If $searchTrophy <> "" Then
			$searchDark = getDarkElixir(51, 66 + 57)
		Else
			$searchDark = 0
			$searchTrophy = getTrophy(51, 66 + 60)
		EndIf

		$SearchCount += 1 ; Counter for number of searches
		SetLog("(" & $SearchCount & ") [G]: " & $searchGold & Tab($searchGold, 12) & "[E]: " & $searchElixir & Tab($searchElixir, 12) & "[D]: " & $searchDark & Tab($searchDark, 12) & "[T]: " & $searchTrophy)
		ExitLoop
	WEnd
EndFunc   ;==>GetResources