int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if (GetItemPossessedBy(oPC, "item005") == OBJECT_INVALID) return FALSE;
    return TRUE;
}

