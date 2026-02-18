int StartingConditional()
{
object oPC = GetPCSpeaker();
int iPayment = GetLocalInt(oPC, "GOLD_LANG"),
    iPCGold = GetGold(oPC);

    if (iPCGold <= iPayment) return TRUE;

    return FALSE;
}
