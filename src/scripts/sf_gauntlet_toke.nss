//Token Prize Script
#include "x2_inc_itemprop"

void main()
{
    // Vars
    object oPC = GetPCSpeaker(),
           oToken = GetItemPossessedBy(oPC, "gauntlet_token"),
           oRecall = GetItemPossessedBy(oPC, "sf_recall"),
           oChest = GetObjectByTag("HIDDEN_SPAWN_CHEST"),
           oItem, oCopy;
    int nCount = GetLocalInt(oChest, "itemcount"),
        nPick;
    int nRollOne = d6();
    int nRollTwo = d6();
    int nRollThree = d6();
    int nRollFour = d6();
    int nRollDamage = d12();
    int nDamageResist = d12();
    int nRollSkill = d6();
    itemproperty ipAdd1, ipAdd2, ipAdd3, ipAdd4, ipAdd5;

    // Take Token From Player
    DestroyObject(oToken);
    // Delete Token Variable
    DeleteLocalInt(oRecall, "GAUNTLET_TOKEN");

    // Reward Script

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
        case BASE_ITEM_HELMET:
        case BASE_ITEM_RING:
        case BASE_ITEM_BOOTS:
        case BASE_ITEM_AMULET:
        case BASE_ITEM_CLOAK:
        case BASE_ITEM_LARGESHIELD:
        case BASE_ITEM_TOWERSHIELD:
        case BASE_ITEM_SMALLSHIELD:
        case BASE_ITEM_BELT:
        case BASE_ITEM_BRACER:
        {
            ipAdd1=ItemPropertyACBonus(d4()+1);
            if (nRollOne == 6) ipAdd2=ItemPropertyAbilityBonus(Random(5), d3());
            if (nRollSkill = 6) ipAdd3=ItemPropertySkillBonus(Random(26), d4()+1);
            if (nDamageResist == 1) ipAdd4=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ACID, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 3) ipAdd4=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_COLD, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 5) ipAdd4=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_ELECTRICAL, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 6) ipAdd4=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_FIRE, IP_CONST_DAMAGERESIST_5);
            else if (nDamageResist == 12) ipAdd4=ItemPropertyDamageResistance(IP_CONST_DAMAGETYPE_SONIC, IP_CONST_DAMAGERESIST_5);
            break;
        }

        case BASE_ITEM_LONGBOW:
        case BASE_ITEM_SHORTBOW:
        case BASE_ITEM_LIGHTCROSSBOW:
        case BASE_ITEM_HEAVYCROSSBOW:
        case BASE_ITEM_SLING:
        {
            ipAdd1=ItemPropertyAttackBonus(d4()+1);
            if (nRollOne == 6) ipAdd2=ItemPropertyMassiveCritical(Random(14) + 1);
            if (nRollTwo == 6) ipAdd3=ItemPropertyMaxRangeStrengthMod(d6());
            if (nRollDamage == 1) ipAdd4=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, d10());
            else if(nRollDamage == 3) ipAdd4=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, d10());
            else if(nRollDamage == 5) ipAdd4=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, d10());
            else if(nRollDamage == 6) ipAdd4=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, d10());
            else if(nRollDamage == 10) ipAdd4=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, d10());
            break;
        }
        case BASE_ITEM_GLOVES:
        {
            ipAdd1=ItemPropertyAttackBonus(d4()+1);
            if (nRollOne == 6) ipAdd2=ItemPropertyMassiveCritical(Random(14) + 1);
            if (nRollDamage == 1) ipAdd3=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, d10());
            else if(nRollDamage == 2) ipAdd3=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, d10());
            else if(nRollDamage == 3) ipAdd3=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, d10());
            else if(nRollDamage == 5) ipAdd3=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, d10());
            else if(nRollDamage == 10) ipAdd3=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, d10());
            break;
        }

        default:
        {
            if (!IPGetIsMeleeWeapon(oCopy)) return;

            ipAdd1=ItemPropertyEnhancementBonus(d4()+1);
            if (nRollTwo == 6) ipAdd2=ItemPropertyKeen();
            if (nRollThree == 6) ipAdd3=ItemPropertyVampiricRegeneration(d6());
            if (nRollFour == 6) ipAdd4=ItemPropertyMassiveCritical(Random(14)+1);
            if (nRollDamage == 1) ipAdd5=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ACID, d10());
            else if(nRollDamage == 3) ipAdd5=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_COLD, d10());
            else if(nRollDamage == 5) ipAdd5=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_ELECTRICAL, d10());
            else if(nRollDamage == 6) ipAdd5=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_FIRE, d10());
            else if(nRollDamage == 10) ipAdd5=ItemPropertyDamageBonus(IP_CONST_DAMAGETYPE_SONIC, d10());
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
   SetName(oCopy, "Ravana " + GetName(oCopy, TRUE));

}

