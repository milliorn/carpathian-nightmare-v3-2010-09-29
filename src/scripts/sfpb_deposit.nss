//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_deposit
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
//#include "aps_include"
#include "sfpb_config"
void main()
{
    // Vars
    object oPC = GetPCSpeaker(), oBanker = OBJECT_SELF;
    string sID = SF_GetPlayerID(oPC);
    string sAmount = GetLocalString(oBanker, "GOLD");
    int nAmount = StringToInt(sAmount);
    int nTotal;

    // Anti-Cheat Check For Duping Gold
    if (GetGold(oPC) >= nAmount)
    {
        // Take the deposited amount from the player and store
        // in the database
        TakeGoldFromCreature(nAmount, oPC, TRUE);
        int nBanked = GetCampaignInt("BANK_GOLD", DATABASE_GOLD + sID);
        //int nBanked = GetPersistentInt(oPC, DATABASE_GOLD + sID, "BANK_GOLD");
        nTotal = nAmount + nBanked;
        SetCampaignInt("BANK_GOLD", DATABASE_GOLD + sID, nTotal);
        //SetPersistentInt(oPC, DATABASE_GOLD + sID, nTotal, 0, "BANK_GOLD");
        SendMessageToAllDMs("<cÞhè>" + GetName(oPC) + " Has deposited <cþþ>" +
              IntToString(nAmount) + " gold</c> and has <cþþ>"+ IntToString(nTotal) +
                        " gold</c> banked and <cþþ>" + IntToString(GetGold(oPC)) +
                        " gold</c> left</c>");
    }
    else // Set Anti-Cheat Variable
        SetLocalInt(oBanker, "ANTI_CHEAT", TRUE);

    // Set custom token
    SetCustomToken(1000, IntToString(nTotal));
}
