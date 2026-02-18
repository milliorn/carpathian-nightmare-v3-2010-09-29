void main()
{
    object oObject = GetWaypointByTag("POST_languageteacher");
    ExecuteScript("acn_body_bag", OBJECT_SELF);
    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject)))
    {
        object oNPC = GetNearestObjectByTag("languageteacher", oObject);
        if (GetIsObjectValid(oNPC))
        {
            AssignCommand(oNPC,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC);
        }
   }
}
