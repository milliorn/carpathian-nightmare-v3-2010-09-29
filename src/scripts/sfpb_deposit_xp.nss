//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_deposit
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
//#include "aps_include"
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
    // Anti-Cheat Check For Duping Gold
    if (GetXP(oPC) >= nAmount)
    {
        // Take the deposited amount from the player and store
        // in the database
        nAmount = iXP / 2;
        SetXP(oPC, iXP - StringToInt(sAmount));
        int nBanked = GetCampaignInt("BANK_XP", DATABASE_XP + sID);
        //int nBanked = GetPersistentInt(oBanker, DATABASE_XP + sID, "BANK_XP");
        nTotal = nAmount + nBanked;
        SetCampaignInt("BANK_XP", DATABASE_XP + sID, nTotal);
        //SetPersistentInt(oBanker, DATABASE_XP + sID, nTotal, 0, "BANK_XP");
        SendMessageToAllDMs("<cÞhè>" + GetName(oPC) + " Has deposited <cþþ>" +
              IntToString(nAmount) + " XP</c> and has <cþþ>"+ IntToString(nTotal) +
                        " XP</c> banked and <cþþ>" + IntToString(GetXP(oPC)) +
                        " XP</c> left</c>");
    }
    else // Set Anti-Cheat Variable
        SetLocalInt(oBanker, "ANTI_CHEAT_XP", TRUE);

    // Set custom token
    SetCustomToken(1111, IntToString(nTotal));
}
