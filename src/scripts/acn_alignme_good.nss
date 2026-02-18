void main()
{
    object oPC = GetLastUsedBy();
    AdjustAlignment(oPC, ALIGNMENT_GOOD, 100, FALSE);
    SendMessageToPC(oPC, "You shifted to a Good Alignment");
}
