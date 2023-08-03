SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

;   #  = Windows Key
;   !  = Alt
;   ^  = Ctrl
;   +  = Shift
;   :: = Declares Hotkey, added after the key

#a::    ;Win+a
{

if !ProcessExist("Professional_CPL.exe")
{
    Run("C:\Program Files\Tablet\Wacom\Professional_CPL.exe")
    WinWait("Wacom Tablet Properties")
}

if ProcessExist("Professional_CPL.exe") 
{

    ;Switch to mapping tab if not already    
    text := ControlGetText("Static5","Wacom Tablet Properties")
    if text != "Screen Area:"
    {
        WinShow('Wacom Tablet Properties')
        WinActivate('Wacom Tablet Properties')
        
        CoordMode "Mouse", "Screen"
        MouseGetPos &xpos, &ypos
        
        CoordMode "Mouse", "Window"
        Click 140,220 ;Click on Mapping tab
        ;MouseMove(140,220)
    
        CoordMode "Mouse", "Screen"
        MouseMove(xpos,ypos) 
        Sleep 500 ;Wait for the UI to refresh
        WinMinimize("Wacom Tablet Properties")   
    }
    
    ;Toggle functionality
    mon := ControlGetchoice("ComboBox2", "Wacom Tablet Properties")
    if (InStr(mon, 1))
    {
        ControlChooseIndex(4,"ComboBox2","Wacom Tablet Properties")
    }
   
    Else
    {
        ControlChooseIndex(3,"ComboBox2","Wacom Tablet Properties")
    }

}


} ;Win+a Hotkey End

