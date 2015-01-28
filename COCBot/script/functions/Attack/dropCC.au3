;Drops Clan Castle troops, given the slot and x, y coordinates.

Func dropCC($x, $y, $slot) ;Drop clan castle
	SetLog("Dropping Clan Castle", $COLOR_BLUE)
	Click(68 + (72 * $slot), 595, 1, 500)
	Click($x, $y)
EndFunc   ;==>dropCC