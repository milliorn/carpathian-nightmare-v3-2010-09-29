void main()
{
    object oPC = GetLastUsedBy();
    AdjustAlignment(oPC, ALIGNMENT_EVIL, 100, FALSE);
    SendMessageToPC(oPC, "You shifted to an Evil Alignment");
}
