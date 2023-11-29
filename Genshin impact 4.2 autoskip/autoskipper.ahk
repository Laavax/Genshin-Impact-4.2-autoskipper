#InstallKeybdHook
#SingleInstance, Force
SetBatchLines -1
Thread, Interrupt, 0

; Tooltip variables
toggle := 0
TTStart := A_TickCount

; Set tooltip timer
setTimer, setTip, 5

; Tooltip message initialization
TooltipMsg := "Press (Capslock) to toggle autoclicker`nThe autoclicker will only click when the Genshin Impact window is active"

; Show initial tooltip
ToolTip, %TooltipMsg%

; Main loop
while (A_TickCount - TTStart < 10000 && !toggle) {
    TooltipMsg := "Press (Capslock) to toggle autoclicker`nThe autoclicker will only click when the Genshin Impact window is active"
}

TooltipMsg := "##Autoclick enabled."

~Capslock::
; Toggle autoclick
toggle := !toggle
setTimer, setTip, 5
TTStart := A_TickCount
TooltipMsg := (toggle ? "##Autoclick enabled." : "##Autoclick disabled.")
SetTimer, autoclick, % (toggle ? "100" : "off") ; Reduced click interval to 100 milliseconds
return

; Other hotkeys to pause autoclick while keys are held
~LAlt::
~RAlt::
    if (toggle) {
        SetTimer, autoclick, off
        KeyWait, % A_ThisHotkey, U
        SetTimer, autoclick, on
    }
return

; Autoclick function
autoclick:
    If WinActive("ahk_exe GenshinImpact.exe") {
        Click 1290, 668 ; Use Click instead of MouseClick for faster response
    }
return

; Set tooltip function
setTip:
    StringReplace, cleanTTM, TooltipMsg, ##
    Tooltip, % cleanTTM
    if (InStr(TooltipMsg, "##") && A_TickCount - TTStart > 1000)
        TooltipMsg :=
    if TooltipMsg =
    {
        Tooltip
        setTimer, setTip, off
    }
return