void main()
{
    object oObject = GetWaypointByTag("POST_spirit001");

    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject)))
    {
        object oNPC = GetNearestObjectByTag("spirit001", oObject);
        if (GetIsObjectValid(oNPC))
        {
            AssignCommand(oNPC,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC);
            ExecuteScript("acn_body_bag", OBJECT_SELF);
        }
   }
}
