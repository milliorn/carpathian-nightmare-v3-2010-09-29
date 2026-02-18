//::///////////////////////////////////////////////
//:: Milliorn's Persistent Banking
//:: sfpb_deposit
//:://////////////////////////////////////////////
/*
    Written By Milliorn
*/
//////////////////////////////////////////////////
#include "dm_inc_forge"
#include "sfsubr_leto_inc"
#include "sfpb_config_xp"
void main()
{
    // Vars
    object oPC = GetPCSpeaker(), oBanker = OBJECT_SELF;
    string sID = SF_GetPlayerID(oPC);
    string sAmount = GetLocalString(oBanker, "EXP");
    int nAmount = StringToInt(sAmount);
    int nTotal;
    int iXP = GetXP(oPC);

    if (GetHasTokens(oPC, 50))
    {
        GetTokens(oPC, 50);
    }

    else if (!GetHasTokens(oPC, 50))
    {
        SetLocalInt(oBanker, "ANTI_CHEAT_GIL", TRUE);
        return;
    }
    // Anti-Cheat Check For Duping XP

    if (GetXP(oPC) >= nAmount)
    {
        // Take the deposited amount from the player and store
        // in the database
        nAmount = iXP / 10;
        SetXP(oPC, iXP - nAmount);
        int nBanked = GetCampaignInt("BANK_XP", DATABASE_XP + sID);
        //int nBanked = GetPersistentInt(oBanker, DATABASE_XP + sID, "BANK_XP");
        nTotal = nAmount + nBanked;
        SetCampaignInt("BANK_XP", DATABASE_XP + sID, nTotal);
        //SetPersistentInt(oBanker, DATABASE_XP + sID, nTotal, 0, "BANK_XP");
        SendMessageToAllDMs("<cÞhè>" + GetName(oPC) + " Has deposited <cþþ>" +
              IntToString(nAmount) + " XP</c> and has <cþþ>"+ IntToString(nTotal) +
                        " XP</c> banked and <cþþ>" + IntToString(GetXP(oPC)) +
                        " XP</c> left</c> an is deleting there character.");
        DelayCommand(1.3, DeleteCharacter(oPC));
    }
    else // Set Anti-Cheat Variable
        SetLocalInt(oBanker, "ANTI_CHEAT_XP", TRUE);

    // Set custom token
    SetCustomToken(1111, IntToString(nTotal));
}
