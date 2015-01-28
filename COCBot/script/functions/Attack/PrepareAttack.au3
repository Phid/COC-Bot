;Checks the troops when in battle, checks for type, slot, and quantity.
;Saved in $atkTroops[SLOT][TYPE/QUANTITY] variable

Func PrepareAttack() ;Assigns troops
	While 1
		SetLog("Preparing to attack", $COLOR_GREEN)
		For $i = 0 To 6
			_CaptureRegion()
			$Troop = _GetPixelColor(68 + (72 * $i), 595)
			If _ColorCheck($Troop, Hex(0xF8B020, 6), 5) Then ;Check if slot is Barbarian
				$atkTroops[$i][0] = "Barbarian"
				$atkTroops[$i][1] = Number(getNormal(40 + (72 * $i), 565))
			ElseIf _ColorCheck($Troop, Hex(0xD83F68, 6), 5) Then ;Check if slot is Archer
				$atkTroops[$i][0] = "Archer"
				$atkTroops[$i][1] = Number(getNormal(40 + (72 * $i), 565))
			ElseIf _ColorCheck($Troop, Hex(0x7BC950, 6), 5) Then ;Check if slot is Goblin
				$atkTroops[$i][0] = "Goblin"
				$atkTroops[$i][1] = Number(getNormal(40 + (72 * $i), 565))
			ElseIf _ColorCheck($Troop, Hex(0xF8D49E, 6), 5) Then ;Check if slot is Giant
				$atkTroops[$i][0] = "Giant"
				$atkTroops[$i][1] = Number(getNormal(40 + (72 * $i), 565))
			ElseIf _ColorCheck($Troop, Hex(0x60A4D0, 6), 5) Then ;Check if slot is Wallbreaker
				$atkTroops[$i][0] = "Wallbreaker"
				$atkTroops[$i][1] = Number(getNormal(40 + (72 * $i), 565))
			ElseIf _ColorCheck($Troop, Hex(0xF8EB79, 6), 5) Then ;Check if slot is King
				$atkTroops[$i][0] = "King"
				$atkTroops[$i][1] = 1
			ElseIf _ColorCheck(_GetPixelColor(68 + (72 * $i), 588), Hex(0x7031F0, 6), 5) Then ;Check if slot is Queen
				$atkTroops[$i][0] = "Queen"
				$atkTroops[$i][1] = 1
			ElseIf _ColorCheck(_GetPixelColor(68 + (72 * $i), 588), Hex(0xF6BF50, 6), 5) Then ;Check if slot is Clan Castle
				$atkTroops[$i][0] = "Clan Castle"
				$atkTroops[$i][1] = 1
			Else
				$atkTroops[$i][0] = ""
				$atkTroops[$i][1] = 0
			EndIf
			If $atkTroops[$i][0] <> "" Then SetLog("-" & $atkTroops[$i][0] & " " & $atkTroops[$i][1])
		Next
		ExitLoop
	WEnd
EndFunc   ;==>PrepareAttack