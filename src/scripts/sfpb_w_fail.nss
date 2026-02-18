//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_w_fail
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
//#include "aps_include"
#include "sfpb_config"
int StartingConditional()
{
    // Vars
    object oPC = GetLastSpeaker(), oBanker = OBJECT_SELF;
    string sID = SF_GetPlayerID(oPC);
    int nGold = StringToInt(GetLocalString(OBJECT_SELF, "GOLD"));
    int nBanked = GetCampaignInt("BANK_GOLD", DATABASE_GOLD + sID);
    //int nBanked = GetPersistentInt(oBanker, DATABASE_GOLD + sID, "BANK_GOLD");
    // Check if the player has enough to withdraw
    return(nBanked < nGold);
}
