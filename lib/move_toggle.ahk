; Toggle a repeated move command

moveToggle(state) {
	global MoveKey
	global MoveRate
	global MoveToggleState

	MoveToggleState = %state%

	Loop {
		if !MoveToggleState
			break
		Sleep %MoveRate%
		Send {%MoveKey%}
	}
	return
}