void main()
{
    object oStore = GetObjectByTag("MarketMerchant");
    object oItem = GetFirstItemInInventory(oStore);
    ExecuteScript("acn_db_boss_purg", OBJECT_SELF);
    while (GetIsObjectValid(oItem) == TRUE)
    {
        DestroyObject(oItem);
        oItem = GetNextItemInInventory(oStore);
    }
}
