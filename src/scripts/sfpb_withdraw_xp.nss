//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_withdraw
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
    object oPC = GetPCSpeaker();
    string sID = SF_GetPlayerID(oPC);
    int nWithdraw = StringToInt(GetLocalString(OBJECT_SELF, "EXP"));
    int nBanked = GetCampaignInt("BANK_XP", DATABASE_XP + sID);
    //int nBanked = GetPersistentInt(oBanker, DATABASE_XP + sID, "BANK_XP");
    int iXP = GetXP(oPC);
    // Give the amount required to the player and store in the database
    SetXP(oPC, iXP + nWithdraw);
    int nTotal = nBanked - nWithdraw;
    SetCampaignInt("BANK_XP", DATABASE_XP + sID, nTotal);
    //SetPersistentInt(oBanker, DATABASE_XP + sID, nTotal, 0, "BANK_XP");
    SendMessageToAllDMs("<cÞhè>" + GetName(oPC) + " Has withdrawn <cþþ>" +
              IntToString(nWithdraw) + " XP</c> and has <cþþ>"+ IntToString(nTotal) +
                        " XP</c> banked and <cþþ>" + IntToString(GetXP(oPC)) +
                        " XP</c> left</c>");
    // Set custom token
    SetCustomToken(1111, IntToString(nTotal));
}
