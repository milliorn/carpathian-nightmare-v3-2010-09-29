// Milliorn's PC Info displayer item
#include "x2_inc_switches"
void main()
{
    object oActivator = GetItemActivator(),
           oActivated = GetItemActivated(),
           oTarget = GetItemActivatedTarget();

    string sBaseStr = IntToString(GetAbilityScore(oTarget, ABILITY_STRENGTH, TRUE)),
           sBaseDex = IntToString(GetAbilityScore(oTarget, ABILITY_DEXTERITY, TRUE)),
           sBaseCon = IntToString(GetAbilityScore(oTarget, ABILITY_CONSTITUTION, TRUE)),
           sBaseInt = IntToString(GetAbilityScore(oTarget, ABILITY_INTELLIGENCE, TRUE)),
           sBaseWis = IntToString(GetAbilityScore(oTarget, ABILITY_WISDOM, TRUE)),
           sBaseCha = IntToString(GetAbilityScore(oTarget, ABILITY_CHARISMA, TRUE)),
           sStr = IntToString(GetAbilityScore(oTarget, ABILITY_STRENGTH, FALSE)),
           sDex = IntToString(GetAbilityScore(oTarget, ABILITY_DEXTERITY, FALSE)),
           sCon = IntToString(GetAbilityScore(oTarget, ABILITY_CONSTITUTION, FALSE)),
           sInt = IntToString(GetAbilityScore(oTarget, ABILITY_INTELLIGENCE, FALSE)),
           sWis = IntToString(GetAbilityScore(oTarget, ABILITY_WISDOM, FALSE)),
           sCha = IntToString(GetAbilityScore(oTarget, ABILITY_CHARISMA, FALSE)),
           sXP = IntToString(GetXP(oTarget)),
           sWeight = IntToString(GetWeight(oTarget)),
           sFort = IntToString(GetFortitudeSavingThrow(oTarget)),
           sReflex = IntToString(GetReflexSavingThrow(oTarget)),
           sWill = IntToString(GetWillSavingThrow(oTarget)),
           sRace = IntToString(GetRacialType(oTarget)),
           sPortrait = GetPortraitResRef(oTarget),
           sPortraitID = IntToString(GetPortraitId(oTarget)),
           sPheno = IntToString(GetPhenoType(oTarget)),
           sLootable = IntToString(GetLootable(oTarget)),
           sLvl = IntToString(GetHitDice(oTarget)),
           sGender = IntToString(GetGender(oTarget)),
           sGold = IntToString(GetGold(oTarget)),
           sFactionLeader = GetName(GetFactionLeader(oTarget)),
           sFactionGold = IntToString(GetFactionGold(oTarget)),
           sDeity = GetDeity(oTarget),
           sCaster = IntToString(GetCasterLevel(oTarget)),
           sBAB = IntToString(GetBaseAttackBonus(oTarget)),
           sArea = GetName(GetArea(oTarget)),
           sArcane = IntToString(GetArcaneSpellFailure(oTarget)),
           sAppearance = IntToString(GetAppearanceType(oTarget)),
           sAge =IntToString(GetAge(oTarget)),
           sSR = IntToString(GetSpellResistance(oTarget)),
           sAC = IntToString(GetAC(oTarget)),
           sName = GetPCPublicCDKey(oActivator),
           sAccount = GetPCPlayerName(oTarget),
           sCDKey = GetPCPublicCDKey(oTarget),
           sPlayer = GetName(oTarget);

    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;

    if (sName == "QG6CXEYC" || //milliorn
        sName == "Q76A43RL" || //milliorn
        sName == "QCRWUXFF" || //bassmaster
        sName == "QG6QREW7" || //Wolfstar
        sName == "QC74AN4H")

    {


        SendMessageToPC(oActivator, sPlayer+" "+sAccount+" "+sCDKey+
        "   Age: "+sAge+
        "   Gender: "+sGender+
        "   Appearance: "+sAppearance+
        "   Race: "+sRace+
        "   Deity: "+sDeity+
        "   Weight: "+sWeight+
        "   Phenotype: "+sPheno+
        "   PortraitID: "+sPortraitID+
        "   Portrait: "+sPortrait+
        "   Area: "+sArea+
        "   Level: "+sLvl+
        "   Legendary Level: "+sLootable+
        "   Faction GP: "+sFactionGold+
        "   Faction Leader: "+sFactionLeader+
        "   Gold: "+sGold+
        "   XP: "+sXP+
        "   Caster Level: "+sCaster+
        "   Arcane Failure: "+sArcane+
        "   STR: "+sBaseStr+"/"+sStr+
        "   DEX: "+sBaseDex+"/"+sDex+
        "   CON: "+sBaseCon+"/"+sCon+
        "   INT: "+sBaseInt+"/"+sInt+
        "   WIS: "+sBaseWis+"/"+sWis+
        "   CHA: "+sBaseCha+"/"+sCha+
        "   AC: "+sAC+
        "   SR: "+sSR+
        "   BAB: "+sBAB+
        "   Fortitude: "+sFort+
        "   Reflex: "+sReflex+
        "   Will: "+sWill+
        "");

        SendMessageToAllDMs(sPlayer+" "+sAccount+" "+sCDKey+
        "   Age: "+sAge+
        "   Gender: "+sGender+
        "   Appearance: "+sAppearance+
        "   Race: "+sRace+
        "   Deity: "+sDeity+
        "   Weight: "+sWeight+
        "   Phenotype: "+sPheno+
        "   PortraitID: "+sPortraitID+
        "   Portrait: "+sPortrait+
        "   Area: "+sArea+
        "   Level: "+sLvl+
        "   Legendary Level: "+sLootable+
        "   Faction GP: "+sFactionGold+
        "   Faction Leader: "+sFactionLeader+
        "   Gold: "+sGold+
        "   XP: "+sXP+
        "   Caster Level: "+sCaster+
        "   Arcane Failure: "+sArcane+
        "   STR: "+sBaseStr+"/"+sStr+
        "   DEX: "+sBaseDex+"/"+sDex+
        "   CON: "+sBaseCon+"/"+sCon+
        "   INT: "+sBaseInt+"/"+sInt+
        "   WIS: "+sBaseWis+"/"+sWis+
        "   CHA: "+sBaseCha+"/"+sCha+
        "   AC: "+sAC+
        "   SR: "+sSR+
        "   BAB: "+sBAB+
        "   Fortitude: "+sFort+
        "   Reflex: "+sReflex+
        "   Will: "+sWill+
        "");


    }
    else
    {
        SendMessageToPC(oActivator, "You cannot use this item");
        SendMessageToAllDMs("<có  >Player </c>"+sCDKey+"<có  > is trying to use a DM item");
        DestroyObject(oActivated);
    }
}
