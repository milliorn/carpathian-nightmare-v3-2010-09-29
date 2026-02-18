void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_shopkeep006");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("shopkeep006", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "shopkeep006", GetLocation(oObject));
    }
}
