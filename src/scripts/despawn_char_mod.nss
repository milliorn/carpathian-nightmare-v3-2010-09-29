void main()
{
    object oObject = GetWaypointByTag("POST_subracecreator"),
           oNPC2, oNPC3;

    ExecuteScript("acn_body_bag", OBJECT_SELF);
    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject)))
    {
        oNPC2 = GetNearestObjectByTag("charactersetup", oObject);
        oNPC3 = GetNearestObjectByTag("wings_tail", oObject);
        if (GetIsObjectValid(oNPC2))
        {
            AssignCommand(oNPC2,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC2);
        }
        if (GetIsObjectValid(oNPC3))
        {
            AssignCommand(oNPC3,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC3);
        }
    }
}
