Opt('WinDetectHiddenText', 1)
;Path and filename of the installer executable
$APPTOINSTALL="""" & $CmdLine[1] & """"
Run($APPTOINSTALL)
If @error <> 0  Then 
	Exit @error
EndIf

$WINDOWNAME="FlashDevelop 5.3.3 Setup"
WinWaitActive($WINDOWNAME)
ControlClick($WINDOWNAME,"","[TEXT:OK]")
WinSetState($WINDOWNAME,"",@SW_HIDE)

WinWaitActive($WINDOWNAME)
ControlClick($WINDOWNAME,"","[TEXT:&Next >]")
WinSetState($WINDOWNAME,"",@SW_HIDE)

WinWaitActive($WINDOWNAME)
ControlClick($WINDOWNAME,"","[TEXT:&Next >]")
WinSetState($WINDOWNAME,"",@SW_HIDE)

WinWaitActive($WINDOWNAME)
ControlClick($WINDOWNAME,"","[TEXT:&Install]")
WinSetState($WINDOWNAME,"",@SW_HIDE)
Sleep(1000)

WinWaitActive($WINDOWNAME)
ControlClick($WINDOWNAME,"","[TEXT:Finish]")
WinSetState($WINDOWNAME,"",@SW_HIDE)