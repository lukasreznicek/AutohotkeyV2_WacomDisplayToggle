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

        ;Switch to mapping tab if not already, switching only when not selected. Checking if 'Screen Area:' text present if not switching.
        text := ControlGetText("Static5","Wacom Tablet Properties")
        if text != "Screen Area:"
        {   
            ; Store Current mouse coordinates in screen space
            CoordMode "Mouse", "Screen"
            MouseGetPos &xpos, &ypos
    

            CoordMode "Mouse", "Window" ;Switching to local windows space
            WinShow('Wacom Tablet Properties')
            WinActivate('Wacom Tablet Properties')

            WinMove(0, 0, , , "Wacom Tablet Properties") ;DPI Scaling works only with primary monitor so moving app to this monitor.

            Sleep 100 ;Wait for the UI to refresh

            ; On Windows 'System > Display > Scale' Inbuilt A_ScreenDPI variable:
            ; 100% = 96
            ; 125% = 120
            ; 150% = 144
            ; 175% = 168
            ; Screen resolution does not matter

            dpiScale := A_ScreenDPI / 96  ;Normalizing towards 100% A_ScreenDPI
            ; When setting X and Y value its best to have Screen Scale in windows set to 100% and checking AutoHotkey Window Spy 'Window:' value on active window
            x := 140 * dpiScale
            y := 225 * dpiScale
            
            ; Clicking on Mapping Tab (Only when other tab is selected)
            Click(x,y)
            CoordMode "Mouse", "Screen"

            ; ; Debug 
            ; MsgBox("Curret Screen DPI:" A_ScreenDPI)


            ; Returning stored mouse position
            MouseMove(xpos,ypos) 
            Sleep 300 ;Wait for the UI to refresh
            WinMinimize("Wacom Tablet Properties")   

        }
        
        ; Toggle functionality
        combobox_value := ControlGetchoice("ComboBox2", "Wacom Tablet Properties")
        if (InStr(combobox_value, 1))
        {
            ControlChooseIndex(4,"ComboBox2","Wacom Tablet Properties")
        }
    
        Else
        {
            ControlChooseIndex(3,"ComboBox2","Wacom Tablet Properties")
        }


}


} ;Win+a Hotkey End

