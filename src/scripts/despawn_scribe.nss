void main()
{
    object oObject = GetWaypointByTag("POST_namingmerchant_9");
    ExecuteScript("acn_body_bag", OBJECT_SELF);
    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject)))
    {
        object oNPC = GetNearestObjectByTag("namingmerchant_9", oObject);
        if (GetIsObjectValid(oNPC))
        {
            AssignCommand(oNPC,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC);
        }
   }
}
