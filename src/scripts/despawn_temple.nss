void main()
{
    object oObject = GetWaypointByTag("NW_MERCHANT_POTIONS_SCROLLS"),
           oNPC1, oNPC2, oNPC3, oNPC4, oNPC5;

    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject)))
    {
        oNPC1 = GetNearestObjectByTag("armorshop", oObject);
        oNPC2 = GetNearestObjectByTag("miscellaneousite", oObject);
        oNPC3 = GetNearestObjectByTag("creature", oObject);
        oNPC4 = GetNearestObjectByTag("jewelryshop001", oObject);
        oNPC5 = GetNearestObjectByTag("weaponshop", oObject);

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
            AssignCommand(oNPC2,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC2);
        }
        if (GetIsObjectValid(oNPC5))
        {
            AssignCommand(oNPC3,  SetIsDestroyable(TRUE));
            DestroyObject(oNPC3);
        }
    }
}
