FileInstall assets/d3bg.png, d3bg.png, 1
FileInstall defaults.ini, settings.ini, 0

; Define some colors borrowed from http://www.colourlovers.com/palette/1965572/Diablo_3
AlphaColor = ff7575
BackgroundColor = 1B0C07
ControlColor = 6F532C
HeaderColor = C74A1A
SubheaderColor = 911106
TextColor = E3B15C

Gui +LastFound 
Gui, Color, %AlphaColor%
gui, 1:add, picture, x0 y0, d3bg.png
Gui +LastFound
WinSet, TransColor, %AlphaColor%
Gui, Color, %BackgroundColor%
WinSet, Transparent, 230

; ##########
; # Header #
; ##########

; Title
Gui, Font, S14 Bold C%HeaderColor%, 
Gui, Add, Text, x247 y9 w200 h30 BackgroundTrans, Diablo 3 Move Tool

Gui, Font, S8 CDefault Italic C%TextColor%, Verdana
Gui, Add, Text, x640 y9 w80 h20 BackgroundTrans, v0.1.0

; Web link buttons
Gui, Font, ,
Gui, Font, C%TextColor%
Gui, Add, Button, x172 y49 w100 h30, Visit Website
Gui, Add, Button, x432 y49 w120 h30, Check New Releases
Gui, Add, Button, x292 y49 w120 h30, Report A Bug

; ################
; # Tab Contents #
; ################

; -----------------------
; - Player Movement Tab -
; -----------------------
Gui, Add, Tab, x12 y89 w670 h460, Player Movement

; Help & instructions text
Gui, Font, S10, 
Gui, Add, Edit, x22 y129 w320 h280 +Center -VScroll +ReadOnly C%HeaderColor% vHelpText, You'll figure it out!


; ------------- Keyboard Movement Group -------------
Gui, Font, S8 CDefault Bold Italic C%TextColor%, Verdana
Gui, Add, GroupBox, x352 y119 w320 h290, Keyboard movement
Gui, Font, ,
Gui, Font, C%TextColor%

Gui, Add, Text, x362 y179 w60 h20 BackgroundTrans, XY Offset
Gui, Add, Slider, x432 y179 w230 h30 Range20-200 gChangeMoveOffset vMoveOffset, 200

Gui, Add, Text, x362 y229 w300 h20 +Center BackgroundTrans, Map directional keys

Gui, Add, Hotkey, x482 y259 w60 h30 vMoveNorth gChangeMoveNorth
Gui, Add, Hotkey, x392 y299 w60 h30 vMoveWest gChangeMoveWest
Gui, Add, Hotkey, x482 y339 w60 h30 vMoveSouth gChangeMoveSouth
Gui, Add, Hotkey, x572 y299 w60 h30 vMoveEast gChangeMoveEast

; ---------------------------------------------------

; ------------- Automatic Movement Group -------------
Gui, Font, S8 CDefault Italic C%TextColor%, Verdana
Gui, Add, GroupBox, x22 y419 w320 h120, Automatic movement
Gui, Font, ,
Gui, Font, C%TextColor%

Gui, Add, Text, x32 y469 w190 h20 BackgroundTrans, Map a hotkey to enable
Gui, Add, Hotkey, x222 y469 w100 h20 gChangeAutomoveEnable vAutomoveEnable

Gui, Add, Text, x32 y499 w190 h20 BackgroundTrans, Map a hotkey to disable
Gui, Add, Hotkey, x222 y499 w100 h20 gChangeAutomoveDisable vAutomoveDisable
; ----------------------------------------------------

; ------------- Game Integration Group -------------
Gui, Font, S8 CDefault Italic C%TextColor%, Verdana
Gui, Add, GroupBox, x352 y419 w320 h120, Game integration
Gui, Font, ,
Gui, Font, C%TextColor%

