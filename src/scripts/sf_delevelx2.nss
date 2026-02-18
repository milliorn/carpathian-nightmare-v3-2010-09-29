// Scarface's Deleveler
// This Will Take 1 Level from A Player That Is Level 2
// Then Give it back  So The Player May Correct A Level Mistake
void main()
{
    object oPC = GetPCSpeaker();
    int iXP = GetXP(oPC);
    SetXP(oPC, GetXP(oPC)-(GetHitDice(oPC)-1)*1000);
    DelayCommand(0.2,  SetXP(oPC, iXP));
}
