//::////////////////////////////////////////////////////////////////////////:://
//:: SIMTools V3.0 Speech Integration & Management Tools Version 3.0        :://
//:: Created By: FunkySwerve                                                :://
//:: Created On: April 4 2006                                               :://
//:: Last Updated: March 27 2007                                            :://
//:: With Thanks To:                                                        :://
//:: Dumbo - for his amazing plugin                                         :://
//:: Virusman - for Linux versions, and for the reset plugin, and for       :://
//::    his excellent events plugin, without which this update would not    :://
//::    be possible                                                         :://
//:: Dazzle - for his script samples                                        :://
//:: Butch - for the emote wand scripts                                     :://
//:: The DMFI project - for the languages conversions and many of the emotes:://
//:: Lanessar and the players of the Myth Drannor PW - for the new languages:://
//:: The players and DMs of Higher Ground for their input and playtesting   :://
//::////////////////////////////////////////////////////////////////////////:://
#include "fky_chat_inc"

void main()
{
    object oPC = GetPCSpeaker();
    int nSelectedNode = StringToInt(GetLocalString(oPC, "NWNX!EVENTS!SELECTEDNODE"));
    int nReturn;
    switch (nSelectedNode)
    {
        case 0: nReturn = 1; break;
        case 1: nReturn = 9; break;
        case 2: nReturn = 15; break;
        case 3: nReturn = 23; break;
        case 4: nReturn = 32; break;
        case 5: nReturn = 37; break;
        case 6: nReturn = 44; break;
        case 7: nReturn = 49; break;
        case 8: nReturn = 56; break;
        case 9: nReturn = 63; break;
        case 10: nReturn = 72; break;
        case 11: nReturn = 81; break;
        case 12: nReturn = 89; break;
        case 13: nReturn = 99; break;
    }
    if (USING_NWNX_DB)
    {
        SetLocalInt(oPC, "FKY_CHAT_LANG"+IntToString(nReturn), TRUE);
        SetPersistentInt(oPC, "FKY_CHAT_LANG"+IntToString(nReturn), TRUE);
    }
    else
    {
        object oStorage = GetItemPossessedBy(oPC, TAG_OF_LANGUAGE_STORAGE_OBJECT);
        SetLocalInt(oPC, "FKY_CHAT_LANG"+IntToString(nReturn), TRUE);
        SetLocalInt(oStorage, "FKY_CHAT_LANG"+IntToString(nReturn), TRUE);
    }
}
