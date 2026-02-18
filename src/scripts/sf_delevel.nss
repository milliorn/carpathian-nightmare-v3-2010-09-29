// ACN's Deleveler
// This Will Take a Levels from A Player Then Give it back
// So The Player May Correct A Level Mistake

void RemoveLevel(object oLoser, int nLevels)
{
    int nHD = GetHitDice(oLoser);
    int nTargetLevel = nHD-nLevels;
    if (nTargetLevel < 1) nTargetLevel = 1;
    int nTargetXP = (( nTargetLevel * ( nTargetLevel - 1 )) / 2 * 1000 );
    SetXP(oLoser, nTargetXP);
}

void main()
{
    object oPC = GetPCSpeaker();
/*    int iXP = GetXP(oPC);
    SetXP(oPC, GetXP(oPC)-(GetHitDice(oPC)-1)*1000);
    DelayCommand(0.2, SetXP(oPC, GetXP(oPC)-(GetHitDice(oPC)-1)*1000));
    DelayCommand(0.5,  SetXP(oPC, iXP));
*/
    RemoveLevel(oPC, 1);
}


