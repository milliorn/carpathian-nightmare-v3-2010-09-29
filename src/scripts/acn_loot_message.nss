//:://////////////////////////////////////////////
/*
    Put into: OnItemAcquire Event

*/
//:://////////////////////////////////////////////
//:: Created By: Milliorn
//:://////////////////////////////////////////////
//Send Faction Message
void SendMsgToFactionWithinDistance(object oPC, string sMessage, float fDist);
void SendMsgToFactionWithinDistance(object oPC, string sMessage, float fDist)
{
    object oFaction = GetFirstFactionMember(oPC),
           oArea = GetArea(oPC);
    while (GetIsObjectValid(oFaction))
    {
        if (GetArea(oFaction) == oArea && GetDistanceBetween(oPC, oFaction) <= fDist)
        {
            DelayCommand(0.3, SendMessageToPC(oFaction, sMessage));
        }
            oFaction = GetNextFactionMember(oPC);
    }
}

#include "x2_inc_switches"
void main()
{
    object oPC = GetModuleItemAcquiredBy(),
           oFrom = GetModuleItemAcquiredFrom(),
           oItem = GetModuleItemAcquired();
    string sPlayerName = GetName (oPC),
           sItemOwnerName = GetName (oFrom);
    string sName = GetName(oItem);

    SetIdentified(oItem, TRUE);
    DelayCommand(1.0, SetStolenFlag(oItem, FALSE));

     // * Generic Item Script Execution Code
     // * If MODULE_SWITCH_EXECUTE_TAGBASED_SCRIPTS is set to TRUE on the module,
     // * it will execute a script that has the same name as the item's tag
     // * inside this script you can manage scripts for all events by checking against
     // * GetUserDefinedItemEventNumber(). See x2_it_example.nss
/*     if (GetModuleSwitchValue(MODULE_SWITCH_ENABLE_TAGBASED_SCRIPTS) == TRUE)
        {
        SetUserDefinedItemEventNumber(X2_ITEM_EVENT_ACQUIRE);

        int nRet =   ExecuteScriptAndReturnInt(GetUserDefinedItemEventScriptName(oItem),OBJECT_SELF);
        if (nRet == X2_EXECUTE_SCRIPT_END)
                {
                 return;
                }
        }
*/
    ExecuteScript("acn_purge_item", oItem);

    if (!GetIsPC(oPC)) return;

    if (sName == "")
    {
         SendMsgToFactionWithinDistance(oPC,"<cfÌþ>" + sPlayerName +
         "<cóóó> accquired <cóó >Gold Pieces", 30.0);
    }

    else
    {
        if (oFrom == OBJECT_INVALID)return;
            SendMsgToFactionWithinDistance(oPC,"<cfÌþ>"+ sPlayerName +
            "<cóóó> accquired <c óó>" + sName, 30.0);
    }

    if (GetIsPC(oFrom) && GetIsPC(oPC))
    {
        ExportSingleCharacter(oFrom);
        SendMessageToPC(oFrom, "<c ó >Character Saved</c>");
        ExportSingleCharacter(oPC);
        SendMessageToPC(oPC, "<c ó >Character Saved</c>");
    }

    if (GetLocalInt(oFrom, "STOP_PICK_ABUSE") == TRUE)
    {
        SendMessageToAllDMs(sPlayerName + "<cþf > has possibly stolen </c>"+ sName +
        "<cþf > from </c>"+sItemOwnerName+"<có  > an has been punished for repeated"+
        " attempts at pickpocketing more than once per 12 seconds!!!");
        SendMessageToPC(oFrom, "<cóó >Punished for repeated"+
        " attempts at pickpocketing more than once per 12 seconds!!!");
        FloatingTextStringOnCreature("<cóó >Punished for repeated"+
        " attempt at pickpocketing more than once per 12 seconds", oFrom);
        ClearAllActions(FALSE);
        SetActionMode(oPC, ACTION_MODE_STEALTH, FALSE);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneParalyze(), oFrom, 6.0);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(), oFrom, 6.0);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oFrom, 6.0);

        return;
    }

    if (GetStolenFlag(oItem) == TRUE && GetIsPC(oFrom))
    {
        SendMessageToAllDMs(sPlayerName + "<cþf > has possibly stolen </c>"+ sName +
        "<cþf > from </c>"+sItemOwnerName+".</c>");
        SetStolenFlag(oItem, FALSE);
        SetLocalInt(oFrom, "STOP_PICK_ABUSE", TRUE);
        DelayCommand(12.0, DeleteLocalInt(oFrom, "STOP_PICK_ABUSE"));

    }


}

// Color Text Constsants
//const string TXT_COLOR_GRAY       = "<c°°°>"; // Gray
//const string TXT_COLOR_WHITE      = "<cóóó>"; // White
//const string TXT_COLOR_CYAN       = "<c óó>"; // Light Cyan
//const string TXT_COLOR_MAGENTA    = "<có ó>"; // Magenta
//const string TXT_COLOR_YELLOW     = "<cóó >"; // Yellow
//const string TXT_COLOR_RED        = "<có  >"; // Red
//const string TXT_COLOR_ORANGE     = "<cþf >"; // Orange
//const string TXT_COLOR_GREEN      = "<c ó >"; // Green
//const string TXT_COLOR_LIGHT_BLUE = "<cfÌþ>"; // Light BlueBlue
//const string TXT_COLOR_DARK_BLUE  = "<c fþ>"; // Dark Blue
//const string TXT_COLOR_PURPLE     = "<cÌwþ>";
//const string TXT_COLOR_NONE       = "";       // Default (no color)
//const string TXT_COLOR_END        = "</c>";   // (color end TAG)
//const string TXT_COLOR_DEFAULT    = TXT_COLOR_YELLOW;
