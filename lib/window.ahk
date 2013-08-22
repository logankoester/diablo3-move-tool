; Waits for Diablo III to be the active window to get window information

waitForGame(timeout) {
	global win_x
	global win_y
	global x_center
	global y_center

	WinWaitActive, Diablo III, , %timeout%
	if ErrorLevel {
	  MsgBox, Diablo III not started within the allotted time. Please run the script again then start Diablo III
	  ExitApp
	} else {
		Sleep 500
		WinGetPos, win_x, win_y, width, height, A
		x_center := win_x + width / 2
		compensation := (width / height) == (16 / 10) ? 1.063829 : 1.063711
		y_center := win_y + height / 2 / compensation
	}
}