void main()
{
    object oObject = GetWaypointByTag("POST_thegrimmreefe002");
    object oNPC = GetNearestObjectByTag("thegrimmreefe002", oObject);
    ExecuteScript("acn_body_bag", OBJECT_SELF);
    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject)))
    {
        if (GetIsObjectValid(oNPC))
        {
            AssignCommand(oNPC,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC);
        }
    }
}
