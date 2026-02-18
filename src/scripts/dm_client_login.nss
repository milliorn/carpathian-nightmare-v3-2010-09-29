void main()
{
    object oPC = GetEnteringObject();
    string sName = GetPCPublicCDKey(oPC);
    string sLogin = GetPCPlayerName(oPC);

    if (sName == "QG6CXEYC" || //milliorn
        sName == "Q76A43RL" || //milliorn
        sName == "QG6QREW7" || //fooshwa
        sName == "QCRWUXFF" || //bassmaster
        sName == "QC74AN4H")   //tartmaster
    {
        SendMessageToAllDMs("<c ó >Entering DM's CD Key has been VERIFIED: </c>" +
        sName + "<c ó > Account: </c>" + GetPCPlayerName(GetEnteringObject())+
        "<c ó > IP: </c>" + GetPCIPAddress(oPC));
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectVisualEffect(VFX_DUR_PDK_FEAR)), oPC);
        //ExecuteScript("fky_chat_clenter", OBJECT_SELF);
        //ExecuteScript("acn_journal", OBJECT_SELF);
        return;
    }

    else
    {
        SendMessageToAllDMs("<có  >Entering DM's CD Key has been DENIED: </c>" + sName+
        "<có  > Account: </c>"+GetPCPlayerName(GetEnteringObject())+ "<có  > IP: </c>"+GetPCIPAddress(oPC));

        WriteTimestampedLogEntry("Entering DM's CD Key has been DENIED: " + sName+
        " Account: "+GetPCPlayerName(GetEnteringObject())+ " IP: "+GetPCIPAddress(oPC));
        BootPC(oPC);
    }
}
