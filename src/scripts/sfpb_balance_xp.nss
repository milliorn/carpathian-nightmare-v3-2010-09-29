//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_balance
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
    object oPC = GetLastSpeaker(), oBanker = OBJECT_SELF;
    string sID = SF_GetPlayerID(oPC);
    int nBanked = GetCampaignInt("BANK_XP", DATABASE_XP + sID);
    //int nBanked = GetPersistentInt(oBanker, DATABASE_XP + sID, "BANK_XP");
    // Set custom token for the account balance
    SetCustomToken(1111, IntToString(nBanked));
}
