#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Gui, note: Add, Text, section xm w80, Template:
Gui, note: Add, DropDownList,  w182 xp+54 yp-2 gMovs vTemp AltSubmit, Please select a template|| Relocation | Address Update |Take Notes|
Gui, note: Add, Text, section xm w80 vCustNameTitle,Customer Name:
Gui, note: Add, Edit, vCustName w200 ys
Gui, note: Add, Text, section xm w80 vCommentTitle, Comments:
Gui, note: Add, Edit, vComment +Wrap w260 h100 ys
Gui, note: Add, CheckBox, vHoldSale gHoldingSale, Tick this if you want to keep the sale and pass back to you?
Gui, note: Add, Text, section xm w80 vstaffTitle, Staff ID:
Gui, note: Add, Edit, vStaff w230 h20 ys
Gui, note: Add, Text, section xm w80 vPlansTitle, NBN PLAN:
Gui, note: Add, DropDownList, r5 vPlans w200,  |12/1 100GB + Casual VoIP Phone $50|12/1 Unlimited + Casual VoIP Phone|12/1 100GB + Casual VoIP Phone $60|12/1 $59 Base plan | 25/10 $60 100Gb | 25/10 $65 500GB| 25/10 $69 Unlimited| 50/20 $70 100GB| 50/20 $75 500GB| 50/20 Unlimited| 75/10 $79 Fixed Wireless | 75/20 $80 100GB| 75/20 $85 500GB| 75/20 $89 Unlimited| 100/20 $90 100GB| 100/20 $95 500GB| 100/20 $99 Unlimited| 100/40 $100 100GB| 100/40 $105 500GB| 100/40 $109 Unlimited| 250/25 $129 Unlimited| 1GIG/50 $149 Unlimited|                                                       
Gui, note: Add, Text, section xm w80 vTheISPTitle,The ISP
Gui, note: Add, DropDownList, r5 vTheISP,  |Telstra|TPG|OPTUS|DODO|Tangerine|Belong|Other|
Gui, note: Add, CheckBox, vHaveInternet gMobileHaveInternetCheckBox,(Moblies) DO YOU HAVE AN INTERNET SERVICE WITH AUSSIE BROADBAND?
Gui, note: Add, Text, section xm w80 vMobliesTitle, MOBILES 4G:
Gui, note: Add, DropDownList, r5 vMoblies, |2GB $15|5GB $19|25GB $25|40GB $35|60GB $45|100GB $65|
Gui, note: Add, Text, section xm w180 y320 vMobliesWithNoInternetTitle, MOBILES 4G With no Internet Plan:
Gui, note: Add, DropDownList, r5 vMobliesWithNoInternet, |1GB $15|2.5GB $19|15GB $29|30GB $39|50GB $49| 80GB $69| 
Gui, note: Add, Text, section xm w80 vFetchTitle, FETCH:
Gui, note: Add, DropDownList, r2 vFetch, |Mini $10|Mighty $15|
Gui, note: Add, Text, section xm w20 vModemTitle, MODEM: 
Gui, note: Add, Edit, vModem w200 ys
Gui, note: Add, Text, section xm w80 vVoipTitle, VOIP:
Gui, note: Add, DropDownList, r2 vVoip, |Casual $0|Everday $10|International $20|
Gui, note: Add, Text, section xm w80 vMyDateTimeTitle,Callback:
Gui, note: Add, DateTime, vMyDateTime, dd/MM/yyyy
        
;---Text boxs------
GuiControl, note: hide, CustName
GuiControl, note: Hide, Comment
GuiControl, note: Hide, HoldSale
GuiControl, note: Hide, Plans
GuiControl, note: Hide, TheISP
GuiControl, note: Hide, Moblies
GuiControl, note: Hide, MobliesWithNoInternet
GuiControl, note: Hide, Fetch
GuiControl, note: Hide, Modem
GuiControl, note: Hide, Moblies
GuiControl, note: Hide, Voip
GuiControl, note: Hide, MyDateTime
GuiControl, note: Hide, Staff
--------------------------
;----Title for the txt boxs----
GuiControl, note: Hide, CustNameTitle
GuiControl, note: Hide, CommentTitle
GuiControl, note: Hide, HoldSale
GuiControl, note: Hide, PlansTitle
GuiControl, note: Hide, TheISPTitle
GuiControl, note: Hide, MobliesTitle
GuiControl, note: Hide, MobliesWithNoInternetTitle
GuiControl, note: Hide, FetchTitle
GuiControl, note: Hide, ModemTitle
GuiControl, note: Hide, VoipTitle
GuiControl, note: Hide, MyDateTimeTitle
GuiControl, note: Hide, staffTitle
;-------------------------------------
;-----Buttons----------------
Gui, note: Add, Button, gNotesButtonOk vOk w100, Ok
Gui, note: Add, Button, gNotesButtonClear vClear w90 x110, Clear
Gui, note: Add, Button, gNotesButtonClose vCls w100 x200, Close
Gui, note: Add, Button, gNotesButtonSettings vSettings y125 w100 x0, Settings
gui note: add, Button, gNotesButtonUpdate vUpdates y100 w100 x0, update
;-------------------------
;---------Buttons Control---
GuiControl, note: Hide, Sub
;when update is a thing not yet
GuiControl, note: hide,Updates, 
;------------------

