//Put this script OnEnter
void main()
{
    object oPC = GetEnteringObject();
    object oChest = GetObjectByTag("prisoner_chest");
    object oEquip;
    int iGold = GetGold(oPC);

    if (!GetIsPC(oPC)) return;

    TakeGoldFromCreature(iGold, oPC, TRUE);
    GiveGoldToCreature(oChest, iGold);

    oEquip = GetItemInSlot(INVENTORY_SLOT_ARMS, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_ARROWS, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_BELT, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_BOLTS, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_BOOTS, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_BULLETS, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_CHEST, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_CLOAK, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_HEAD, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_NECK, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);
    ActionUnequipItem(oEquip);
    oEquip = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);
    ActionUnequipItem(oEquip);


    oEquip = GetFirstItemInInventory(oPC);
    while (GetIsObjectValid(oEquip) == TRUE)
    {
            SetInfiniteFlag(oEquip, FALSE);
            SetItemCursedFlag(oEquip, FALSE);
            SetPickpocketableFlag(oEquip, TRUE);
            SetPlotFlag(oEquip, FALSE);
            SetStolenFlag(oEquip, FALSE);
            CopyItem(oEquip, oChest, TRUE);
            DestroyObject(oEquip);
            oEquip = GetNextItemInInventory(oPC);
    }
}
