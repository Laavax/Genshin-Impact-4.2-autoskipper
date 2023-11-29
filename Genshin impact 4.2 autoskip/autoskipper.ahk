#InstallKeybdHook
#SingleInstance, Force
SetBatchLines -1
SetControlDelay, -1

toggle := 0
tooltipMsg := ""

SetTimer, setTip, 5

~CapsLock::
    toggle := !toggle
    SetTimer, setTip, 5

    If (toggle) {
        SetTimer, autoclick, 200
        tooltipMsg := "##Autoclick enabled."
    } else {
        SetTimer, autoclick, off
        tooltipMsg := "##Autoclick disabled."
    }
return

~LAlt::
~RAlt::
    If (toggle) {
        SetTimer, autoclick, off
        KeyWait, %A_ThisHotkey%, U
        SetTimer, autoclick, on
    }
return

autoclick:
    If (WinActive("ahk_exe GenshinImpact.exe")) {
        Click, 1290, 668
    }
return

setTip:
    StringReplace, cleanTTM, tooltipMsg, ##
    Tooltip, % cleanTTM
    If (InStr(tooltipMsg, "##") && A_TickCount - TTStart > 1000) {
        tooltipMsg :=
    }
    If tooltipMsg =
    {
        Tooltip
        SetTimer, setTip, off
    }
return
