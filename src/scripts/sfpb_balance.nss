//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_balance
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
#include "aps_include"
#include "sfpb_config"
void main()
{
    // Vars
    object oPC = GetLastSpeaker();
    string sID = SF_GetPlayerID(oPC);
    int nBanked = GetCampaignInt("BANK_GOLD", DATABASE_GOLD + sID);
    //int nBanked = GetPersistentInt(oPC, DATABASE_GOLD + sID, "BANK_GOLD");
    // Set custom token for the account balance
    SetCustomToken(1000, IntToString(nBanked));
}
