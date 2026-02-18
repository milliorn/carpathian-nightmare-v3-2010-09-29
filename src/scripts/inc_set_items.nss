//Set Items script, by Master Lexx
//include this script in item equip & unequip event scripts and call
//CheckSetItemEquip(oPC, oItem) and CheckSetItemUnequip(oPC, oItem)

//just put in item tag: "set_" + setNR + "_" + maxNR of items in set + "_" + NR of setitem
//e.g. set_145_3_1 (is a set item, is the 145 set, has 3 items, is item 1 of those 3)
//max sets possible: 999, max items in set: 9, enough for every PW

void ApplySetEffects(object oPC, object oItem);
void CheckSetItemEquip(object oPC, object oItem);   //call from on player item equip event
void CheckSetItemUnequip(object oPC, object oItem); //call from on player item unequip event
int DuplicateSetItems(object oPC);
void RemoveSetEffects(object oPC, object oItem);
int CheckIfSecondsPassed(int nSeconds, object oPC);


void ApplySetEffects(object oPC, object oItem)      //here all setitems with effects
{
    string sTag = GetStringLeft(GetTag(oItem), 11);
    string sSet = GetSubString(sTag, 4, 3);         //get set NR
    int iDur = DURATION_TYPE_PERMANENT;

    //Light Blue Magic Sets (Can Be Found) 7 Pieces
    if (sSet == "001")
      {
      if (sTag == "set_001_7_1")
        {//Armour
        ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_STRENGTH, 2)), oPC);
        }
      else if (sTag == "set_001_7_2")
        {//Boots
        ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_CONSTITUTION, 2)), oPC);
        }
      else if (sTag == "set_001_7_3")
        {//Bracers/Gauntlets
        ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_DEXTERITY, 2)), oPC);
        }
      else if (sTag == "set_001_7_4")
        {//Belt
        ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_INTELLIGENCE, 2)), oPC);
        }
        else if (sTag == "set_001_7_5")
        {//Cloak
        ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_CHARISMA, 2)), oPC);
        }
      else if (sTag == "set_001_7_6")
        {//Helmet
        ApplyEffectToObject(iDur, SupernaturalEffect(EffectHaste()), oPC);
        }
      else if (sTag == "set_001_7_7")
        {//Amulet
        ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_WISDOM, 2)), oPC);
        }
      }

    if (sSet == "002")
    {
        if (sTag == "set_002_7_1")
        {//Armour
            ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_STRENGTH, 2)), oPC);
        }
        else if (sTag == "set_002_7_2")
        {//Boots
            ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_CONSTITUTION, 2)), oPC);
        }
        else if (sTag == "set_002_7_3")
        {//Bracers/Gauntlets
            ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_DEXTERITY, 2)), oPC);
        }
        else if (sTag == "set_002_7_4")
        {//Belt
            ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_INTELLIGENCE, 2)), oPC);
        }
        else if (sTag == "set_002_7_5")
        {//Cloak
            ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_CHARISMA, 2)), oPC);
        }
        else if (sTag == "set_002_7_6")
        {//Helmet
            ApplyEffectToObject(iDur, SupernaturalEffect(EffectHaste()), oPC);
        }
        else if (sTag == "set_002_7_7")
        {//Amulet
            ApplyEffectToObject(iDur, SupernaturalEffect(EffectAbilityIncrease(ABILITY_WISDOM, 2)), oPC);
        }
    }
}

void CheckSetItemEquip(object oPC, object oItem)
{
    string sItem = GetTag(oItem);                       //eg "set_145_3_2"
    string sSetTag = GetStringLeft(sItem, 3);           //"set"

    if (sSetTag != "set")                               //if not setitem, end script
        return;
    string sSet9 = GetStringLeft(sItem, 9);             //eg "set_145_3"
    string sMaxNR = GetStringRight(sSet9, 1);           //eg 3
    int nMaxNR = StringToInt(sMaxNR);

    int nSetItems = 0;
    string sText;
    object oItemEq;
    string sItemEq;
    string sItemEq9;
    int nSlot;
    for (nSlot=0; nSlot<NUM_INVENTORY_SLOTS; nSlot++)   //check equiped items for setitems
    {
        oItemEq = GetItemInSlot(nSlot, oPC);
        sItemEq = GetTag(oItemEq);
        sItemEq9 = GetStringLeft(sItemEq, 9);
        if (sItemEq9 == sSet9)
            nSetItems += 1;
    }
    nSetItems -= DuplicateSetItems(oPC);

    if (nSetItems != nMaxNR)     //if set not complete, end script
    {
        string sNeed = IntToString(nMaxNR - nSetItems);
        sText = "You need " + sNeed + " more set items equipped to complete this set";
        sText = "<c ó >" + sText + "</c>";
        FloatingTextStringOnCreature(sText, oPC);
        return;
    }

    for (nSlot=0; nSlot<NUM_INVENTORY_SLOTS; nSlot++)   //add all effects to setitems
    {
        oItemEq = GetItemInSlot(nSlot, oPC);
        sItemEq = GetTag(oItemEq);
        sItemEq9 = GetStringLeft(sItemEq, 9);
        if (sItemEq9 == sSet9)
        {
            ApplySetEffects(oPC, oItemEq);
        }
    }
    sText = "Set complete, you have all required set items equipped.";
    sText = "<c ó >" + sText + "</c>";
    FloatingTextStringOnCreature(sText, oPC);
    SetLocalInt(oPC, sSet9, 1);                         //set complete

    if (!CheckIfSecondsPassed(12, oPC))
        return;

    effect eSetOn = EffectVisualEffect(VFX_IMP_GOOD_HELP);
    int i;
    for (i=0; i<nMaxNR; i++)
    {
        float j = i / 2.0;
        DelayCommand(j , ApplyEffectToObject(DURATION_TYPE_INSTANT, eSetOn, oPC));
    }
}//by Master Lexx

