void main()
{
    object oPC = GetEnteringObject(),
           oGrimm = GetWaypointByTag("POST_thegrimmreefe002"),
           oBanker = GetWaypointByTag("POST_banker");

    AssignCommand(oPC, ClearAllActions(TRUE));
    if (!GetIsObjectValid(GetNearestObjectByTag("banker", oBanker)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "banker", GetLocation(oBanker));
    }
    if (!GetIsObjectValid(GetNearestObjectByTag("thegrimmreefe002", oGrimm)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "thegrimmreefe002", GetLocation(oGrimm));
    }
}

