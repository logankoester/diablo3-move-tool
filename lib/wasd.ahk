; Enables traditional WASD movements for Diablo III.
; Code derived from example at https://code.google.com/p/diablo-iii-wasd/

disableWasd(){
	SetTimer, WASD, Off
}

enableWasd(){
	global win_x
	global win_y
	global x_center
	global y_center
	global MoveOffset
	global MoveKey
	global StandStillKey
	global MoveNorth
	global MoveWest
	global MoveSouth
	global MoveEast

	SetTimer, WASD, 10

	WASD:
		if GetKeyState(StandStillKey, "P") {
			Loop {
				GetKeyState, state, %StandStillKey%, P
				if state = U
				break
			}
		} else if GetKeyState(MoveNorth, "P") || GetKeyState(MoveSouth, "P") || GetKeyState(MoveWest, "P") || GetKeyState(MoveEast, "P") {
			if GetKeyState(MoveNorth, "P") {
				y_final := y_center - MoveOffset
			} else if GetKeyState(MoveSouth, "P") {
				y_final := y_center + MoveOffset
			} else {
				y_final := y_center
			}

			if GetKeyState(MoveWest, "P") {
				x_final := x_center - MoveOffset
			} else if GetKeyState(MoveEast, "P") {
				x_final := x_center + MoveOffset
			} else {
				x_final := x_center
			}
			
			MouseGetPos, x_initial, y_initial
			MouseMove, %x_final%, %y_final%, 0			
			Send {%MoveKey%}
			MouseMove, %x_initial%, %y_initial%, 0
			Sleep MoveRate
		}

	return
}