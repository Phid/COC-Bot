$frmBot = GUICreate($sBotTitle, 417, 392, 207, 158)
$tabMain = GUICtrlCreateTab(8, 8, 401, 355)
GUICtrlSetOnEvent(-1, "tabMain")
$pageGeneral = GUICtrlCreateTabItem("General")
$txtLog = _GUICtrlRichEdit_Create($frmBot, "", 16, 40, 385, 240, BitOR($ES_MULTILINE, $ES_READONLY, $ES_AUTOVSCROLL, $WS_VSCROLL, $ES_NOHIDESEL))
$Controls = GUICtrlCreateGroup("Controls", 16, 290, 185, 65)
$btnStart = GUICtrlCreateButton("Start", 30, 314, 75, 25)
GUICtrlSetOnEvent(-1, "btnStart")
$btnStop = GUICtrlCreateButton("Stop", 30, 314, 75, 25)
GUICtrlSetOnEvent(-1, "btnStop")
GUICtrlSetState(-1, $GUI_HIDE)
$btnHide = GUICtrlCreateButton("Hide", 110, 314, 75, 25)
GUICtrlSetOnEvent(-1, "btnHide")
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$otherSettings = GUICtrlCreateGroup("Other Settings", 208, 290, 185, 65)
$lblMaxTrophy = GUICtrlCreateLabel("Max Trophy :", 230, 310, 66, 17)
GUICtrlSetLimit(-1, 4)
$txtMaxTrophy = GUICtrlCreateInput("3000", 298, 307, 71, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetTip(-1, "Bot will lose tropies if your trophy is greater than this.")
$chkBackground = GUICtrlCreateCheckbox("Background Mode", 245, 330, 115, 17)
GUICtrlSetOnEvent(-1, "chkBackground")
GUICtrlSetState(-1, $GUI_UNCHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$pageSearchSetting = GUICtrlCreateTabItem("Search Settings")
$btnSearchMode = GUICtrlCreateButton("Search Mode", 24, 327, 368, 25)
GUICtrlSetOnEvent(-1, "btnSearchMode")
GUICtrlSetTip(-1, "Does not attack. Searches for base that meets conditions.")
$Conditions = GUICtrlCreateGroup("Conditions", 16, 40, 193, 185)
$chkMeetDE = GUICtrlCreateCheckbox("Meet Dark Elixir", 40, 88, 97, 17)
$chkMeetTrophy = GUICtrlCreateCheckbox("Meet Trophy Count", 40, 112, 113, 17)
$chkMeetGxE = GUICtrlCreateCheckbox("Meet Gold and Elixir", 40, 64, 113, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
$lblConditions = GUICtrlCreateLabel("Check the boxes that you want to meet. The bot will stop at a base when it meets the conditions. If all unchecked, bot will stop if gold or elixir that is met.", 26, 143, 172, 72, $SS_CENTER)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Resources = GUICtrlCreateGroup("Resources", 208, 40, 193, 185)
$lblMinGold = GUICtrlCreateLabel("Minimum Gold: ", 216, 64, 76, 17)
$lblMinElixir = GUICtrlCreateLabel("Minimum Elixir:", 216, 88, 72, 17)
$lblMinDarkElixir = GUICtrlCreateLabel("Minimum Dark Elixir:", 216, 112, 98, 17)
$lblMinTrophy = GUICtrlCreateLabel("Minimum Trophy Count:", 216, 136, 115, 17)
$txtMinGold = GUICtrlCreateInput("80000", 330, 62, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$txtMinElixir = GUICtrlCreateInput("80000", 330, 86, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$txtMinDarkElixir = GUICtrlCreateInput("0", 330, 110, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 6)
$txtMinTrophy = GUICtrlCreateInput("0", 330, 134, 61, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetLimit(-1, 2)
$lblResources = GUICtrlCreateLabel("Bot will stop when a base is found with resources higher or equal to the minimum resources.", 220, 164, 168, 51, $SS_CENTER)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$OtherSearchSettings = GUICtrlCreateGroup("Other Seach Settings", 15, 225, 385, 95)
$chkAlertSearch = GUICtrlCreateCheckbox("Alert when Base Found", 30, 250, 132, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$pageAttackSettings = GUICtrlCreateTabItem("Attack Settings")
$WeakBaseSettings = GUICtrlCreateGroup("Weak Base Settings", 15, 35, 130, 230)
$lblMortar = GUICtrlCreateLabel("Max Mortar Lvl:", 20, 58, 77, 17)
$cmbMortar = GUICtrlCreateCombo("", 100, 55, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8", "5")
GUICtrlSetState(-1, $GUI_DISABLE)
$lblWizardTower = GUICtrlCreateLabel("Wiz Tower Lvl:", 20, 83, 75, 17)
$cmbWizTower = GUICtrlCreateCombo("", 100, 80, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8", "4")
GUICtrlSetState(-1, $GUI_DISABLE)
$lblCannon = GUICtrlCreateLabel("Cannon Lvl:", 20, 108, 61, 17)
$lblArcher = GUICtrlCreateLabel("Archer Lvl:", 20, 133, 55, 17)
$chkWithKing = GUICtrlCreateCheckbox("Attack their King", 20, 180, 112, 17, BitOR($GUI_SS_DEFAULT_CHECKBOX, $BS_RIGHTBUTTON))
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlSetState(-1, $GUI_DISABLE)
$chkWithQueen = GUICtrlCreateCheckbox("Attack their Queen", 20, 200, 112, 17, BitOR($GUI_SS_DEFAULT_CHECKBOX, $BS_RIGHTBUTTON))
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbCannon = GUICtrlCreateCombo("", 100, 105, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8|9|10|11|12|13", "8")
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbArcher = GUICtrlCreateCombo("", 100, 130, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8|9|10|11|12|13", "8")
GUICtrlSetState(-1, $GUI_DISABLE)
$lblWeakDescription = GUICtrlCreateLabel("Bot will attack bases that meet requirement.", 17, 225, 125, 32, $SS_CENTER)
$lblxBow = GUICtrlCreateLabel("X-Bow Lvl:", 20, 158, 55, 17)
$cmbxBow = GUICtrlCreateCombo("", 100, 155, 35, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "0|1|2|3|4|5|6|7|8|9|10|11|12|13", "0")
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$AttackMode = GUICtrlCreateGroup("Attack Mode", 150, 35, 250, 115)
$radDeadBases = GUICtrlCreateRadio("Dead Bases - Meets condition, full collectors", 155, 55, 238, 17)
$radWeakBases = GUICtrlCreateRadio("Weak Bases - Meets condition and able 50%", 155, 85, 228, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$radAllBases = GUICtrlCreateRadio("All Bases - Attack all that meets search.", 155, 115, 228, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$HeroesSettings = GUICtrlCreateGroup("Royals Settings", 150, 155, 250, 110)
$chkKingAttackDeadBases = GUICtrlCreateCheckbox("Atk Dead Bases", 165, 195, 97, 17)
$chkKingAttackWeakBases = GUICtrlCreateCheckbox("Atk Weak Bases", 165, 215, 97, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$chkKingAttackAllBases = GUICtrlCreateCheckbox("Atk All Bases", 165, 235, 97, 17)
$lblKingSettings = GUICtrlCreateLabel("King Settings:", 165, 175, 69, 17)
$lblQueenSettings = GUICtrlCreateLabel("Queen Settings:", 285, 175, 80, 17)
$chkQueenAttackDeadBases = GUICtrlCreateCheckbox("Atk Dead Bases", 285, 195, 97, 17)
$chkQueenAttackWeakBases = GUICtrlCreateCheckbox("Atk Weak Bases", 285, 215, 97, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$chkQueenAttackAllBases = GUICtrlCreateCheckbox("Atk All Bases", 285, 235, 97, 17)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$deploySettings = GUICtrlCreateGroup("Deploy Settings", 15, 270, 385, 85)
$chkAttackTH = GUICtrlCreateCheckbox("Attack Townhall (Outside)", 250, 320, 142, 17)
GUICtrlSetState(-1, $GUI_DISABLE)
$cmbDeploy = GUICtrlCreateCombo("", 30, 290, 360, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Attack on two sides, penetrates through base|Attack on three sides, gets outer and some inside of base|Attack on all sides equally, gets most of outer base", "Attack on all sides equally, gets most of outer base")
$cmbAlgorithm = GUICtrlCreateCombo("", 30, 320, 215, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians + Archers|Use all troops", "Barbarians + Archers") ;"Archers|Barbarians|Goblins|Barbarians + Archers|Barb + Arch + Goblin + Giant|Barb + Arch + Giant|Barb + Arch + Goblin|Barb + Arch + Goblin + Giant + Wallbreakers|Use Barracks"
GUICtrlCreateGroup("", -99, -99, 1, 1)
$pageDonateSettings = GUICtrlCreateTabItem("Donate Settings")
$Donation = GUICtrlCreateGroup("", 15, 30, 385, 325)
$Barbarians = GUICtrlCreateGroup("Barbarians", 20, 70, 120, 235)
$chkDonateAllBarbarians = GUICtrlCreateCheckbox("Donate to All", 30, 95, 97, 17)
$txtDonateBarbarians = GUICtrlCreateEdit("", 25, 120, 110, 179, BitOR($ES_WANTRETURN, $WS_VSCROLL))
GUICtrlSetData(-1, StringFormat("barbarians\r\nbarb\r\nany"))
GUICtrlSetTip(-1, "Keywords for donating Barbarians")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Archers = GUICtrlCreateGroup("Archers", 148, 70, 120, 235)
$chkDonateAllArchers = GUICtrlCreateCheckbox("Donate to All", 155, 95, 97, 17)
$txtDonateArchers = GUICtrlCreateEdit("", 153, 120, 110, 179, BitOR($ES_WANTRETURN, $WS_VSCROLL))
GUICtrlSetData(-1, StringFormat("archers\r\narch\r\nany"))
GUICtrlSetTip(-1, "Keywords for donating Archers")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$Giants = GUICtrlCreateGroup("Giants", 275, 70, 120, 235)
$chkDonateAllGiants = GUICtrlCreateCheckbox("Donate to All", 285, 95, 97, 17)
$txtDonateGiants = GUICtrlCreateEdit("", 280, 120, 110, 179, BitOR($ES_WANTRETURN, $WS_VSCROLL))
GUICtrlSetData(-1, StringFormat("giants\r\ngiant\r\nany"))
GUICtrlSetTip(-1, "Keywords for donating Giants")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$chkDonateGiants = GUICtrlCreateCheckbox("Donate Giants", 275, 305, 97, 17)
$chkDonateArchers = GUICtrlCreateCheckbox("Donate Archers", 149, 305, 97, 17)
$chkDonateBarbarians = GUICtrlCreateCheckbox("Donate Barbarians", 20, 305, 112, 17)
$chkRequest = GUICtrlCreateCheckbox("Request for :", 30, 45, 82, 17)
GUISetOnEvent(-1, "chkRequest")
$txtRequest = GUICtrlCreateInput("any", 115, 45, 276, 21)
GUICtrlSetTip(-1, "Request for input.")
$btnLocateClanCastle = GUICtrlCreateButton("Locate Clan Castle Manually", 25, 325, 365, 25)
GUICtrlSetOnEvent(-1, "btnLocateClanClastle")
GUICtrlCreateGroup("", -99, -99, 1, 1)
$pageTroopSettings = GUICtrlCreateTabItem("Troop Settings")
$Barracks = GUICtrlCreateGroup("Troops", 20, 40, 185, 215)
$lblBarbarians = GUICtrlCreateLabel("Barbarians :", 30, 68, 60, 17)
$lblArchers = GUICtrlCreateLabel("Archers :", 30, 93, 46, 17)
$lblGoblins = GUICtrlCreateLabel("Goblins :", 30, 118, 45, 17)
$txtBarbarians = GUICtrlCreateInput("30", 115, 65, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetState(-1, $GUI_DISABLE)
$txtArchers = GUICtrlCreateInput("60", 115, 90, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetState(-1, $GUI_DISABLE)
$txtGoblins = GUICtrlCreateInput("10", 115, 115, 56, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
GUICtrlSetState(-1, $GUI_DISABLE)
$lblPercentBarbarians = GUICtrlCreateLabel("%", 175, 68, 12, 17)
$lblPercentArchers = GUICtrlCreateLabel("%", 175, 93, 12, 17)
$lblPercentGoblins = GUICtrlCreateLabel("%", 175, 118, 12, 17)
$lblBarracks = GUICtrlCreateLabel("Must equal 100% to fully distribute the troops with maximum amount efficiency. Bot will use this if custom troops is selected", 40, 175, 140, 67, $SS_CENTER)
$cmbTroopComp = GUICtrlCreateCombo("", 45, 145, 131, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUISetOnEvent(-1, "cmbTroopComp")
GUICtrlSetData(-1, "B.Arch|Use Barracks", "Use Barracks") ;"Archers|Barbarians|Goblins|B.Arch|B.A.G.G.|B.A.Giant|B.A.Goblin|B.A.G.G.Wall|Use Barracks|Custom Troops"
GUICtrlCreateGroup("", -99, -99, 1, 1)
$OtherTroops = GUICtrlCreateGroup("Other Troops", 210, 40, 185, 85)
$lblGiants = GUICtrlCreateLabel("Number of Giants:", 215, 68, 89, 17)
$lblWallBreakers = GUICtrlCreateLabel("Number of Wall Breakers:", 215, 93, 125, 17)
$txtNumGiants = GUICtrlCreateInput("4", 340, 65, 46, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetState(-1, $GUI_DISABLE)
$txtNumWallbreakers = GUICtrlCreateInput("4", 340, 90, 46, 21, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER))
GUICtrlSetState(-1, $GUI_DISABLE)
GUICtrlCreateGroup("", -99, -99, 1, 1)
$BarrackGroup = GUICtrlCreateGroup("Barracks", 210, 130, 185, 125)
$lblBarrack1 = GUICtrlCreateLabel("Barrack 1:", 220, 153, 53, 17)
$lblBarrack2 = GUICtrlCreateLabel("Barrack 2:", 220, 178, 53, 17)
$lblBarrack3 = GUICtrlCreateLabel("Barrack 3:", 220, 203, 53, 17)
$lblBarrack4 = GUICtrlCreateLabel("Barrack 4:", 220, 228, 53, 17)
$cmbBarrack1 = GUICtrlCreateCombo("", 275, 150, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers", "Barbarians") ; "Barbarians|Archers|Giants|Goblins"
$cmbBarrack2 = GUICtrlCreateCombo("", 275, 175, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers", "Barbarians") ; "Barbarians|Archers|Giants|Goblins"
$cmbBarrack3 = GUICtrlCreateCombo("", 275, 200, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers", "Archers") ; "Barbarians|Archers|Giants|Goblins"
$cmbBarrack4 = GUICtrlCreateCombo("", 275, 225, 110, 25, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
GUICtrlSetData(-1, "Barbarians|Archers", "Archers") ; "Barbarians|Archers|Giants|Goblins"
GUICtrlCreateGroup("", -99, -99, 1, 1)
$OtherBarrackSettings = GUICtrlCreateGroup("Other Settings", 20, 255, 375, 100)
$btnLocateBarracks = GUICtrlCreateButton("Locate Barracks Manually", 30, 320, 355, 25)
GUICtrlSetOnEvent(-1, "btnLocateBarracks")
$btnLocateCollectors = GUICtrlCreateButton("Locate Collectors Manually", 30, 280, 355, 25)
GUICtrlSetOnEvent(-1, "btnLocateCollectors")
GUICtrlCreateGroup("", -99, -99, 1, 1)
GUICtrlCreateTabItem("")
$statLog = _GUICtrlStatusBar_Create($frmBot)
_GUICtrlStatusBar_SetSimple($statLog)
_GUICtrlStatusBar_SetText($statLog, "Status : Idle")
GUISetState(@SW_SHOW)