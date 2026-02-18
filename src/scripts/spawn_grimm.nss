location lTarget;
object oTarget;

void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_thegrimmreefe002");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("thegrimmreefe002", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "thegrimmreefe002", GetLocation(oObject));
    }

}
