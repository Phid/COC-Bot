;Checks for error message (outof sync, inactivity, ect..)
;Returns False if no error message

Func checkNextButton() ;Checks for Out of Sync or Connection Lost errors
	$Message = _PixelSearch(457, 300, 458, 330, Hex(0x33B5E5, 6), 10) ;Check for out of sync or inactivity
	If IsArray($Message) = False Then
		Return False ;Button available
	Else
		Return True ;Out of sync or inactivity error.
	EndIf
EndFunc   ;==>checkNextButton