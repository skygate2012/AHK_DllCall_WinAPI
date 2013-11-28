﻿; =================================================================================================
; Function......: GetIpStatistics
; DLL...........: Iphlpapi.dll
; Library.......: Iphlpapi.lib
; U/ANSI........:
; Author........: jNizM
; Modified......:
; Links.........: http://msdn.microsoft.com/en-us/library/windows/desktop/aa365959(v=vs.85).aspx
; AHK =============================================================================================
GetIpStatistics()
{
    static MIB_IPSTATS, init := VarSetCapacity(MIB_IPSTATS, 92, 0) && NumPut(92, MIB_IPSTATS, "UInt")
    DllCall("Iphlpapi.dll\GetIpStatistics", "UInt", &MIB_IPSTATS)
    return, {  0 : NumGet(MIB_IPSTATS,  0, "UInt"),  1 : NumGet(MIB_IPSTATS,  4, "UInt"),  2 : NumGet(MIB_IPSTATS,  8, "UInt")
            ,  3 : NumGet(MIB_IPSTATS, 12, "UInt"),  4 : NumGet(MIB_IPSTATS, 16, "UInt"),  5 : NumGet(MIB_IPSTATS, 20, "UInt")
            ,  6 : NumGet(MIB_IPSTATS, 24, "UInt"),  7 : NumGet(MIB_IPSTATS, 28, "UInt"),  8 : NumGet(MIB_IPSTATS, 32, "UInt")
            ,  9 : NumGet(MIB_IPSTATS, 36, "UInt"), 10 : NumGet(MIB_IPSTATS, 40, "UInt"), 11 : NumGet(MIB_IPSTATS, 44, "UInt")
            , 12 : NumGet(MIB_IPSTATS, 48, "UInt"), 13 : NumGet(MIB_IPSTATS, 52, "UInt"), 14 : NumGet(MIB_IPSTATS, 56, "UInt")
            , 15 : NumGet(MIB_IPSTATS, 60, "UInt"), 16 : NumGet(MIB_IPSTATS, 64, "UInt"), 17 : NumGet(MIB_IPSTATS, 68, "UInt")
            , 18 : NumGet(MIB_IPSTATS, 72, "UInt"), 19 : NumGet(MIB_IPSTATS, 76, "UInt"), 20 : NumGet(MIB_IPSTATS, 80, "UInt")
            , 21 : NumGet(MIB_IPSTATS, 84, "UInt"), 22 : NumGet(MIB_IPSTATS, 88, "UInt") }
}
; ===================================================================================

GIPS := GetIpStatistics()

MsgBox, % "GetIpStatistics function`n"
        . "MIB_IPSTATS structure`n`n"
        . "Forwarding:`t`t"            GIPS[0]  "`n"
        . "DefaultTTL:`t`t"            GIPS[1]  "`n"
        . "InReceives:`t`t"            GIPS[2]  "`n"
        . "InHdrErrors:`t`t"           GIPS[3]  "`n"
        . "InAddrErrors:`t`t"          GIPS[4]  "`n"
        . "ForwDatagrams:`t`t"         GIPS[5]  "`n"
        . "InUnknownProtos:`t`t"       GIPS[6]  "`n"
        . "InDiscards:`t`t"            GIPS[7]  "`n"
        . "InDelivers:`t`t`t"          GIPS[8]  "`n"
        . "OutRequests:`t`t"           GIPS[9]  "`n"
        . "RoutingDiscards:`t`t"       GIPS[10] "`n"
        . "OutDiscards:`t`t"           GIPS[11] "`n"
        . "OutNoRoutes:`t`t"           GIPS[12] "`n"
        . "ReasmTimeout:`t`t"          GIPS[13] "`n"
        . "ReasmReqds:`t`t"            GIPS[14] "`n"
        . "ReasmOks:`t`t"              GIPS[15] "`n"
        . "ReasmFails:`t`t"            GIPS[16] "`n"
        . "FragOks:`t`t`t"             GIPS[17] "`n"
        . "FragFails:`t`t`t"           GIPS[18] "`n"
        . "FragCreates:`t`t"           GIPS[19] "`n"
        . "NumIf:`t`t`t"               GIPS[20] "`n"
        . "NumAddr:`t`t"               GIPS[21] "`n"
        . "NumRoutes:`t`t"             GIPS[22]



/* C++ ==============================================================================
DWORD GetIpStatistics(
    _Out_  PMIB_IPSTATS pStats        // UInt
);


typedef struct _MIB_IPSTATS {
    DWORD dwForwarding;               //  0 (92)          UInt
    DWORD dwDefaultTTL;               //  4 =>   4        UInt
    DWORD dwInReceives;               //  4 =>   8        UInt
    DWORD dwInHdrErrors;              //  4 =>  12        UInt
    DWORD dwInAddrErrors;             //  4 =>  16        UInt
    DWORD dwForwDatagrams;            //  4 =>  20        UInt
    DWORD dwInUnknownProtos;          //  4 =>  24        UInt
    DWORD dwInDiscards;               //  4 =>  28        UInt
    DWORD dwInDelivers;               //  4 =>  32        UInt
    DWORD dwOutRequests;              //  4 =>  36        UInt
    DWORD dwRoutingDiscards;          //  4 =>  40        UInt
    DWORD dwOutDiscards;              //  4 =>  44        UInt
    DWORD dwOutNoRoutes;              //  4 =>  48        UInt
    DWORD dwReasmTimeout;             //  4 =>  52        UInt
    DWORD dwReasmReqds;               //  4 =>  56        UInt
    DWORD dwReasmOks;                 //  4 =>  60        UInt
    DWORD dwReasmFails;               //  4 =>  64        UInt
    DWORD dwFragOks;                  //  4 =>  68        UInt
    DWORD dwFragFails;                //  4 =>  72        UInt
    DWORD dwFragCreates;              //  4 =>  76        UInt
    DWORD dwNumIf;                    //  4 =>  80        UInt
    DWORD dwNumAddr;                  //  4 =>  84        UInt
    DWORD dwNumRoutes;                //  4 =>  88        UInt
} MIB_IPSTATS, *PMIB_IPSTATS;
================================================================================== */