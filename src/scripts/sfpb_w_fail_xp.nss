//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_w_fail
//:://////////////////////////////////////////////
/*
    Written By Scarface
*/
//////////////////////////////////////////////////
//#include "aps_include"
#include "sfpb_config_xp"
int StartingConditional()
{
    // Vars
    object oPC = GetLastSpeaker();
    string sID = SF_GetPlayerID(oPC);
    int nXP = StringToInt(GetLocalString(OBJECT_SELF, "EXP"));
    int nBanked = GetCampaignInt("BANK_XP", DATABASE_XP + sID);
    //int nBanked = GetPersistentInt(oBanker, DATABASE_XP + sID, "BANK_XP");
    // Check if the player has enough to withdraw
    return(nBanked < nXP);
}
