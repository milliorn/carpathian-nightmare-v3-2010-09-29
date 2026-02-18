void SendHome(object oPC)
{
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("NW_DEATH_TEMPLE"))));
    DestroyObject(GetItemPossessedBy(oPC, "jail_token"));
}
void Timer(object oPC, int iTimer)
{
    if (!GetIsObjectValid(oPC)) return;

    FloatingTextStringOnCreature(IntToString(iTimer) + " seconds in jail left", oPC);
    iTimer --;

    if (iTimer < 1)
    {
        SendHome(oPC);
        return;
    }
    else
    {
        DelayCommand(1.0, Timer(oPC, iTimer));
    }
}
void JailPlayer(object oPC)
{
    AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("jail"))));
//    Timer(oPC, 300);
}
