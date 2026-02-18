void main()
{
    object oPC = GetEnteringObject(),
           oObject2 = GetWaypointByTag("POST_charactersetup"),
           oObject3 = GetWaypointByTag("POST_wings_tail");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("charactersetup", oObject2)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "charactersetup", GetLocation(oObject2));
    }
    if (!GetIsObjectValid(GetNearestObjectByTag("wings_tail", oObject3)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "wings_tail", GetLocation(oObject3));
    }
}
