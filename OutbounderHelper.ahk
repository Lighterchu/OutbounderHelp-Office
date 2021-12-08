#SingleInstance, Force
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
Gui, Outbounder: Add, Text, section xm w80, Template:
Gui, Outbounder: Add, DropDownList,  w182 xp+54 yp-2 gMovs vTemp AltSubmit, Please select a template|| Relocation | Address Update |Take Notes|
;--------------Notes Main Fields -----------------------------
    Gui, Outbounder: Add, Text, section xm w80 vCustNameTitle,Customer Name:
    Gui, Outbounder: Add, Edit, vCustName w200 ys
    Gui, Outbounder: Add, Text, section xm w80 vCommentTitle, Comments:
    Gui, Outbounder: Add, Edit, vComment +Wrap w260 h100 ys
    Gui, Outbounder: Add, CheckBox, vHoldSale gHoldingSale, Tick this if you want to keep the sale and pass back to you?
    Gui, Outbounder: Add, Text, section xm w80 vstaffTitle, Staff ID:
    Gui, Outbounder: Add, Edit, vStaff w230 h20 ys
    Gui, Outbounder: Add, Text, section xm w80 vPlansTitle, NBN PLAN:
    Gui, Outbounder: Add, DropDownList, r5 vPlans w200,  |12/1 100GB + Casual VoIP Phone $50|12/1 Unlimited + Casual VoIP Phone|12/1 100GB + Casual VoIP Phone $60|12/1 $59 Base plan | 25/10 $60 100Gb | 25/10 $65 500GB| 25/10 $69 Unlimited| 50/20 $70 100GB| 50/20 $75 500GB| 50/20 Unlimited| 75/10 $79 Fixed Wireless | 75/20 $80 100GB| 75/20 $85 500GB| 75/20 $89 Unlimited| 100/20 $90 100GB| 100/20 $95 500GB| 100/20 $99 Unlimited| 100/40 $100 100GB| 100/40 $105 500GB| 100/40 $109 Unlimited| 250/25 $129 Unlimited| 1GIG/50 $149 Unlimited|                                                       
    Gui, Outbounder: Add, Text, section xm w80 vTheISPTitle,The ISP
    Gui, Outbounder: Add, DropDownList, r5 vTheISP,  |Telstra|TPG|OPTUS|DODO|Tangerine|Belong|Other|
    Gui, Outbounder: Add, CheckBox, vHaveInternet gMobileHaveInternetCheckBox,(Moblies) DO YOU HAVE AN INTERNET SERVICE WITH AUSSIE BROADBAND?
    Gui, Outbounder: Add, Text, section xm w80 vMobliesTitle, MOBILES 4G:
    Gui, Outbounder: Add, DropDownList, r5 vMoblies, |2GB $15|5GB $19|25GB $25|40GB $35|60GB $45|100GB $65|
    Gui, Outbounder: Add, Text, section xm w180 y320 vMobliesWithNoInternetTitle, MOBILES 4G With no Internet Plan:
    Gui, Outbounder: Add, DropDownList, r5 vMobliesWithNoInternet, |1GB $15|2.5GB $19|15GB $29|30GB $39|50GB $49| 80GB $69| 
    Gui, Outbounder: Add, Text, section xm w80 vFetchTitle, FETCH:
    Gui, Outbounder: Add, DropDownList, r2 vFetch, |Mini $10|Mighty $15|
    Gui, Outbounder: Add, Text, section xm w20 vModemTitle, MODEM: 
    Gui, Outbounder: Add, Edit, vModem w200 ys
    Gui, Outbounder: Add, Text, section xm w80 vVoipTitle, VOIP:
    Gui, Outbounder: Add, DropDownList, r2 vVoip, |Casual $0|Everday $10|International $20|
    Gui, Outbounder: Add, Text, section xm w80 vMyDateTimeTitle,Callback:
    Gui, Outbounder: Add, DateTime, vMyDateTime, dd/MM/yyyy
;------------------------------------------------------------------------