Gui, Add, Text, x362 y439 w200 h20 BackgroundTrans, What key is "Move" mapped to?
Gui, Add, Hotkey, x562 y439 w100 h20 vMoveKey gChangeMoveKey
Gui, Add, Text, x362 y489 w60 h20 BackgroundTrans, Move rate
Gui, Add, Slider, x422 y489 w240 h30 Range0-400 gChangeMoveRate vMoveRate, 400

Gui, Add, Text, x362 y459 w200 h20 BackgroundTrans, "Stand Still" must be mapped to...
Gui, Add, Edit, x562 y459 w100 h20 CBlack vStandStillKey, Shift
; --------------------------------------------------

; ###############
; # Actions Bar #
; ###############

; Controls for saving and loading the configuration
Gui, Font, , 
Gui, Add, Button, x12 y559 w50 h50 , Save
Gui, Add, Button, x72 y559 w50 h50 , Load

; (De)activate button
Gui, Font, S14 Bold,
Gui, Add, Button, x227 y559 w240 h50 vActivateButton gToggleActive, Activate
Gui, Font, , 
Gui, Font, C%TextColor%

; Launch button
Gui, Add, Button, x482 y559 w200 h50 , Launch Game

; Status message
Gui, Font, S12,
Gui, Add, Edit, x12 y619 w670 h28 +Center C%HeaderColor% BackgroundTrans +ReadOnly vStatusMsg, 

; Load help text into text control

; #########################
; # Utility functions     #
; #########################

logStatus(msg){
	ControlSetText, Edit3, %msg%
}

loadSettings(){
	global AutomoveEnable
	IniRead, AutomoveEnable, settings.ini, Automatic Movement, "AutomoveEnable"
	GuiControl,, AutomoveEnable, %AutomoveEnable%

	global AutomoveDisable
	IniRead, AutomoveDisable, settings.ini, Automatic Movement, "AutomoveDisable"
	GuiControl,, AutomoveDisable, %AutomoveDisable%

	global MoveOffset
	IniRead, MoveOffset, settings.ini, Keyboard Movement, "MoveOffset"
	GuiControl,, MoveOffset, %MoveOffset%

	global MoveNorth
	IniRead, MoveNorth, settings.ini, Keyboard Movement, "MoveNorth"
	GuiControl,, MoveNorth, %MoveNorth%

	global MoveWest
	IniRead, MoveWest, settings.ini, Keyboard Movement, "MoveWest"
	GuiControl,, MoveWest, %MoveWest%

	global MoveSouth
	IniRead, MoveSouth, settings.ini, Keyboard Movement, "MoveSouth"
	GuiControl,, MoveSouth, %MoveSouth%

	global MoveEast
	IniRead, MoveEast, settings.ini, Keyboard Movement, "MoveEast"
	GuiControl,, MoveEast, %MoveEast%

	global MoveKey
	IniRead, MoveKey, settings.ini, Game Integration, "MoveKey"
	GuiControl,, MoveKey, %MoveKey%

	global MoveRate
	IniRead, MoveRate, settings.ini, Game Integration, "MoveRate"
	GuiControl,, MoveRate, %MoveRate%

	global StandStillKey
	IniRead, StandStillKey, settings.ini, Game Integration, "StandStillKey"
	GuiControl,, StandStillKey, %StandStillKey%

	global GameExecPath
	IniRead, GameExecPath, settings.ini, Game Integration, "GameExecPath"
}

