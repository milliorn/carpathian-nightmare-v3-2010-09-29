//::///////////////////////////////////////////////
//:: Scarface's Persistent Banking
//:: sfpb_withdraw
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
    object oPC = GetPCSpeaker();
    string sID = SF_GetPlayerID(oPC);
    int nWithdraw = StringToInt(GetLocalString(OBJECT_SELF, "GOLD"));
    int nBanked = GetCampaignInt("BANK_GOLD", DATABASE_GOLD + sID);
    //int nBanked = GetPersistentInt(oPC, DATABASE_GOLD + sID, "BANK_GOLD");
    // Give the amount required tot he player and store in the database
    GiveGoldToCreature(oPC, nWithdraw);
    int nTotal = nBanked - nWithdraw;
    SetCampaignInt("BANK_GOLD", DATABASE_GOLD + sID, nTotal);
    //SetPersistentInt(oPC, DATABASE_GOLD + sID, nTotal, 0, "BANK_GOLD");
    SendMessageToAllDMs("<cÞhè>" + GetName(oPC) + " Has withdrawn <cþþ>" +
              IntToString(nWithdraw) + " gold</c> and has <cþþ>"+ IntToString(nTotal) +
                        " gold</c> banked and <cþþ>" + IntToString(GetGold(oPC)) +
                        " gold</c> left</c>");
    // Set custom token
    SetCustomToken(1000, IntToString(nTotal));
}
