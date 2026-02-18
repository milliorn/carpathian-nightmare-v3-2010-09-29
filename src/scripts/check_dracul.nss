int StartingConditional()
{
    object oPC = GetPCSpeaker();

    if (GetItemPossessedBy(oPC, "DraculHeadBlue")           == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadBrass")     == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadBronze")    == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadCopper")    == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadGold")      == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadGreen")     == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadPrismatic") == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadRed")       == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadShadow")    == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadSilver")    == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadWhite")     == OBJECT_INVALID) return FALSE;
    else if (GetItemPossessedBy(oPC, "DraculHeadBlack")     == OBJECT_INVALID) return FALSE;
    return TRUE;
}