saveSettings(){
	Gui, Submit, NoHide
	global AutomoveEnable
	IniWrite, %AutomoveEnable%, settings.ini, Automatic Movement, "AutomoveEnable"

	global AutomoveDisable
	IniWrite, %AutomoveDisable%, settings.ini, Automatic Movement, "AutomoveDisable"

	global MoveOffset
	IniWrite, %MoveOffset%, settings.ini, Keyboard Movement, "MoveOffset"

	global MoveNorth
	IniWrite, %MoveNorth%, settings.ini, Keyboard Movement, "MoveNorth"

	global MoveWest
	IniWrite, %MoveWest%, settings.ini, Keyboard Movement, "MoveWest"

	global MoveSouth
	IniWrite, %MoveSouth%, settings.ini, Keyboard Movement, "MoveSouth"

	global MoveEast
	IniWrite, %MoveEast%, settings.ini, Keyboard Movement, "MoveEast"

	global MoveKey
	IniWrite, %MoveKey%, settings.ini, Game Integration, "MoveKey"

	global MoveRate
	IniWrite, %MoveRate%, settings.ini, Game Integration, "MoveRate"

	global StandStillKey
	IniWrite, %StandStillKey%, settings.ini, Game Integration, "StandStillKey"

	global GameExecPath
	IniWrite, %GameExecPath%, settings.ini, Game Integration, "GameExecPath"
}

launchGame(){
	global GameExecPath
	if FileExist(GameExecPath)
		Run %GameExecPath%
	else
		setGameExecPath()
}

setGameExecPath() {
	global GameExecPath
	FileSelectFile, SelectedFile, 3, , Locate your Diablo3 game client, Executables (*.exe)
	GameExecPath = %SelectedFile%
	if GameExecPath =
		logStatus(No Diablo3 game client found)
	else
  	saveSettings()
  	launchGame()
}

; ########################
; # Start your engines!  #
; ########################

Thread, priority, 1
Thread, interrupt, 500, 2000
Gui, Show, x466 y199 h651 w700, Diablo3 Move Tool
loadSettings()

return

; #####################
; # g-label handlers  #
; #####################


GuiClose:
ExitApp
return

ButtonVisitWebsite:
	Run https://github.com/logankoester/diablo3-move-tool
	return

ButtonCheckNewReleases:
Run https://github.com/logankoester/diablo3-move-tool/releases
return

ButtonReportABug:
Run https://github.com/logankoester/diablo3-move-tool/issues
return

ToggleActive:
if (Active) {
	Active := !Active
	logStatus("Deactivated")
	;GuiControl,, ActivateButton, Activate
	movetoggle(false)
	Hotkey %AutomoveEnable%, Off
	Hotkey %AutomoveDisable%, Off
	disableWasd()
} else {
	Active := !Active
	logStatus("Activated")
	;GuiControl,, ActivateButton, Deactivate
	waitForGame(60)
	;agentKill()
	enableWasd()
	Hotkey %AutomoveEnable%, EnableAutomove
	Hotkey %AutomoveDisable%, DisableAutomove
}
return

EnableAutomove:
moveToggle(true)
return

DisableAutomove:
moveToggle(false)
return

ButtonSave:
saveSettings()
ControlSetText, Edit3, Configuration saved.
return

ButtonLoad:
loadSettings()
ControlSetText, Edit3, Configuration loaded.
return

ButtonLaunchGame:
ControlSetText, Edit3, Launching game...
launchGame()
return

ChangeAutomoveEnable:
; AutomoveEnable.
ControlSetText, Edit3, AutomoveEnable hotkey has been changed.
return

ChangeAutomoveDisable:
; AutomoveDisable.
ControlSetText, Edit3, AutomoveDisable hotkey has been changed.
return

ChangeMoveOffset:
; AutomoveDisable.
ControlSetText, Edit3, MoveOffset has been changed to %MoveOffset%.
return

ChangeMoveNorth:
ControlSetText, Edit3, MoveNorth has been changed to %MoveNorth%.
return

ChangeMoveWest:
ControlSetText, Edit3, MoveWest has been changed to %MoveWest%.
return

ChangeMoveSouth:
ControlSetText, Edit3, MoveSouth has been changed to %MoveSouth%.
return

ChangeMoveEast:
ControlSetText, Edit3, MoveEast has been changed to %MoveEast%.
return

ChangeMoveKey:
ControlSetText, Edit3, MoveKey has been changed.
return

ChangeMoveRate:
; ControlSetText, Edit3, MoveRate has been changed to %MoveRate%.
logStatus("MoveRate has been changed to " . MoveRate)
return