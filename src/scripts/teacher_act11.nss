#include "fky_chat_inc"
void main()
{
    object oPC = GetPCSpeaker();
    int iGP = GetLocalInt(oPC, "GOLD_LANG");
    if (USING_NWNX_DB)
    {
        SetLocalInt(oPC, "FKY_CHAT_LANG72", TRUE);
        SetPersistentInt(oPC, "FKY_CHAT_LANG72", TRUE);
        TakeGoldFromCreature(iGP, oPC, TRUE);
        DeleteLocalInt(oPC,"GOLD_LANG");
    }
    else
    {
        object oStorage = GetItemPossessedBy(oPC, TAG_OF_LANGUAGE_STORAGE_OBJECT);
        SetLocalInt(oPC, "FKY_CHAT_LANG72", TRUE);
        SetLocalInt(oStorage, "FKY_CHAT_LANG72", TRUE);
        TakeGoldFromCreature(iGP, oPC, TRUE);
        DeleteLocalInt(oPC,"GOLD_LANG");
    }
}
