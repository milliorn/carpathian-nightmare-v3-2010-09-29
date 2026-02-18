//Souless Loot Generator Script       RANGED_LOOT_GENERATOR  RangedWeaponMerchant
#include "x2_inc_itemprop"
void main()
{
    // Vars
    object oPC = OBJECT_SELF,
           oChest = GetObjectByTag("RANGED_LOOT_GENERATOR"),
           oItem,
           oCopy;

    int nCount = GetLocalInt(oChest, "itemcount"),
        nPick;
    int nRoll            = d3();
    int nMassCritical    = d6();
    int nAbilityBonus    = d20();
    int nDamageBonus     = d6();
    int nVampiricRegen   = d6();
    int nAC              = d20();
    int nDarkvision      = d20();
    int nExtraRanged     = d6();
    int nMighty          = d6();
    int nRegen           = d20();
    int nSR              = d20();
    int nUnlimited       = d6();

    itemproperty ipAdd1,
                 ipAdd2,
                 ipAdd3,
                 ipAdd4,
                 ipAdd5,
                 ipAdd6,
                 ipAdd7,
                 ipAdd8,
                 ipAdd9,
                 ipAdd10;

    if(nRoll != 3)
    {
        ExecuteScript("trgs_ranged_loot", OBJECT_SELF);
    }

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
        case BASE_ITEM_ARROW:
        case BASE_ITEM_BOLT:
        case BASE_ITEM_BULLET:
        {
            ipAdd1=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_PIERCING,d6());
            if (nDamageBonus  == 6) ipAdd2=ItemPropertyDamageBonus(d8(),d20());
            if (nVampiricRegen == 6) ipAdd3=ItemPropertyVampiricRegeneration(d6());
            break;
        }
        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_SLING:
        {
            ipAdd1=ItemPropertyAttackBonus(d6());
            if (nMassCritical == 6) ipAdd2=ItemPropertyMassiveCritical(d8(2));
            if (nAbilityBonus == 20) ipAdd3=ItemPropertyAbilityBonus(d6(), d6());
            if (nAC           == 20) ipAdd4=ItemPropertyACBonus(d6());
            if (nDarkvision   == 20) ipAdd5=ItemPropertyDarkvision();
            if (nExtraRanged  == 6) ipAdd6=ItemPropertyExtraRangeDamageType(Random(2));
            if (nMighty       == 6) ipAdd7=ItemPropertyMaxRangeStrengthMod(d12());
            if (nRegen        == 20) ipAdd8=ItemPropertyRegeneration(d2());
            if (nSR           == 20) ipAdd9=ItemPropertyBonusSpellResistance(Random(5));
            if (nUnlimited    == 6) ipAdd10=ItemPropertyUnlimitedAmmo(Random(8));
            break;
        }
        case BASE_ITEM_DART:
        case BASE_ITEM_SHURIKEN:
        case BASE_ITEM_THROWINGAXE:
        {
            ipAdd1=ItemPropertyEnhancementBonus(d6());
            if (nDamageBonus   == 6) ipAdd2=ItemPropertyDamageBonus(d8(),d20()); return;
            if (nVampiricRegen == 6) ipAdd3=ItemPropertyVampiricRegeneration(d6());
            if (nAbilityBonus  <= 6) ipAdd3=ItemPropertyAbilityBonus(d6(), d6());
            if (nDarkvision    <= 6) ipAdd5=ItemPropertyDarkvision();
            if (nExtraRanged   == 6) ipAdd6=ItemPropertyExtraRangeDamageType(Random(2));
            if (nMassCritical  == 6) ipAdd2=ItemPropertyMassiveCritical(d8(2));
            if (nMighty        == 6) ipAdd7=ItemPropertyMaxRangeStrengthMod(d12());
            if (nSR            <= 6) ipAdd9=ItemPropertyBonusSpellResistance(Random(5));
            break;
        }
        //default: {}
   }

   IPSafeAddItemProperty(oCopy, ipAdd1);

   if (GetIsItemPropertyValid(ipAdd2))
   IPSafeAddItemProperty(oCopy, ipAdd2, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING);

   if (GetIsItemPropertyValid(ipAdd3))
   IPSafeAddItemProperty(oCopy, ipAdd3, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING);

   if (GetIsItemPropertyValid(ipAdd4))
   IPSafeAddItemProperty(oCopy, ipAdd4, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING);

   if (GetIsItemPropertyValid(ipAdd5))
   IPSafeAddItemProperty(oCopy, ipAdd5, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING);

   if (GetIsItemPropertyValid(ipAdd6))
   IPSafeAddItemProperty(oCopy, ipAdd6, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING);

   if (GetIsItemPropertyValid(ipAdd7))
   IPSafeAddItemProperty(oCopy, ipAdd7, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING);

   if (GetIsItemPropertyValid(ipAdd8))
   IPSafeAddItemProperty(oCopy, ipAdd8, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING);

   if (GetIsItemPropertyValid(ipAdd9))
   IPSafeAddItemProperty(oCopy, ipAdd9, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING);

   if (GetIsItemPropertyValid(ipAdd10))
   IPSafeAddItemProperty(oCopy, ipAdd10, 0.0, X2_IP_ADDPROP_POLICY_KEEP_EXISTING);

    SetDroppableFlag(oCopy, TRUE);

    if(GetBaseItemType(oCopy) == BASE_ITEM_ARROW)
    {
        SetName(oCopy, "<cÌwþ>Souless Arrows");
        return;
    }

    else if(GetBaseItemType(oCopy) == BASE_ITEM_BOLT)
    {
        SetName(oCopy, "<cÌwþ>Souless Bolts");
        return;
    }

    else if(GetBaseItemType(oCopy) == BASE_ITEM_BULLET)
    {
        SetName(oCopy, "<cÌwþ>Souless Bullets");
        return;
    }

    else if(GetBaseItemType(oCopy) == BASE_ITEM_LONGBOW)
    {
        SetName(oCopy, "<cÌwþ>Souless Longbow");
        return;
    }

    else if(GetBaseItemType(oCopy) == BASE_ITEM_SHORTBOW)
    {
        SetName(oCopy, "<cÌwþ>Souless Shortbow");
        return;
    }

    else if(GetBaseItemType(oCopy) == BASE_ITEM_LIGHTCROSSBOW)
    {
        SetName(oCopy, "<cÌwþ>Souless Light X-Bow");
        return;
    }

    else if(GetBaseItemType(oCopy) == BASE_ITEM_HEAVYCROSSBOW)
    {
        SetName(oCopy, "<cÌwþ>Souless Heavy X-Bow");
        return;
    }

    else if(GetBaseItemType(oCopy) == BASE_ITEM_SLING)
    {
        SetName(oCopy, "<cÌwþ>Souless Sling");
        return;
    }

    else if(GetBaseItemType(oCopy) == BASE_ITEM_DART)
    {
        SetName(oCopy, "<cÌwþ>Souless Dart");
        return;
    }

    else if(GetBaseItemType(oCopy) == BASE_ITEM_SHURIKEN)
    {
        SetName(oCopy, "<cÌwþ>Souless Shuriken");
        return;
    }
    else if(GetBaseItemType(oCopy) == BASE_ITEM_THROWINGAXE)
    {
        SetName(oCopy, "<cÌwþ>Souless Throwing");
        return;
    }
}
