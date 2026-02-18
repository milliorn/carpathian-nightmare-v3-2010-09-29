// Scarface's Display Save Info

// Displays save results for a specific spell
// object oTarget   = The spell target
// iDC              = The spell DC
// iSave            = The save
// iRoll            = The dice roll
// string sSaveType = The text string of the save type
// oCaster          = The spell caster
void DisplaySaveMessage(object oTarget, int iDC, int iSave, int iRoll, string sSaveType, object oCaster = OBJECT_SELF);
void DisplaySaveMessage(object oTarget, int iDC, int iSave, int iRoll, string sSaveType, object oCaster = OBJECT_SELF)
{
    string sSave;
    if (iRoll + iSave < iDC)
    {
        sSave = "<cfÌþ>"+sSaveType+" : *failure* : ";
    }
    else
    {
        sSave = "<c fþ>"+sSaveType+" : *success* : ";
    }
    SendMessageToPC(oTarget, "<cÌwþ>"+GetName(oTarget)+" </c>"+sSave+"("+IntToString(iRoll)+" + "+IntToString(iSave)+" = "+IntToString(iRoll + iSave)+" vs. DC: "+IntToString(iDC)+")</c>");
    SendMessageToPC(oCaster, "<cÌwþ>"+GetName(oTarget)+" </c>"+sSave+"("+IntToString(iRoll)+" + "+IntToString(iSave)+" = "+IntToString(iRoll + iSave)+" vs. DC: "+IntToString(iDC)+")</c>");
}