if( FileExist("settings\settings.ini") ) {
	iniRead, posx, settings\settings.ini, Outbounder Setting, PosX
	iniRead, posy, settings\settings.ini, Outbounder Setting, PosY
	
}else {
	msgBox,Making the settings folder, dont remove this file. this is used for the settings 
	FileCreateDir, settings
	posx = 10
	posy = 70
	IniWrite, posx, settings\settings.ini, Outbounder Setting, PosX
	IniWrite, posy, settings\settings.ini, Outbounder Setting, PosY
	

}

	


gui note:+AlwaysOnTop
Gui, note: Show, w270 h150 x%posx% y%posy% ,Outbounder Helper
return
NotesButtonClose:
{
    MsgBox, 4, , Do you want to close dialogue? (Press YES or NO)
    IfMsgBox No
        return
    Gui, Destroy
    Exit
}
Movs:
        GuiControlGet, Temp,
        ;Relocation
        if ( Temp = 2) {
                GuiControl, Move, Ok, y140
                GuiControl, Move, Cls, y10
        }

        if Temp = 3
            {
                GuiControl, Move, Ok, y140
                GuiControl, Move, Cls, y240
            }
        ;Taking notes     
        if Temp = 4
            {   
            
                
                
                
                
                GuiControl, show, NameTitle
                GuiControl, show, CustName
                GuiControl, show, Comment
                GuiControl, show, HoldSale
                GuiControl, show, Plans
                GuiControl, show, TheISP
                GuiControl, hide, Moblies
                GuiControl, show, MobliesWithNoInternet
                GuiControl, show, Fetch
                GuiControl, show, Modem
                GuiControl, show, Voip
                
                
                
                GuiControl, note: show, CustNameTitle
                GuiControl, note: show, CommentTitle
                GuiControl, note: show, PlansTitle
                GuiControl, note: show, TheISPTitle
                GuiControl, note: hide, MobliesTitle
                GuiControl, note: show, FetchTitle
                GuiControl, note: show, ModemTitle
                GuiControl, note: show, HaveInternet
                GuiControl, note: show, MobliesWithNoInternetTitle
                GuiControl, note: show, VoipTitle
                GuiControl, note: show, MyDateTime
                GuiControl, note: show, MyDateTimeTitle
            
                    
            
                GuiControl, Move, Ok, y570
                GuiControl, Move, Cls, y570
                GuiControl, Move, Clear, y570
                GuiControl, +Redraw, Ok
                Gui, Show, Autosize, Outbounder Helper
                
                return
            }
            
    else        
                GuiControl, note: Hide, CustNameTitle
                GuiControl, note: Hide, CommentTitle
                GuiControl, note: Hide, HoldSale
                GuiControl, note: Hide, PlansTitle
                GuiControl, note: Hide, TheISPTitle
                GuiControl, note: Hide, MobliesTitle
                GuiControl, note: hide, MobliesWithNoInternetTitle
                GuiControl, note: Hide, FetchTitle
                GuiControl, note: Hide, ModemTitle
                GuiControl, note: Hide, VoipTitle
                GuiControl, note: Hide, MyDateTimeTitle
                                
                
                
                GuiControl, Hide, CustName
                GuiControl, Hide, Comment
                GuiControl, Hide, HoldSale
                GuiControl, Hide, Plans
                GuiControl, Hide, TheISP
                GuiControl, Hide, Moblies
                GuiControl, Hide, MobliesWithNoInternet
                GuiControl, Hide, HaveInternet
                GuiControl, Hide, Fetch
                GuiControl, Hide, Modem
                GuiControl, Hide, Voip
                GuiControl, Hide, MyDateTime
                
                
                GuiControl, Hide, Sub
                GuiControl, Move, Ok, y50
                GuiControl, Move, Clear, y50
                GuiControl, Move, Cls, y50
                
                ;when update is a thing not yet
                GuiControl, hide,Updates, 
                Gui, Show, Autosize, Outbounder Helper
