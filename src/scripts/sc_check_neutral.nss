int StartingConditional()
{
    object oPC = GetPCSpeaker();
    switch(GetAlignmentGoodEvil(oPC))
    {
        case ALIGNMENT_NEUTRAL:
        {
            return TRUE;
        }
    }
    return FALSE;
}
