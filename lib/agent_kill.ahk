; Kills Agent.exe if it is still running after Diablo and the script close

agentKill(){
	OnExit, Agent_Kill
	Agent_Kill:
		if !WinExist("Diablo III") {
			Process, Close, Agent.exe 
		}
		return
}