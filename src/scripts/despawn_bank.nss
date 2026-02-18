void main()
{
    object oObject = GetWaypointByTag("POST_banker");
    object oGrimm = GetWaypointByTag("POST_thegrimmreefe002");
    object oXPBanker = GetNearestObjectByTag("thegrimmreefe002", oGrimm);
    object oNPC = GetNearestObjectByTag("banker", oObject);
    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject)))
    {
        if (GetIsObjectValid(oNPC))
        {
            AssignCommand(oNPC,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC);
        }
        if (GetIsObjectValid(oXPBanker))
        {
            AssignCommand(oXPBanker,  SetIsDestroyable(TRUE));
            DestroyObject(oXPBanker);
        }
    }
}
