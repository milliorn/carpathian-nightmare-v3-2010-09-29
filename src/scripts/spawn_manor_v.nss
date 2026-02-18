void main()
{
    object oPC = GetEnteringObject();
    object oObject = GetWaypointByTag("POST_draculvaultguard");
    object oMerchant = GetObjectByTag("draconian_mercha");
    object oChest = GetObjectByTag("SOCKET_GENERATOR");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (GetIsObjectValid(GetNearestObjectByTag("draculvaultguard", oObject)))return;
        CreateObject(OBJECT_TYPE_CREATURE, "draculvaultguard", GetLocation(oObject));

    object oItem = GetFirstItemInInventory(oChest);
    while (GetIsObjectValid(oItem) == TRUE)
    {
        CopyItem(oItem, oMerchant, TRUE);
        oItem = GetNextItemInInventory(oChest);
    }
}




