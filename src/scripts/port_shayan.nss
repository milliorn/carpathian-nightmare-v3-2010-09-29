void main()
{
    object oPC = GetPCSpeaker();
    object oTarget = GetWaypointByTag("POST_TREASURE_ROOM");
    location lTarget = GetLocation(oTarget);
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionJumpToLocation(lTarget));
}

