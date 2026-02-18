void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_koscheithedeathl");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("koscheithedeathl", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "koscheithedeathl", GetLocation(oObject));
    }
}
