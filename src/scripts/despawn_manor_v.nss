void main()
{
    object oObject = GetWaypointByTag("POST_draculvaultguard");
    object oNPC = GetNearestObjectByTag("draculvaultguard", oObject);
    object oMerchant = GetObjectByTag("draconian_mercha");
    object oItem = GetFirstItemInInventory(oMerchant);

    if (!GetIsObjectValid(GetNearestCreature(CREATURE_TYPE_PLAYER_CHAR, PLAYER_CHAR_IS_PC, oObject)))
    {
        if (GetIsObjectValid(oNPC))
        {
            AssignCommand(oNPC, SetIsDestroyable(TRUE));
            DestroyObject(oNPC);
            while (GetIsObjectValid(oItem) == TRUE)
            {
                DestroyObject(oItem);
                oItem = GetNextItemInInventory(oItem);
            }
        }
    }
}
