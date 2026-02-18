void main()
{
    object oPC = GetPCSpeaker();
    object oCaster = GetObjectByTag("spirit001");
    object oItem;

    oItem = GetItemPossessedBy(oPC, "DraculHeadBlue");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadBrass");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadBronze");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadCopper");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadGold");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadGreen");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadPrismatic");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadRed");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadShadow");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadSilver");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadWhite");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    oItem = GetItemPossessedBy(oPC, "DraculHeadBlack");

    if (GetIsObjectValid(oItem))
        DestroyObject(oItem);

    AssignCommand(oCaster, ActionCastFakeSpellAtObject(SPELL_HOLY_SWORD, oPC, PROJECTILE_PATH_TYPE_DEFAULT));
    CreateItemOnObject("item003", oPC);
}

