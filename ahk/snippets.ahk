;; Autohotkey scripts

;; Insert current date and time on 'sss'
:R*?:sss::
FormatTime, CurrentDateTime,, [dd-MM-yy HH:mm]
SendInput %CurrentDateTime%
return

;; Swap Caps and Ctrl
Capslock::Ctrl