void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_namingmerchant_9");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("namingmerchant_9", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "namingmerchant_9", GetLocation(oObject));
    }
}