;-------------all for the Notes template---------
    ;---Text boxs------
    GuiControl, Outbounder: hide, CustName
    GuiControl, Outbounder: Hide, Comment
    GuiControl, Outbounder: Hide, HoldSale
    GuiControl, Outbounder: Hide, Plans
    GuiControl, Outbounder: Hide, TheISP
    GuiControl, Outbounder: Hide, Moblies
    GuiControl, Outbounder: Hide, MobliesWithNoInternet
    GuiControl, Outbounder: Hide, Fetch
    GuiControl, Outbounder: Hide, Modem
    GuiControl, Outbounder: Hide, Moblies
    GuiControl, Outbounder: Hide, Voip
    GuiControl, Outbounder: Hide, MyDateTime
    GuiControl, Outbounder: Hide, Staff
    --------------------------
    ;----Title for the txt boxs----
    GuiControl, Outbounder: Hide, CustNameTitle
    GuiControl, Outbounder: Hide, CommentTitle
    GuiControl, Outbounder: Hide, HoldSale
    GuiControl, Outbounder: Hide, PlansTitle
    GuiControl, Outbounder: Hide, TheISPTitle
    GuiControl, Outbounder: Hide, MobliesTitle
    GuiControl, Outbounder: Hide, MobliesWithNoInternetTitle
    GuiControl, Outbounder: Hide, FetchTitle
    GuiControl, Outbounder: Hide, ModemTitle
    GuiControl, Outbounder: Hide, VoipTitle
    GuiControl, Outbounder: Hide, MyDateTimeTitle
    GuiControl, Outbounder: Hide, staffTitle
    ;-------------------------------------
    ;-----Buttons----------------
    Gui, Outbounder: Add, Button, gOutboundersButtonOk vOk y125 w90 x170, Ok
    Gui, Outbounder: Add, Button, gOutboundersButtonClear vClear w90 x110, Clear
    Gui, Outbounder: Add, Button, gOutboundersButtonClose vCls w100 x200, Close
    Gui, Outbounder: Add, Button, gOutboundersButtonSettings vSettings y125 w100 x0, Settings
    gui Outbounder: add, Button, gOutboundersButtonUpdate vUpdates y100 w100 x0, update
;-------------------------------------------------------------------------;


;--------------Relocation Main Fields -----------------------------
    Gui, Outbounder: Add, Text, section xm w80 y50 vReloCustNameTitle,Customer Name:
    Gui, Outbounder: Add, Edit, vReloCustName w200 ys
    Gui, Outbounder: Add, Text, section xm w80 y80 vReloOlderAddressTitle,Current Address:
    Gui, Outbounder: Add, Edit, vReloOlderAddress w200 ys
    Gui, Outbounder: Add, Text, section xm w80 y110 vReloNewAddressTitle,New Address:
    Gui, Outbounder: Add, Edit, vReloNewAddress w200 ys
   
    Gui, Outbounder: Add, CheckBox, vReloHasTechAppointment gReloTechAppointmentTicked y140 x10, Tick this if they have tech appointment?
    Gui, Outbounder: Add, CheckBox, vReloHasFetch y160 x10, Tick this if they have a fetch Boxes?
    Gui, Outbounder: Add, CheckBox, vReloHasMoblies y180 x10, Tick this if they have a Moblies?
    Gui, Outbounder: Add, CheckBox, vReloHasDisconnectingDate gReloDisconnectTicked y200 x10, Tick this if they have a disconnecting date?
    
    GuiControl, Outbounder: Hide, ReloHasTechAppointment
   
    Gui, Outbounder: Add, Text, section xm w100 y250 x10 vReloConnectionDate,Connection date:
    Gui, Outbounder: Add, DateTime, vReloDateTimeConnection, dd/MM/yyyy
    Gui, Outbounder: Add, Text, section xm w100 y290 x10 vReloDiconnectionDate,Disconnect date:
    Gui, Outbounder: Add, DateTime, vReloDateTimeDiconnect, dd/MM/yyyy
   

;------------------------------------------------------------------------


;-------------all for the Relocation template---------
    ;---Text boxs------
    GuiControl, Outbounder: hide, ReloCustName
    GuiControl, Outbounder: hide, ReloNewAddress
    GuiControl, Outbounder: hide, ReloOlderAddress
    
    --------------------------
    ;----Title for the txt boxs----
    GuiControl, Outbounder: Hide, ReloCustNameTitle
    GuiControl, Outbounder: Hide, ReloNewAddressTitle
    GuiControl, Outbounder: Hide, ReloOlderAddressTitle

    ;---DatesField-------------------------------------
    GuiControl, Outbounder: Hide, ReloDiconnectionDate
    GuiControl, Outbounder: Hide, ReloDateTimeDiconnect
    
    ;-------------------------------------
    ;-----Buttons----------------

    ;----------------------------
;-------------------------------------------------------------------------;


