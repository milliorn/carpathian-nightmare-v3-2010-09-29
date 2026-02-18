void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_thegauntletma001");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("thegauntletma001", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "thegauntletma001", GetLocation(oObject));
    }
}
