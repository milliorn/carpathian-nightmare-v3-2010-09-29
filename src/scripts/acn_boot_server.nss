void main()
{
    object oPC = GetFirstPC();
    while (GetIsObjectValid(oPC) == TRUE)
    {
        BootPC(oPC);
        oPC = GetNextPC();
   }
}