;---------Buttons Control---
GuiControl, Outbounder: Hide, Sub
;when update is a thing not yet
GuiControl, Outbounder: hide,Updates, 
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

	


gui Outbounder:+AlwaysOnTop
Gui, Outbounder: Show, w270 h150 x%posx% y%posy% ,Outbounder Helper
return
OutboundersButtonClose:
{
    MsgBox, 4, , Do you want to close dialogue? (Press YES or NO)
    IfMsgBox No
        return
    Gui, Destroy
    Exit
}
Movs:
        GuiControlGet, Temp,
        if ( Temp = 1){

                ;Hiding the relocation Template
                GuiControl,Hide, ReloCustName
                GuiControl,Hide, ReloNewAddress
                GuiControl,Hide, ReloOlderAddress
                
            
                
                GuiControl,Hide, ReloCustNameTitle
                GuiControl,Hide, ReloNewAddressTitle
                GuiControl,Hide, ReloOlderAddressTitle

                
                
                GuiControl,Hide, ReloHasFetch
                GuiControl,Hide, ReloHasMoblies
                GuiControl,Hide, ReloHasDisconnectingDate
                GuiControl,Hide, ReloDiconnectionDate
                GuiControl,Hide, ReloDateTimeConnection
                GuiControl,Hide, ReloDateTimeDiconnect
                GuiControl,Hide, ReloConnectionDate
                GuiControl,Hide ,ReloHasTechAppointment

                ;------------------------------
                
                ;Hiding the notes Template
                GuiControl,Hide, CustNameTitle
                GuiControl,Hide, CommentTitle
                GuiControl,Hide, HoldSale
                GuiControl,Hide, PlansTitle
                GuiControl,Hide, TheISPTitle
                GuiControl,Hide, MobliesTitle
                GuiControl,hide, MobliesWithNoInternetTitle
                GuiControl,Hide, FetchTitle
                GuiControl,Hide, ModemTitle
                GuiControl,Hide, VoipTitle
                GuiControl,Hide, MyDateTimeTitle
                                
                
                
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
                ;-----------------------------
               
                
                GuiControl, Hide, Sub
                GuiControl, Move, Cls, y50
                GuiControl, Move, Settings, y50 x10
                
                ;when update is a thing not yet
                
        }


        ;Relocation
        if ( Temp = 2) {

                ;making sure that we dont show the other templates
                GuiControl, Outbounder: Hide, CustNameTitle
                GuiControl, Outbounder: Hide, CommentTitle
                GuiControl, Outbounder: Hide, HoldSale
                GuiControl, Outbounder: Hide, PlansTitle
                GuiControl, Outbounder: Hide, TheISPTitle
                GuiControl, Outbounder: Hide, MobliesTitle
                GuiControl, Outbounder: hide, MobliesWithNoInternetTitle
                GuiControl, Outbounder: Hide, FetchTitle
                GuiControl, Outbounder: Hide, ModemTitle
                GuiControl, Outbounder: Hide, VoipTitle
                GuiControl, Outbounder: Hide, MyDateTimeTitle
                                
                
                
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



        
        GuiControl, Outbounder: show, ReloCustName
        GuiControl, Outbounder: show, ReloOlderAddress
        GuiControl, Outbounder: show, ReloNewAddress
       
        GuiControl, show, ReloHasFetch
        GuiControl, show, ReloHasMoblies
        GuiControl, show, ReloHasDisconnectingDate
        GuiControl, show, ReloDateTimeConnection
        GuiControl, hide, ReloDateTimeDiconnect


        
       
        
        GuiControl, Outbounder: show, ReloCustNameTitle
        GuiControl, Outbounder: show, ReloOlderAddressTitle
        GuiControl, Outbounder: show, ReloNewAddressTitle
       


        GuiControl, Move, Ok, y360 x120
        GuiControl, Move, Cls, y335 x219
        GuiControl, Move, Clear, y335 x120
        GuiControl, Move, Settings, y335 x10
       

        Gui, Show, Autosize, Outbounder Helper
        return
        }

        if ( Temp = 3 ) 
            {
                
                ;Hiding the relocation Template
                GuiControl,Hide, ReloCustName
                GuiControl,Hide, ReloNewAddress
                GuiControl,Hide, ReloOlderAddress
                
            
                
                GuiControl,Hide, ReloCustNameTitle
                GuiControl,Hide, ReloNewAddressTitle
                GuiControl,Hide, ReloOlderAddressTitle

                
                
                GuiControl,Hide, ReloHasFetch
                GuiControl,Hide, ReloHasMoblies
                GuiControl,Hide, ReloHasDisconnectingDate
                GuiControl,Hide, ReloDiconnectionDate
                GuiControl,Hide, ReloDateTimeConnection
                GuiControl,Hide, ReloDateTimeDiconnect
                GuiControl,Hide, ReloConnectionDate
                GuiControl,Hide ,ReloHasTechAppointment

                ;------------------------------


                GuiControl,Hide, ReloCustName
                GuiControl,Hide, ReloNewAddress
                GuiControl,Hide, ReloOlderAddress
                
            
                
                GuiControl,Hide, ReloCustNameTitle
                GuiControl,Hide, ReloNewAddressTitle
                GuiControl,Hide, ReloOlderAddressTitle
                

                GuiControl,Hide, CustNameTitle
                GuiControl,Hide, CommentTitle
                GuiControl,Hide, HoldSale
                GuiControl,Hide, PlansTitle
                GuiControl,Hide, TheISPTitle
                GuiControl,Hide, MobliesTitle
                GuiControl,hide, MobliesWithNoInternetTitle
                GuiControl,Hide, FetchTitle
                GuiControl,Hide, ModemTitle
                GuiControl,Hide, VoipTitle
                GuiControl,Hide, MyDateTimeTitle
                                
                
                
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
                return
            }
        ;Taking Notes     
        if  ( Temp = 4 )
            {   
                ;Hiding the relocation Template
                GuiControl,Hide, ReloCustName
                GuiControl,Hide, ReloNewAddress
                GuiControl,Hide, ReloOlderAddress
                
            
                
                GuiControl,Hide, ReloCustNameTitle
                GuiControl,Hide, ReloNewAddressTitle
                GuiControl,Hide, ReloOlderAddressTitle

                
                
                GuiControl,Hide, ReloHasFetch
                GuiControl,Hide, ReloHasMoblies
                GuiControl,Hide, ReloHasDisconnectingDate
                GuiControl,Hide, ReloDiconnectionDate
                GuiControl,Hide, ReloDateTimeConnection
                GuiControl,Hide, ReloDateTimeDiconnect
                GuiControl,Hide, ReloConnectionDate
                GuiControl,Hide ,ReloHasTechAppointment

                ;------------------------------
            
                GuiControl, hide, ReloCustName
                GuiControl, hide, ReloOlderAddress
                GuiControl, hide, ReloNewAddress

                GuiControl, hide, ReloHasFetch
                GuiControl, hide, ReloHasMoblies
                GuiControl, hide, ReloHasDisconnectingDate
                GuiControl, hide, ReloDateTimeConnection
                GuiControl, hide, ReloDateTimeDiconnect



                
                    
                
                    
                GuiControl,  hide, ReloCustNameTitle
                GuiControl,  hide, ReloOlderAddressTitle
                GuiControl, hide, ReloNewAddressTitle
                        
                
                
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
                
                
                
                GuiControl, Outbounder: show, CustNameTitle
                GuiControl, Outbounder: show, CommentTitle
                GuiControl, Outbounder: show, PlansTitle
                GuiControl, Outbounder: show, TheISPTitle
                GuiControl, Outbounder: hide, MobliesTitle
                GuiControl, Outbounder: show, FetchTitle
                GuiControl, Outbounder: show, ModemTitle
                GuiControl, Outbounder: show, HaveInternet
                GuiControl, Outbounder: show, MobliesWithNoInternetTitle
                GuiControl, Outbounder: show, VoipTitle
                GuiControl, Outbounder: show, MyDateTime
                GuiControl, Outbounder: show, MyDateTimeTitle
            
                    
            
                GuiControl, Move, Ok, x350 y570
                GuiControl, Move, Cls, x90 y570
                GuiControl, Move, Clear, x0 y570
                GuiControl, Move, Settings, y120 x1
                GuiControl, +Redraw, Ok
                Gui, Show, Autosize, Outbounder Helper
                
                return
            }
            
    else        

                ;Hiding the relocation Template
                GuiControl,Hide, ReloCustName
                GuiControl,Hide, ReloNewAddress
                GuiControl,Hide, ReloOlderAddress
                
            
                
                GuiControl,Hide, ReloCustNameTitle
                GuiControl,Hide, ReloNewAddressTitle
                GuiControl,Hide, ReloOlderAddressTitle

                
                
                GuiControl,Hide, ReloHasFetch
                GuiControl,Hide, ReloHasMoblies
                GuiControl,Hide, ReloHasDisconnectingDate
                GuiControl,Hide, ReloDiconnectionDate
                GuiControl,Hide, ReloDateTimeConnection
                GuiControl,Hide, ReloDateTimeDiconnect
                GuiControl,Hide, ReloConnectionDate
                GuiControl,Hide ,ReloHasTechAppointment

                ;------------------------------
                

                GuiControl,Hide, CustNameTitle
                GuiControl,Hide, CommentTitle
                GuiControl,Hide, HoldSale
                GuiControl,Hide, PlansTitle
                GuiControl,Hide, TheISPTitle
                GuiControl,Hide, MobliesTitle
                GuiControl,hide, MobliesWithNoInternetTitle
                GuiControl,Hide, FetchTitle
                GuiControl,Hide, ModemTitle
                GuiControl,Hide, VoipTitle
                GuiControl,Hide, MyDateTimeTitle
                                
                
                
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
        GuiControl, Outbounder: show, Staff
        GuiControl, Outbounder: show, staffTitle
    }else{
        GuiControl, Outbounder: hide, Staff
        GuiControl, Outbounder: hide, staffTitle
    }
    
    
        
    return
}
MobileHaveInternetCheckBox:
{
    GuiControlGet ,HaveInternet
    if(HaveInternet){
        GuiControl, Outbounder: show, Moblies
        GuiControl, Outbounder: show, MobliesTitle
        GuiControl, Outbounder: hide, MobliesWithNoInternet
        GuiControl, Outbounder: hide, MobliesWithNoInternetTitle
        
    }else{
        GuiControl, Outbounder: Hide, Moblies
        GuiControl, Outbounder: Hide, MobliesTitle
        GuiControl, Outbounder: show, MobliesWithNoInternet
        GuiControl, Outbounder: show, MobliesWithNoInternetTitle
        
    }
    
    
        
    return
    
}

