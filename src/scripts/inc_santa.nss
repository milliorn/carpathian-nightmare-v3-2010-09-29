//Token Prize Script
#include "x2_inc_itemprop"
void SantaShack(object oPC)
{
    object oPC = GetPCSpeaker(),
           oChest = GetObjectByTag("HIDDEN_SPAWN_CHEST"),
           oItem, oCopy;
    int nCount = GetLocalInt(oChest, "itemcount"),
        nPick;
    int nRollOne = d6();
    int nRollTwo = d6();
    int nRollThree = d6();
    int nRollFour = d6();
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
    oCopy = CopyItem(oItem, oPC, TRUE);

    switch (GetBaseItemType(oCopy))
    {
        case BASE_ITEM_ARMOR:
        {
            //10% chance of Freedom as well
            ipAdd1=ItemPropertyACBonus(d6());
            if (nRollOne == 6) ipAdd2=ItemPropertyAbilityBonus(d6(), d6());
            if (nRollTwo == 6) ipAdd3=ItemPropertyDamageResistance(d12(), IP_CONST_DAMAGERESIST_5);
            break;
        }
        case BASE_ITEM_GLOVES:
        {
            //10% additional chance of Regen or Damage Bonus
            ipAdd1=ItemPropertyAttackBonus(d6());
            if (nRollOne == 6) ipAdd2=ItemPropertyDamageBonus(d8(), d6());
            break;
        }
        case BASE_ITEM_HELMET:
        {
            //20% chance of additional True Seeing
            ipAdd1=ItemPropertyDarkvision();
            if (nRollOne == 6) ipAdd2=ItemPropertyAbilityBonus(d6(), d6());
            if (nRollTwo == 6) ipAdd3=ItemPropertyACBonus(d6());
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
            if (nRollOne == 6) ipAdd2=ItemPropertyMassiveCritical(d6());
            break;
        }
        case BASE_ITEM_RING:
        {
            //10% chance of additional ability bonus
            ipAdd1=ItemPropertyAbilityBonus(d6(), d4());
            if (nRollOne == 6) ipAdd2=ItemPropertyACBonus(d6());
            if (nRollTwo == 6) ipAdd3=ItemPropertyDamageResistance(d12(), IP_CONST_DAMAGERESIST_5);
            break;
        }
        case BASE_ITEM_BOOTS:
        {
            //10% chance of additional haste
            ipAdd1=ItemPropertyACBonus(d6());
            if (nRollOne == 6) ipAdd2=ItemPropertyDamageResistance(d12(), IP_CONST_DAMAGERESIST_5);
            if (nRollTwo == 6) ipAdd3=ItemPropertyACBonus(d6());
            break;
        }
        case BASE_ITEM_AMULET:
        case BASE_ITEM_CLOAK:
        {
            //10% chance of additional Ability Bonus
            ipAdd1=ItemPropertyACBonus(d6());
            if (nRollOne == 6) ipAdd2=ItemPropertyAbilityBonus(d6(), d6());
            if (nRollTwo == 6) ipAdd3=ItemPropertyDamageResistance(d12(), IP_CONST_DAMAGERESIST_5);
            break;
        }
        case BASE_ITEM_LARGESHIELD:
        case BASE_ITEM_TOWERSHIELD:
        case BASE_ITEM_SMALLSHIELD:
        {
            //10% chance of Improved Evasion
            ipAdd1=ItemPropertyACBonus(d6());
            if (nRollOne == 6) ipAdd2=ItemPropertyAbilityBonus(d6(), d6());
            if (nRollTwo == 6) ipAdd3=ItemPropertyDamageResistance(d12(), IP_CONST_DAMAGERESIST_5);
            break;
        }
        case BASE_ITEM_BELT:
        case BASE_ITEM_BRACER:
        {
            //10 Chance of Ability Bonus
            ipAdd1=ItemPropertyAbilityBonus(d6(), d6());
            if (nRollOne == 6) ipAdd2=ItemPropertyACBonus(d6());
            if (nRollTwo == 6) ipAdd3=ItemPropertyDamageResistance(d12(), IP_CONST_DAMAGERESIST_5);
            break;
        }
        default:
        {
            if (!IPGetIsMeleeWeapon(oCopy)) return;

            //20% chance of Damage Bonus
            ipAdd1=ItemPropertyEnhancementBonus(d6());
            if (nRollOne == 6) ipAdd2=ItemPropertyDamageBonus(d8(), d6());
            if (nRollTwo == 6) ipAdd3=ItemPropertyKeen();
            if (nRollThree == 6) ipAdd4=ItemPropertyVampiricRegeneration(d6());
            if (nRollFour == 6) ipAdd5=ItemPropertyMassiveCritical(d6());
            break;
        }
   }

   AddItemProperty(DURATION_TYPE_PERMANENT, ipAdd1, oCopy);

   if (GetIsItemPropertyValid(ipAdd2))
   AddItemProperty(DURATION_TYPE_PERMANENT, ipAdd2, oCopy);

   if (GetIsItemPropertyValid(ipAdd3))
   AddItemProperty(DURATION_TYPE_PERMANENT, ipAdd3, oCopy);

   if (GetIsItemPropertyValid(ipAdd4))
   AddItemProperty(DURATION_TYPE_PERMANENT, ipAdd4, oCopy);

   if (GetIsItemPropertyValid(ipAdd5))
   AddItemProperty(DURATION_TYPE_PERMANENT, ipAdd5, oCopy);

   SetDroppableFlag(oCopy, TRUE);
}

//void main() {}
