void main()
{
    object oObject = GetWaypointByTag("POST_thegauntletma001");

    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject)))
    {
        object oNPC = GetNearestObjectByTag("thegauntletma001", oObject);
        if (GetIsObjectValid(oNPC))
        {
            AssignCommand(oNPC,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC);
        }
   }
}
