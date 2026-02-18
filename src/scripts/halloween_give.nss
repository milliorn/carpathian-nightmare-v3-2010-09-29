#include "x2_inc_itemprop"
void main()
{
    object oPC = GetPCSpeaker();
    string sKey = GetPCPublicCDKey(oPC);
    SetCampaignInt("HALLOWEEN", "SEEN_DEATH_" + sKey, TRUE);

    GiveGoldToCreature(oPC, d100(100));
    GiveXPToCreature(oPC, d100(100));

    object oChest = GetObjectByTag("HIDDEN_SPAWN_CHEST"),
           oItem, oCopy;
    int nCount = GetLocalInt(oChest, "itemcount"),
        nPick;
    int nRollOne = d6();
    int nRollTwo = d6();
    int nRollThree = d6();
    int nRollFour = d6();
    int iRoll = d6();
    itemproperty ipAdd1, ipAdd2, ipAdd3, ipAdd4, ipAdd5;

if (!nCount)
    {
        oItem=GetFirstItemInInventory(oChest);
        do
        {
            nCount++;
            oItem=GetNextItemInInventory(oChest);
        } while (GetIsObjectValid(oItem));
        SetLocalInt(oChest, "itemcount", nCount);
    }

    nPick = Random(nCount);
    oItem = GetFirstItemInInventory(oChest);
    while (nPick)
    {
        nPick--;
        oItem=GetNextItemInInventory(oChest);
    }

    //Copy the item to the players inventory
    oCopy = CopyItem(oItem, oPC);

    switch (GetBaseItemType(oCopy))
    {
        case BASE_ITEM_ARMOR:
        case BASE_ITEM_AMULET:
        case BASE_ITEM_CLOAK:
        case BASE_ITEM_BOOTS:
        case BASE_ITEM_LARGESHIELD:
        case BASE_ITEM_TOWERSHIELD:
        case BASE_ITEM_SMALLSHIELD:
        case BASE_ITEM_RING:
        case BASE_ITEM_BELT:
        case BASE_ITEM_BRACER:
        {
            //10% chance of Freedom as well
            ipAdd1=ItemPropertyACBonus(d4() +1);
            if (nRollOne == 6) ipAdd2=ItemPropertyAbilityBonus(Random(5), d3());
            if (nRollTwo == 1) ipAdd3=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ACID, IP_CONST_DAMAGERESIST_5);
            else if (nRollTwo == 2) ipAdd3=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGERESIST_5);
            else if (nRollTwo == 3) ipAdd3=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ELECTRICAL, IP_CONST_DAMAGERESIST_5);
            else if (nRollTwo == 4) ipAdd3=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGERESIST_5);
            else if (nRollTwo == 5) ipAdd3=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_SONIC, IP_CONST_DAMAGERESIST_5);
            break;
        }
        case BASE_ITEM_GLOVES:
        {
            //10% additional chance of Regen or Damage Bonus
            ipAdd1=ItemPropertyAttackBonus(d4() + 1);
            if (nRollOne == 1) ipAdd2=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, d6(2));
            else if (nRollOne == 2) ipAdd2=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, d6(2));
            else if (nRollOne == 3) ipAdd2=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, d6(2));
            else if (nRollOne == 4) ipAdd2=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, d6(2));
            else if (nRollOne == 5) ipAdd2=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, d6(2));
            break;
        }
        case BASE_ITEM_HELMET:
        {
            //20% chance of additional True Seeing
            ipAdd1=ItemPropertyDarkvision();
            if (nRollOne == 6) ipAdd2=ItemPropertyAbilityBonus(Random(5), d3());
            if (nRollTwo == 1) ipAdd3=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ACID, IP_CONST_DAMAGERESIST_5);
            else if (nRollTwo == 2) ipAdd3=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGERESIST_5);
            else if (nRollTwo == 3) ipAdd3=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ELECTRICAL, IP_CONST_DAMAGERESIST_5);
            else if (nRollTwo == 4) ipAdd3=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGERESIST_5);
            else if (nRollTwo == 5) ipAdd3=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_SONIC, IP_CONST_DAMAGERESIST_5);
            break;
        }
        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_SLING:
        {
            //10% chance of Massive Crits
            ipAdd1=ItemPropertyAttackBonus(d6());
            ipAdd2=ItemPropertyMassiveCritical(IP_CONST_DAMAGEBONUS_2d12);
            ipAdd3=ItemPropertyMaxRangeStrengthMod(d20());
            break;
        }
        default:
        {
            if (!IPGetIsMeleeWeapon(oCopy)) return;

            //20% chance of Damage Bonus
            ipAdd1=ItemPropertyEnhancementBonus(d6());
            if (nRollOne == 6) ipAdd2=ItemPropertyDamageBonus(Random(13), d6());
            if (nRollTwo == 6) ipAdd3=ItemPropertyKeen();
            if (nRollThree == 6) ipAdd4=ItemPropertyVampiricRegeneration(d6());
            if (nRollFour == 6) ipAdd5=ItemPropertyMassiveCritical(d6());
            break;
        }
   }

   IPSafeAddItemProperty(oCopy, ipAdd1);

   if (GetIsItemPropertyValid(ipAdd2))
   IPSafeAddItemProperty(oCopy, ipAdd2);

   if (GetIsItemPropertyValid(ipAdd3))
   IPSafeAddItemProperty(oCopy, ipAdd3);

   if (GetIsItemPropertyValid(ipAdd4))
   IPSafeAddItemProperty(oCopy, ipAdd4);

   if (GetIsItemPropertyValid(ipAdd5))
   IPSafeAddItemProperty(oCopy, ipAdd5);

   SetDroppableFlag(oCopy, TRUE);

    oChest = GetObjectByTag("LOOT_GENERATOR");

    if(iRoll == 6)
    {
        return;
    }
    else if (!nCount)
        {
            oItem=GetFirstItemInInventory(oChest);
            do
            {
                nCount++;
                oItem=GetNextItemInInventory(oChest);
        }
            while (GetIsObjectValid(oItem));
            SetLocalInt(oChest, "itemcount", nCount);
        }

        nPick = Random(nCount);
        oItem = GetFirstItemInInventory(oChest);
        while (nPick)
        {
            nPick--;
            oItem=GetNextItemInInventory(oChest);
        }

        //Copy the item to the players inventory
        oCopy = CopyItem(oItem, oPC, TRUE);
        SetDroppableFlag(oCopy, TRUE);

           oChest = GetObjectByTag("SOCKET_GENERATOR");

    if(iRoll == 6)
    {
        return;
    }
    else if (!nCount)
        {
            oItem=GetFirstItemInInventory(oChest);
            do
            {
                nCount++;
                oItem=GetNextItemInInventory(oChest);
        }
            while (GetIsObjectValid(oItem));
            SetLocalInt(oChest, "itemcount", nCount);
        }

        nPick = Random(nCount);
        oItem = GetFirstItemInInventory(oChest);
        while (nPick)
        {
            nPick--;
            oItem=GetNextItemInInventory(oChest);
        }

        //Copy the item to the players inventory
        oCopy = CopyItem(oItem, oPC, TRUE);
        SetDroppableFlag(oCopy, TRUE);

           oChest = GetObjectByTag("BOSS_GENERATOR");

    if(iRoll == 6)
    {
        return;
    }
    else if (!nCount)
        {
            oItem=GetFirstItemInInventory(oChest);
            do
            {
                nCount++;
                oItem=GetNextItemInInventory(oChest);
        }
            while (GetIsObjectValid(oItem));
            SetLocalInt(oChest, "itemcount", nCount);
        }

        nPick = Random(nCount);
        oItem = GetFirstItemInInventory(oChest);
        while (nPick)
        {
            nPick--;
            oItem=GetNextItemInInventory(oChest);
        }

        //Copy the item to the players inventory
        oCopy = CopyItem(oItem, oPC, TRUE);
        SetDroppableFlag(oCopy, TRUE);
}
