void main()
{
    object oEnter = GetEnteringObject();
    if(GetIsDM(oEnter))return;
    RemoveFromParty(oEnter);
    object oPC = GetFirstPC();
    while(GetIsObjectValid(oPC))
    {
        SetPCDislike(oEnter, oPC);
        oPC = GetNextPC();
    }
}