void CheckSetItemUnequip(object oPC, object oItem)      //remove set effects if unequip
{
    string sItem = GetTag(oItem);                       //eg "set_145_3_2"
    string sSetTag = GetStringLeft(sItem, 3);           //"set"
    string sSet9 = GetStringLeft(sItem, 9);             //eg "set_145_3"

    if (sSetTag != "set")                               //if not setitem, end script
        return;
    if (GetLocalInt(oPC, sSet9) != 1)                   //if set not complete, end
        return;

    string sMaxNR = GetStringRight(sSet9, 1);           //eg 3
    int nMaxNR = StringToInt(sMaxNR);
    RemoveSetEffects(oPC, oItem);                       //remove effects from this unequipped set item

    object oItemEq;
    string sItemEq;
    string sItemEq9;
    int nSlot;
    for (nSlot=0; nSlot<NUM_INVENTORY_SLOTS; nSlot++)  //check equiped items for setitems and remove effects
    {
        oItemEq = GetItemInSlot(nSlot, oPC);
        sItemEq = GetTag(oItemEq);
        sItemEq9 = GetStringLeft(sItemEq, 9);
        if (sItemEq9 == sSet9)
        {
            RemoveSetEffects(oPC, oItemEq);             //remove effects from equipped set item
        }
    }
    string sText = "Set incomplete, you have unequipped a required set item.";
    sText = "<c ó >" + sText + "</c>";
    FloatingTextStringOnCreature(sText, oPC);
    SetLocalInt(oPC, sSet9, 0);                         //set incomplete

    if (!CheckIfSecondsPassed(12, oPC))
        return;

    effect eSetOff = EffectVisualEffect(VFX_IMP_EVIL_HELP);
    int i;
    for (i=0; i<nMaxNR; i++)
    {
        float j = i / 2.0;
        DelayCommand(j, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSetOff, oPC));
    }
}

int DuplicateSetItems(object oPC)                       //equal setitems don't count to complete the set
{
    int nDuplicate = 0;
    string sText = "Two equal set items equipped doesn't count.";
    sText = "<c ó >" + sText + "</c>";
    object oItemA = GetItemInSlot(INVENTORY_SLOT_LEFTHAND, oPC);
    object oItemB = GetItemInSlot(INVENTORY_SLOT_RIGHTHAND, oPC);

    if (GetStringLeft(GetTag(oItemA), 3) == "SET")
        if (GetTag(oItemA) == GetTag(oItemB))
        {
            nDuplicate += 1;
            FloatingTextStringOnCreature(sText, oPC);
        }

    oItemA = GetItemInSlot(INVENTORY_SLOT_LEFTRING, oPC);
    oItemB = GetItemInSlot(INVENTORY_SLOT_RIGHTRING, oPC);

    if (GetStringLeft(GetTag(oItemA), 3) == "SET")
        if (GetTag(oItemA) == GetTag(oItemB))
        {
            nDuplicate += 1;
            FloatingTextStringOnCreature(sText, oPC);
        }
    return nDuplicate;
}

void RemoveSetEffects(object oPC, object oItem)         //remove all temporary effects of setitem
{
effect eBad = GetFirstEffect(oPC);
  while(GetIsEffectValid(eBad))
    {
    if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_INCREASE ||
        GetEffectType(eBad) == EFFECT_TYPE_HASTE ||
        GetEffectType(eBad) == EFFECT_TYPE_TRUESEEING ||
        GetEffectType(eBad) == EFFECT_TYPE_REGENERATE ||
        GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_REDUCTION)
     {
     //Remove effect if it is negative.
     RemoveEffect(oPC, eBad);
     }
    eBad = GetNextEffect(oPC);
    }

itemproperty pProp = GetFirstItemProperty(oItem);
 while(GetIsItemPropertyValid(pProp))
    {
        if(GetItemPropertyDurationType(pProp) == DURATION_TYPE_TEMPORARY)
        {
            RemoveItemProperty(oItem, pProp);
        }
        pProp = GetNextItemProperty(oItem);
    }
}

int CheckIfSecondsPassed(int nSeconds, object oPC)  //no more extreme equip/unequip effects
{
    int bBol = FALSE;
    int nTimeNow = GetTimeSecond() + (GetTimeHour() * 120);
    int nTimeLast = GetLocalInt(oPC, "eff_last");
    if ((nTimeLast + nSeconds) < nTimeNow || (nTimeLast - nSeconds) > nTimeNow)
        {bBol = TRUE;}
    else
        {bBol = FALSE;}
    SetLocalInt(oPC, "eff_last", nTimeNow);
    return bBol;
}

//void main(){}


