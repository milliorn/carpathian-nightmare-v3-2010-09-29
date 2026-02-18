int StartingConditional()
{
    object oPC = GetPCSpeaker();
    if ((GetLootable(oPC) >= 41))return TRUE;
    return FALSE;
}

