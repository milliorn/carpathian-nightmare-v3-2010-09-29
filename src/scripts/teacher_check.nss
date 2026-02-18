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
const int NODE_TYPE_STARTING_NODE = 0;
const int NODE_TYPE_ENTRY_NODE    = 1;
const int NODE_TYPE_REPLY_NODE    = 2;

int GetCurrentNodeType();
int GetCurrentNodeID();
int GetCurrentAbsoluteNodeID();

int GetCurrentNodeType()
{
    SetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETNODETYPE", "      ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETNODETYPE"));
}

int GetCurrentNodeID()
{
    SetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETNODEID", "      ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETNODEID"));
}

int GetCurrentAbsoluteNodeID()
{
    SetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETABSOLUTENODEID", "      ");
    return StringToInt(GetLocalString(OBJECT_SELF, "NWNX!EVENTS!GETABSOLUTENODEID"));
}

int StartingConditional()
{
    int nNodeID = GetCurrentNodeID();
    object oPC = GetPCSpeaker();
    int nReturn;
    switch(nNodeID)
    {
        case 0: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG1")); break;
        case 1: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG9")); break;
        case 2: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG15")); break;
        case 3: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG23")); break;
        case 4: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG32")); break;
        case 5: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG37")); break;
        case 6: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG44")); break;
        case 7: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG49")); break;
        case 8: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG56")); break;
        case 9: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG63")); break;
        case 10: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG72")); break;
        case 11: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG81")); break;
        case 12: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG89")); break;
        case 13: nReturn = (!GetLocalInt(oPC, "FKY_CHAT_LANG99")); break;
    }
    return nReturn;
}
