int StartingConditional()
{
    object oPC = GetPCSpeaker();
    return(GetHitDice(oPC) == 1);
}
