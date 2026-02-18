void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_gauntletmerchant");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("gauntletmerchant", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "gauntletmerchant", GetLocation(oObject));
    }
}
