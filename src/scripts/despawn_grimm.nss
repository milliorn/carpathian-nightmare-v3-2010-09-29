void main()
{
    object oGrimm = GetWaypointByTag("POST_thegrimmreefe002");
    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oGrimm)))
    {
        object oNPC = GetNearestObjectByTag("thegrimmreefe002", oGrimm);
        if (GetIsObjectValid(oNPC))
        {
            AssignCommand(oNPC,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC);
        }
   }
}