return
HoldingSale:
{
    GuiControlGet ,HoldSale
    if(HoldSale){
        GuiControl, note: show, Staff
        GuiControl, note: show, staffTitle
    }else{
        GuiControl, note: hide, Staff
        GuiControl, note: hide, staffTitle
    }
    
    
        
    return
}
MobileHaveInternetCheckBox:
{
    GuiControlGet ,HaveInternet
    if(HaveInternet){
        GuiControl, note: show, Moblies
        GuiControl, note: show, MobliesTitle
        GuiControl, note: hide, MobliesWithNoInternet
        GuiControl, note: hide, MobliesWithNoInternetTitle
        
    }else{
        GuiControl, note: Hide, Moblies
        GuiControl, note: Hide, MobliesTitle
        GuiControl, note: show, MobliesWithNoInternet
        GuiControl, note: show, MobliesWithNoInternetTitle
        
    }
    
    
        
    return
    
}
NotesButtonOk:
if (Temp = 2) {
    msgBox, this is for relo
}
if ( Temp = 4 )
{   GuiControlGet ,CustName
    GuiControlGet ,Comment
    GuiControlGet ,HoldSale
    GuiControlGet ,Plans
    GuiControlGet ,TheISP
    GuiControlGet ,Moblies
    GuiControlGet ,MobliesWithNoInternet
    GuiControlGet ,Fetch
    GuiControlGet ,Modem
    GuiControlGet ,Voip
    GuiControlGet ,MyDateTime
    GuiControlGet ,Staff
    
    
    
    
    
    if(CustName){
        name = Customer: %CustName%`n
    }
    if(Comment){
        text = %Comment%
    }
    if(HoldSale){
        if(!Staff){
            MsgBox, To keep the sale you need to have you're staff ID
            Return
        }
        keepSale = Status:  Pass Back to me: %Staff%
    }
    if(Plans){
        plan = Plan: %Plans%`n
    }
    if(TheISP){
        Isp = ISP:%TheISP%`n
    }if( Moblies){
        mobiles = Moblies4G:%Moblies%`n
    }if(MobliesWithNoInternet){
        notInternetM = Moblies4G:%MobliesWithNoInternet%`n
    }
    if(Fetch){
        fetch =  fetch:%Fetch%`n
    }if(Modem){
        modem = modem:%Modem%`n
    }if(Voip){
        voip =  Voip:%Voip%`n
    }
    if(MyDateTime){
        date = %MyDateTime%
    }
}
        
    Gui, 2:Color, CAE1ED
    FormatTime, Dat1, %MyDateTime%, MMMM d yyyy
    theMainComment= % JEE_StrWrap(text, 50)
    Full =  %name%----------------COMMENTS----------------------------`n%theMainComment% `n---------------Aussie Broadband Quote-------- `n%plan%%Isp%%mobiles%%notInternetM%%fetch%%modem%%voip%CallBack:%Dat1%`n%keepSale% `n -----------------------------------------------------------              
    
    Gui, 2:Add, Edit, +Wrap w780 vResults, %Full%
    Gui, 2:Font, S8 C888888, Arial
    Gui, 2:Add, Text, x20 y+15 vResultsTxt +BackgroundTrans, Press copy button to save to clipbord, once done ctrl v into Widesales 2.0 notes section.
    Gui, 2:Add, Button, w105 h32 x686 yp-7 gCopy1 vCopy, Copy to Clipboard
    Gui, 2:Add, Button, w70 h32 x605 yp+0 gClose1 vClose1, Close
    GuiControl, 2:Focus, Copy
    Gui, 2:Font, S8 C555555, Arial
    gui 2:+AlwaysOnTop
    Gui, 2:Show, w800, Results
    return

NotesButtonSettings:
{
    Gui, Settings:Color, CAE1ED
    Gui, Settings:Add, Text, w120, 
    Gui, Settings:Add, button, gSaveProgramPos , Save Current Position
    Gui, Settings:Add, Button, w70 h32 x605 yp+0 gSettingsClose1, Close
    Gui, Settings:Font, S8 C888888, Arial
    Gui, Settings:Font, S8 C555555, Arial
    Gui, Settings:+AlwaysOnTop
    Gui, Settings:Show, w300 h100, Settings
    return
}

NotesButtonUpdate:
{
    msgbox, pulling new update
}

SaveProgramPos:
{   
	msgBox, saving location of Outbounder Helper
	WinGetPos, X, Y, W, H, Outbounder Helper
	WinGetTitle, Title, Outbounder Helper

	IniWrite, %Title%, settings/settings.ini, Outbounder Setting, Name
	IniWrite, %X%, settings/settings.ini, Outbounder Setting, PosX
	IniWrite, %Y%, settings/settings.ini, Outbounder Setting, PosY


	
}

SettingsClose1:
{
    Gui Settings:Destroy
}

Copy1:
Clipboard = %Full%
    Del = 
    Results = 
    Gui 2:Destroy
return

NotesButtonClear:
Reload
return

Close1:
    Gui 2:Destroy
return
;-----Holding helpers ------;
JEE_StrWrap(vText, vMaxLen, vNeedle:=" ", vSep:="`r`n")
        {
            local
            static vIsV1 := InStr(1, 1,, 0)
            vOutput := ""
            VarSetCapacity(vOutput, StrLen(vText)*2*2)
            vLenNeedle := StrLen(vNeedle)
            Loop
            {
                vLen := StrLen(vText)
                if (vLen <= vMaxLen)
                    return vOutput vText
                if (vLen <= vMaxLen + vLenNeedle)
                    vPos := InStr(vText, vNeedle, 1, -1 + vIsV1)
                else
                    vPos := InStr(vText, vNeedle, 1, vMaxLen + vLenNeedle - vLen - 1 + vIsV1)
                if !vPos
                    vPos := InStr(vText, vNeedle, 1, vMaxLen + 1)
                if !vPos
                    return vOutput vText
                vOutput .= SubStr(vText, 1, vPos-1) vSep
                vText := SubStr(vText, vPos+vLenNeedle)
            }
        }