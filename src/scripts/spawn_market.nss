void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_shopkeep001");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("shopkeep001", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "shopkeep001", GetLocation(oObject));
    }
}
