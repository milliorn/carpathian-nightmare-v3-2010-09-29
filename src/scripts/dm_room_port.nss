void main()
{
    object oPC = GetEnteringObject();
    location iLoc = GetLocation(GetWaypointByTag("DM_ROOM"));

    if (GetPCPublicCDKey(oPC) == "QG6CXEYC" ||
        GetPCPublicCDKey(oPC) == "Q76A43RL" ||
        GetPCPublicCDKey(oPC) == "QCRWUXFF" || //bassmaster
        GetPCPublicCDKey(oPC) == "QC74AN4H" || //tartmaster
        GetPCPublicCDKey(oPC) == "QG6QREW7")
    {

        AssignCommand(oPC, JumpToLocation(iLoc));
    }
}

