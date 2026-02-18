void main()
{
    object oPC = GetLastSpeaker();
    location iTarget = GetLocation(GetWaypointByTag("NW_DEATH_TEMPLE"));
    AssignCommand(oPC, JumpToLocation(iTarget));
}
