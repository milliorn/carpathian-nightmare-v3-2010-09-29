void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_spirit001");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("spirit001", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "spirit001", GetLocation(oObject));
    }
}
