void main()
{
    object oItem;
    object oPC = GetExitingObject(),
           oObject = GetWaypointByTag("POST_omegasmith01"),
           oNPC1, oNPC2, oNPC3, oNPC4,
           oForge1 = GetNearestObjectByTag("omegaforge1"),
           oForge2 = GetNearestObjectByTag("omegaforge2"),
           oForge3 = GetNearestObjectByTag("omegaforge3"),
           oForge4 = GetNearestObjectByTag("omegaforge4"),
           oLastUser1 = GetLocalObject(oForge1, "LAST_USER"),
           oLastUser2 = GetLocalObject(oForge2, "LAST_USER"),
           oLastUser3 = GetLocalObject(oForge3, "LAST_USER"),
           oLastUser4 = GetLocalObject(oForge4, "LAST_USER");

    ExecuteScript("acn_body_bag", OBJECT_SELF);

    if (!GetIsObjectValid(oLastUser1) || oPC == oLastUser1)
    {
        DeleteLocalObject(oForge1, "LAST_USER");
    }
    if (!GetIsObjectValid(oLastUser2) || oPC == oLastUser2)
    {
        DeleteLocalObject(oForge2, "LAST_USER");
    }
    if (!GetIsObjectValid(oLastUser3) || oPC == oLastUser3)
    {
        DeleteLocalObject(oForge3, "LAST_USER");
    }
    if (!GetIsObjectValid(oLastUser4) || oPC == oLastUser4)
    {
        DeleteLocalObject(oForge4, "LAST_USER");
    }
    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject)))
    {
        oNPC1 = GetNearestObjectByTag("omegasmith002", oObject);
        oNPC2 = GetNearestObjectByTag("omegasmith003", oObject);
        oNPC3 = GetNearestObjectByTag("omegasmith004", oObject);
        oNPC3 = GetNearestObjectByTag("ilridentifier", oObject);

        if (GetIsObjectValid(oNPC1))
        {
            AssignCommand(oNPC1, SetIsDestroyable(TRUE));
            DestroyObject(oNPC1);
        }
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
        if (GetIsObjectValid(oNPC4))
        {
            AssignCommand(oNPC4,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC4);
        }
    }
}
