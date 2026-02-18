//::///////////////////////////////////////////////
//:: FileName s_pcl_list
//:://////////////////////////////////////////////
//:://////////////////////////////////////////////
//:: Created By: Scott Thorne
//:: Updated On: 08/27/2002
//:: Updated On: 12-20-2003  By AW Olorin
//      Modified to hide Anonymous DM's from total user count dsiplayed.
//      Modified by Milliorn
//
//:://////////////////////////////////////////////

void main()
{
    object oUser = GetLastUsedBy();
    string sName = GetName(oUser);
    int iPCTot = 0,  /* total PC's */
        iPCVis = 0,  /* total non-anon (visible) PC's */
        iDM = 0,     // Anonymous DM's online
        iLvl = 0;    // Allows for Legendary Levels
    string sPCName,
           sPCLevel,
           sDM,
           sMessage;

    if (GetLocalInt(OBJECT_SELF, "TIMER_" + sName) == TRUE)
    {
        FloatingTextStringOnCreature("<c ó >Anti Spamming Code - <cóóó>you may "+
        "only use this once per 6 seconds", oUser);
        SendMessageToPC(oUser,"<c ó >Anti Spamming Code - <cóóó>you may "+
        "only use this once per 6 seconds");
        SendMessageToAllDMs("<cþf >(Server List) Anti Spamming Code fired on </c>"
        + sName);
        return;
    }

    object oPC = GetFirstPC();
    while (oPC != OBJECT_INVALID)
    {
        iPCTot++;

        /* skip anonymous PC's*/
        if (GetLocalInt(oPC, "PCL_ANON") != 1)
        {
            iPCVis++;
            sPCName = "<có  >"+ GetName(oPC) + " ";
            iLvl = GetLootable(oPC);

        if (iLvl<41) iLvl = GetHitDice(oPC);
            sPCLevel = "<cóóó>Lvl: <c fþ>" + IntToString(iLvl) + " ";

        if (GetIsDM(oPC))
        {
            sDM = "<cÌwþ>[DM] ";
        }

        else
        {
            sDM = "";
        }

        sMessage = sPCName + sPCLevel + sDM;
        SendMessageToPC(oUser, sMessage);

    }

    else if (GetIsDM(oPC)) iDM++;  // Count anonymous DM's online
    oPC = GetNextPC();
}

    sMessage = "<có ó>[ <cóóó>" + IntToString(iPCVis) + "<có ó> players online! ]";
    SendMessageToPC(oUser, sMessage);
    SetLocalInt(OBJECT_SELF, "TIMER_" + sName, TRUE);
    DelayCommand(6.0, DeleteLocalInt(OBJECT_SELF, "TIMER_" + sName));
}

