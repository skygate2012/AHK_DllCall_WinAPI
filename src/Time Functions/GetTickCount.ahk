﻿; =================================================================================================
; Function......: GetTickCount
; DLL...........: Kernel32.dll
; Library.......: Kernel32.lib
; U/ANSI........:
; Author........: jNizM
; Modified......:
; Links.........: http://msdn.microsoft.com/en-us/library/windows/desktop/ms724408(v=vs.85).aspx
; AHK =============================================================================================
GetTickCount()
{
    return, DllCall("kernel32.dll\GetTickCount")
}
; ===================================================================================

MsgBox, % GetTickCount()



/* C++ ==============================================================================
DWORD WINAPI GetTickCount(void);
================================================================================== */