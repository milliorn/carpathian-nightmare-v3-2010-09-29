void main()
{
    object oPC = GetEnteringObject(),
           oObject = GetWaypointByTag("POST_languageteacher");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("languageteacher", oObject)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "languageteacher", GetLocation(oObject));
    }
}
