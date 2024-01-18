SendMode("Input")  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir(A_ScriptDir)  ; Ensures a consistent starting directory.

;   #  = Windows Key
;   !  = Alt
;   ^  = Ctrl
;   +  = Shift
;   :: = Declares Hotkey, added after the key

#a::    ;Win+a
{

    ; DllCall("SetThreadDpiAwarenessContext", "ptr", -3, "ptr")
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


            CoordMode "Mouse", "Screen"
            MouseGetPos &xpos, &ypos
    
            
            CoordMode "Mouse", "Window"
            WinShow('Wacom Tablet Properties')
            WinActivate('Wacom Tablet Properties')
            WinMove(0, 0, , , "Wacom Tablet Properties") ;DPI Scaling works only with primary monitor so moving app to this monitor.

            Sleep 100 ;Wait for the UI to refresh


            dpiScale := A_ScreenDPI / 96
            x := 140 * dpiScale
            y := 225 * dpiScale

            Click(x,y)

            CoordMode "Mouse", "Screen"
            MouseMove(xpos,ypos) 
            Sleep 100 ;Wait for the UI to refresh
            WinMinimize("Wacom Tablet Properties")   
        }
        

        ; Toggle functionality
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