ReloDisconnectTicked:
{
    GuiControlGet ,ReloHasDisconnectingDate
    if(ReloHasDisconnectingDate){
        GuiControl, Outbounder: show, ReloDiconnectionDate
        GuiControl, Outbounder: show, ReloDateTimeDiconnect
        
    }else{
        GuiControl, Outbounder: Hide, ReloDiconnectionDate
        GuiControl, Outbounder: Hide, ReloDateTimeDiconnect
    }
    
    
        
    return
    
}
ReloTechAppointmentTicked: 
{
    GuiControlGet ,ReloHasTechAppointment
    if(ReloHasTechAppointment){
        GuiControl, Outbounder: hide, ReloConnectionDate
        GuiControl, Outbounder: hide, ReloDateTimeConnection
        
    }else{
        GuiControl, Outbounder: show, ReloConnectionDate
        GuiControl, Outbounder: show, ReloDateTimeConnection
    }
    return
}


OutboundersButtonOk:
if (Temp = 2) {
    flag = 2
    GuiControlGet ,ReloCustName
    GuiControlGet ,ReloOlderAddress
    GuiControlGet ,ReloNewAddress
    GuiControlGet ,ReloHasFetch
    GuiControlGet ,ReloHasMoblies
    GuiControlGet ,ReloHasDisconnectingDate
    GuiControlGet ,ReloDateTimeConnection
    GuiControlGet ,ReloDateTimeDiconnect
   

}
if ( Temp = 4 ){   
    flag = 4
    GuiControlGet ,CustName
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
    if (flag = 2) {
        Gui, Relo:Color, CAE1ED
        FormatTime, connect, %ReloDateTimeConnection%, MMMM d yyyy
        FormatTime, disconnect, %ReloDateTimeDiconnect%, MMMM d yyyy
        connectingInfo  = 
        disconnectingInfo = 
        intro =
        (
        Dear %ReloCustName%,
        Thank you for your time today.
        As discussed with you on the phone, we have arranged the relocation of your service from your old address at 
        %ReloOlderAddress% 
        to your new address of %ReloNewAddress%.
        )
        
        
        if(ReloHasTechAppointment){
            ;to make it possible to line up the text
             AutoTrim, off 
            spacing = ; initialise
            Loop, 7
                spacing =%spacing%%A_Space%
            
            connectingInfo = %spacing% Your new service will be connected soon after the tech appointment.
        }else {
            ;to make it possible to line up the text
             AutoTrim, off 
            spacing = ; initialise
            Loop, 7
                spacing =%spacing%%A_Space%
            connectingInfo = %spacing% 1-5 days from the date of %connect%
        }

        if(!ReloHasDisconnectingDate){
             ;to make it possible to line up the text
             AutoTrim, off 
            spacing = ; initialise
            Loop, 7
                spacing =%spacing%%A_Space%
            disconnectingInfo = %spacing% We will close off your old service up to 5 days after your new service goes live.
        }else{
             ;to make it possible to line up the text
             AutoTrim, off 
            spacing = ; initialise
            Loop, 7
                spacing =%spacing%%A_Space%
           disconnectingInfo = %spacing% I have arranged the closure of your previous service for %disconnect%
        }

       
        fetch = 
        moblie = 
        if(ReloHasMoblies){
           moblie = I have also arranged for the address of your Moblie service to be updated to your new address.`n
        }

        if(ReloHasFetch){
            ;To fix the spacing
            if(ReloHasMoblies) {
                AutoTrim, off 
                spacing = ; initialise
                Loop, 7
                    spacing =%spacing%%A_Space%
                fetch =%spacing% I have also arranged for the address of your Fetch service to be updated to your new address.
                
            }else {
                 fetch = I have also arranged for the address of your Fetch service to be updated to your new address.
            }
        }
        
        ending = 
        (
        %moblie%%fetch%
        If you have any further questions, please feel free to contact us on 1300 880 905, or simply reply to this email.
        Thank you again
        )
        
       
        Full = %intro%`n%connectingInfo% `n%disconnectingInfo% `n      %A_Space%%ending%
        Gui, Relo:Add, Edit, +Wrap w800 vResults, %Full%
        Gui, Relo:Add, Button, w105 h32 x686 yp+170 gCopy1 vCopy, Copy to Clipboard
        Gui, Relo:Add, Text, x20 yp+5 vResultsTxt +BackgroundTrans, Press copy Copy to Clipboard, once done ctrl v into Email.
        Gui, Relo:Add, Button, w70 h32 x605 yp-5 gClose1 , Close
        Gui, Relo:Show, w830 h220, Results
    }
    
;     Dear XXX,
; Thank you for your time today.
; As discussed with you on the phone, we have arranged the relocation of your service from your old address at XXX to your new address of XXX.
; Your new service will be connected soon after the tech appointment OR 1-5 days from the date of XXDATE-OF-CONNECTIONXX
; I have arranged the closure of your previous service for XXDATEXX
; OR
; We will close off your old service up to 5 days after your new service goes live
; OR
; You will need to call us back to arrange closure of your old service when you are ready for it to close off.
; I have also arranged for the address of your *Fetch/Mobile* service to be updated to your new address.
; If you have any further questions, please feel free to contact us on 1300 880 905, or simply reply to this email.
; Thank you again


    if (flag = 4) {
        Gui, notes:Color, CAE1ED
        FormatTime, Dat1, %MyDateTime%, MMMM d yyyy
        theMainComment= % JEE_StrWrap(text, 50)
        Full =  %name%----------------COMMENTS----------------------------`n%theMainComment% `n---------------Aussie Broadband Quote-------- `n%plan%%Isp%%mobiles%%notInternetM%%fetch%%modem%%voip%CallBack:%Dat1%`n%keepSale% `n -----------------------------------------------------------              
        
        Gui, notes:Add, Edit, +Wrap w780 vResults, %Full%
        Gui, notes:Font, S8 C888888, Arial
        Gui, notes:Add, Text, x20 y+15 vResultsTxt +BackgroundTrans, Press copy button to save to clipbord, once done ctrl v into Widesales 2.0 Outbounders section.
        Gui, notes:Add, Button, w105 h32 x686 yp-7 gCopy1 vCopy, Copy to Clipboard
        Gui, notes:Add, Button, w70 h32 x605 yp+0 gNotesClose1 vClose1, Close
        GuiControl, notes:Focus, Copy
        Gui, notes:Font, S8 C555555, Arial
        gui notes:+AlwaysOnTop
        Gui, notes:Show, w800, Results
        return
    }    
    
    return
   

OutboundersButtonSettings:
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

OutboundersButtonUpdate:
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

OutboundersButtonClear:
Reload
return

NotesClose1:
    Gui notes:Destroy
return

Close1:
    Gui Relo:Destroy
return



;-----helpers ------;
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

;  Spacing(vNumberOfSpaceing){
;     AutoTrim, off 
;     String = "" ; initialise
;     Loop, vNumberOfSpaceing
;         String =%String%%A_Space%
;     return String
;  }