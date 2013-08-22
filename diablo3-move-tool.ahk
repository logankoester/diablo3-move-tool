; Diablo 3 macros

; ######################
; # Game configuration #
; ######################

; Game Keymaps
; Set your in-game key mappings to match
;moveKey = F12
;standStillKey = Shift

; Macro Keymaps - Hotkeys to control your mac.ro scripts.
; These keys should be unmapped in game!

;moveNorthKey = Up
;moveWestKey = Left
;moveSouthKey = Down
;moveEastKey = Right

; moveOffset is the distance from screen center to move target with WASD
; moveRate is the delay (in ms) to sleep between move commands
; Try 20 and 0 (aggressive), or 200 and 400 (conservative).
;moveOffset = 200
;moveRate = 400

; ########################
; # Script configuration #
; ########################

; Prevents bugs caused by environmental variables matching those in the script
#NoEnv			        		

; Allows the script to stay active and makes it single-instance
#Persistent

; Safeguard to prevent accidental infinite-looping of events
#MaxHotkeysPerInterval, 200

; Avoids the possible limitations of SendMode Play, increases reliability.
SendMode Input

; Sets the script's working directory
SetWorkingDir %A_ScriptDir%

; Window title must exactly match Winactive("Diablo III")
SetTitleMatchMode, 3

; Move character without moving the cursor
SetDefaultMouseSpeed, 0

; -----------------------------------------------------------------------------

#Include lib\window.ahk

; SetTimer, WASD, 10

#Include lib\agent_kill.ahk
#Include lib\wasd.ahk
#Include lib\move_toggle.ahk

; F7::moveToggle(true)
; F8::moveToggle(false)

#Include lib\gui\main.ahk