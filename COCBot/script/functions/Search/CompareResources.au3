;Compares the searched values to the minimum values, returns false if doesn't meet.
;Every 20 searches, it will decrease minimum by certain amounts.

Func CompareResources() ;Compares resources and returns true if conditions meet, otherwise returns false
	If $SearchCount <> 0 And Mod($SearchCount, 20) = 0 Then
		If $MinGold - 5000 >= 0 Then $MinGold -= 5000
		If $MinElixir - 5000 >= 0 Then $MinElixir -= 5000
		If $MinDark - 100 >= 0 Then $MinDark -= 100
		If $MinTrophy - 2 >= 0 Then $MinTrophy -= 2
		SetLog("~Gold: " & $MinGold & "; Elixir: " & $MinElixir & "; Dark: " & $MinDark & "; Trophy: " & $MinTrophy, $COLOR_GREEN)
	EndIf

	Local $G = (Number($searchGold) >= Number($MinGold)), $E = (Number($searchElixir) >= Number($MinElixir)), $D = (Number($searchDark) >= Number($MinDark)), $T = (Number($searchTrophy) >= Number($MinTrophy))
	Local $Boolean = False

	If $G Or $E Then $Boolean = True

	If $chkConditions[0] = 1 Then
		If $G = False Or $E = False Then $Boolean = False
		Return $Boolean
	EndIf

	If $chkConditions[1] = 1 Then
		If $D = False Then $Boolean = False
		Return $Boolean
	EndIf

	If $chkConditions[2] = 1 Then
		If $T = False Then $Boolean = False
		Return $Boolean
	EndIf

	Return $Boolean
EndFunc   ;==>CompareResources