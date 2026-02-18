//ILR script by Master Lexx & Modified by Milliorn

const int MAXILR = 40;
void Check_ILR_Plus(object oPC, object oItem);
void DoUnequipItem(object oPC, object oItem);
int GetNoILR_Item(object oItem);
int GetILR_ByGoldValue(object oItem);


void Check_ILR_Plus(object oPC, object oItem)
{
    int nLevel = GetHitDice(oPC);
    string sText;
    int nEquip = TRUE;

    if (GetIsDM(oPC))
        return;

    if (GetNoILR_Item(oItem))                //special items not suited for ILR
        return;

    int nILR = GetILR_ByGoldValue(oItem);
    if (nILR > nLevel)
    {
        sText = "You must be Level ("+ IntToString(nILR) +") to equip this item!";
        sText = "<c þ >" + sText + "</c>";
        FloatingTextStringOnCreature(sText, oPC);
        nEquip = FALSE;
    }

    if (nEquip == FALSE)
        DoUnequipItem(oPC, oItem);
}

void DoUnequipItem(object oPC, object oItem)
{
    DelayCommand(0.3, AssignCommand(oPC, ActionUnequipItem(oItem)));
    DelayCommand(0.6, AssignCommand(oPC, ActionUnequipItem(oItem)));
    DelayCommand(0.9, AssignCommand(oPC, ActionUnequipItem(oItem)));
    DelayCommand(1.2, AssignCommand(oPC, ActionUnequipItem(oItem)));
}

int GetNoILR_Item(object oItem) //no ilr for ammo and creature items
{
    int nTyp = GetBaseItemType(oItem);
    if      (nTyp == BASE_ITEM_ARROW)         return TRUE;
    else if (nTyp == BASE_ITEM_BOLT)          return TRUE;
    else if (nTyp == BASE_ITEM_BULLET)        return TRUE;
    else if (nTyp == BASE_ITEM_DART)          return TRUE;
    else if (nTyp == BASE_ITEM_SHURIKEN)      return TRUE;
    else if (nTyp == BASE_ITEM_THROWINGAXE)   return TRUE;
    else if (nTyp == BASE_ITEM_CREATUREITEM)  return TRUE;
    else if (nTyp == BASE_ITEM_CSLASHWEAPON)  return TRUE;
    else if (nTyp == BASE_ITEM_CPIERCWEAPON)  return TRUE;
    else if (nTyp == BASE_ITEM_CBLUDGWEAPON)  return TRUE;
    else if (nTyp == BASE_ITEM_CSLSHPRCWEAP)  return TRUE;

    return FALSE;
}

int GetILR_ByGoldValue(object oItem)
{
    int nItemLevel = 1;
    int nGPValue = GetGoldPieceValue(oItem);

         if (nGPValue >  780000) nItemLevel = 40;
    else if (nGPValue >  741000) nItemLevel = 39;
    else if (nGPValue >  703000) nItemLevel = 38;
    else if (nGPValue >  666000) nItemLevel = 37;
    else if (nGPValue >  630000) nItemLevel = 36;
    else if (nGPValue >  595000) nItemLevel = 35;
    else if (nGPValue >  561000) nItemLevel = 34;
    else if (nGPValue >  528000) nItemLevel = 33;
    else if (nGPValue >  496000) nItemLevel = 32;
    else if (nGPValue >  465000) nItemLevel = 31;
    else if (nGPValue >  435000) nItemLevel = 30;
    else if (nGPValue >  406000) nItemLevel = 29;
    else if (nGPValue >  378000) nItemLevel = 28;
    else if (nGPValue >  351000) nItemLevel = 27;
    else if (nGPValue >  325000) nItemLevel = 26;
    else if (nGPValue >  300000) nItemLevel = 25;
    else if (nGPValue >  276000) nItemLevel = 24;
    else if (nGPValue >  253000) nItemLevel = 23;
    else if (nGPValue >  250000) nItemLevel = 22;
    else if (nGPValue >  130000) nItemLevel = 21;
    else if (nGPValue >  110000) nItemLevel = 20;
    else if (nGPValue >   90000) nItemLevel = 19;
    else if (nGPValue >   75000) nItemLevel = 18;
    else if (nGPValue >   65000) nItemLevel = 17;
    else if (nGPValue >   50000) nItemLevel = 16;
    else if (nGPValue >   40000) nItemLevel = 15;
    else if (nGPValue >   35000) nItemLevel = 14;
    else if (nGPValue >   30000) nItemLevel = 13;
    else if (nGPValue >   25000) nItemLevel = 12;
    else if (nGPValue >   19500) nItemLevel = 11;
    else if (nGPValue >   15000) nItemLevel = 10;
    else if (nGPValue >   12000) nItemLevel = 9;
    else if (nGPValue >    9000) nItemLevel = 8;
    else if (nGPValue >    6000) nItemLevel = 7;
    else if (nGPValue >    5000) nItemLevel = 6;
    else if (nGPValue >    3500) nItemLevel = 5;
    else if (nGPValue >    2500) nItemLevel = 4;
    else if (nGPValue >    1500) nItemLevel = 3;
    else if (nGPValue >    1000) nItemLevel = 2;
    if (nItemLevel > MAXILR)
        nItemLevel = MAXILR;
    return nItemLevel;
}

//void main(){}
