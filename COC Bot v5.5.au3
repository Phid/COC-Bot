#RequireAdmin
$sBotTitle = "COC Bot v5.5"

If _Singleton($sBotTitle, 1) = 0 Then
	MsgBox(0, "", "Bot is already running.")
	Exit
EndIf

If Not FileExists(@ScriptDir & "\License.txt") Then
	$license = InetGet("http://www.gnu.org/licenses/gpl-3.0.txt", @ScriptDir & "\License.txt")
	InetClose($license)
EndIf

DirCreate(@ScriptDir & "\COCBot\Loots\")
DirCreate(@ScriptDir & "\COCBot\logs\")

#include "COCBot\script\Global Variables.au3"
#include "COCBot\script\GUI Design.au3"
#include "COCBot\script\GUI Control.au3"
#include "COCBot\script\Functions.au3"
#include-once

While 1
	Sleep(5000)
WEnd

Func runBot() ;Bot that runs everything in order
	While 1
		$Restart = False
		If _Sleep(1000) Then ExitLoop
		checkMainScreen()
		If _Sleep(1000) Then ExitLoop
		ZoomOut()
		If _Sleep(1000) Then ExitLoop
		Train()
		If _Sleep(1000) Then ExitLoop
		RequestCC()
		If _Sleep(1000) Then ExitLoop
		DonateCC()
		If _Sleep(1000) Then ExitLoop
		Collect()
		If _Sleep(1000) Then ExitLoop
		Idle()
		If _Sleep(1000) Then ExitLoop
		AttackMain()
		If _Sleep(1000) Then ExitLoop
	WEnd
EndFunc   ;==>runBot

Func Idle() ;Sequence that runs until Full Army
	Local $TimeIdle = 0 ;In Seconds
	While 1
		If $fullArmy = False Then
			SetLog("~~~Waiting for full army~~~")
			While $fullArmy = False
				Local $hTimer = TimerInit()
				If _Sleep(1000) Then ExitLoop
				checkMainScreen()
				If _Sleep(1000) Then ExitLoop
				ZoomOut()
				If _Sleep(30000) Then ExitLoop (2)
				If $iCollectCounter > $COLLECTATCOUNT Then ; This is prevent from collecting all the time which isn't needed anyway
					Collect()
					If _Sleep(1000) Or $RunState = False Then ExitLoop (2)
					$iCollectCounter = 0
				EndIf
				$iCollectCounter = $iCollectCounter + 1
				Train()
				If $fullArmy Then ExitLoop (2)
				If _Sleep(1000) Then ExitLoop (2)
				DropTrophy()
				If _Sleep(1000) Then ExitLoop (2)
				DonateCC()
				$TimeIdle += Round(TimerDiff($hTimer) / 1000, 2) ;In Seconds
				SetLog("Time Idle: " & Floor(Floor($TimeIdle / 60) / 60) & " hours " & Floor(Mod(Floor($TimeIdle / 60), 60)) & " minutes " & Floor(Mod($TimeIdle, 60)) & " seconds", $COLOR_ORANGE)
			WEnd
		EndIf
		ExitLoop
	WEnd
EndFunc   ;==>Idle

Func AttackMain() ;Main control for attack functions
	While 1
		PrepareSearch()
		If _Sleep(1000) Then ExitLoop
		VillageSearch()
		If _Sleep(1000) Or $Restart = True Then ExitLoop
		PrepareAttack()
		If _Sleep(1000) Then ExitLoop
		Attack()
		If _Sleep(1000) Then ExitLoop
		ReturnHome()
		If _Sleep(1000) Then ExitLoop
		ExitLoop
	WEnd
EndFunc   ;==>AttackMain

Func Attack() ;Selects which algorithm
	While 1
		SetLog("======Beginning Attack======")
		Switch $icmbAlgorithm
			Case 0 ;Barbarians + Archers
				Barch()
			Case 1 ;Use All Troops
				SetLog("Not Available yet, using Barch instead...", $COLOR_RED)
				If _Sleep(2000) Then ExitLoop
				Barch()
		EndSwitch
		ExitLoop
	WEnd
EndFunc   ;==>Attack

