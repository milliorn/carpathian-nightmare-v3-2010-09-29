#include "inc_dispell_func"

int GetIsPureCaster(object oCaster) {
   if (GetIsObjectValid(GetSpellCastItem())) return FALSE;
   int nCasterLevel = GetLevelByPosition(1, oCaster) + GetLevelByClass(CLASS_TYPE_PALEMASTER, oCaster);
   if (GetHitDice(oCaster)==nCasterLevel && nCasterLevel > 0) {
      if (GetLevelByClass(CLASS_TYPE_CLERIC, oCaster)) return FALSE;
      if (GetLevelByClass(CLASS_TYPE_BARD, oCaster)) return FALSE;
      if (GetLevelByClass(CLASS_TYPE_PALADIN, oCaster)) return FALSE;
      if (GetLevelByClass(CLASS_TYPE_RANGER, oCaster)) return FALSE;
      return TRUE;
   }
   return FALSE;
}

int GetPureCasterLevel(object oCaster, int nSpellSchool) {
   int nLevel = GetCasterLevel(oCaster);
   if (nLevel==0) return 15;
   if (GetIsPureCaster(oCaster)) {
      int nCasterLevel = GetLevelByPosition(1, oCaster);
      int nPaleLevel = GetLevelByClass(CLASS_TYPE_PALEMASTER, oCaster);
      if (nSpellSchool==SPELL_SCHOOL_NECROMANCY) nPaleLevel = nPaleLevel / 2; // / 3;
      else nPaleLevel = 0; //nPaleLevel / 2;
      return nCasterLevel + nPaleLevel;
   }
   return nLevel;
}

int GetPureCasterBonus(object oCaster, int nSpellSchool) {
   int nPure = 0;
   if (GetIsPureCaster(oCaster)) {
      int nPureLevel = GetPureCasterLevel(oCaster, nSpellSchool);
      if (GetHasSpellSchool(oCaster, nSpellSchool)) nPure =  nPureLevel / 5; // DOUBLE DC, MAX = 8
      else nPure = nPureLevel / 10; // MAX = 4
      FloatingTextStringOnCreature("Pure Level " + IntToString(nPureLevel) + " / DC Bonus " + IntToString(nPure), oCaster, FALSE);
   }
   return nPure;
}

int GetCasterModifier(object oCaster) {
   int nInt = 0;
   int nCha = 0;
   int nWis = 0;
   int nClass = GetLevelByClass(CLASS_TYPE_WIZARD, oCaster);
   if (nClass > 0) nInt = GetAbilityModifier(ABILITY_INTELLIGENCE, oCaster);
   nClass = GetLevelByClass(CLASS_TYPE_BARD, oCaster) + GetLevelByClass(CLASS_TYPE_SORCERER, oCaster);
   if (nClass > 0) nCha = GetAbilityModifier(ABILITY_CHARISMA, oCaster);
   nClass = GetLevelByClass(CLASS_TYPE_CLERIC, oCaster) + GetLevelByClass(CLASS_TYPE_DRUID, oCaster) +
            GetLevelByClass(CLASS_TYPE_PALADIN, oCaster) + GetLevelByClass(CLASS_TYPE_RANGER, oCaster);
   if (nClass > 0) nWis = GetAbilityModifier(ABILITY_WISDOM, oCaster);
   return GetMax(nInt, GetMax(nCha, nWis));
}

//void main(){}

