// Dispel Magic/Breach Override
// roll D20 + nPureLevel Against 11+Target Arcane Level

const int BREACH_SPELL_COUNT = 34;

#include "inc_tokenizer"
#include "x0_i0_spells"
#include "inc_castrlvl"
#include "inc_pure_caster"

int GetSchool(string sSchool) {
   if (sSchool=="A") return SPELL_SCHOOL_ABJURATION;   if (sSchool=="C") return SPELL_SCHOOL_CONJURATION  ;
   if (sSchool=="D") return SPELL_SCHOOL_DIVINATION;   if (sSchool=="E") return SPELL_SCHOOL_ENCHANTMENT  ;
   if (sSchool=="V") return SPELL_SCHOOL_EVOCATION ;   if (sSchool=="I") return SPELL_SCHOOL_ILLUSION     ;
   if (sSchool=="N") return SPELL_SCHOOL_NECROMANCY;   if (sSchool=="T") return SPELL_SCHOOL_TRANSMUTATION;
   return SPELL_SCHOOL_GENERAL;
}

int BreachSpellCheck(object oCaster, object oCreator, string sSpellText, int nSpellID = SPELL_GREATER_SPELL_BREACH) {
   int nBase       = 0;
   int nRoll       = Random(100);
   int nRollBonus  = 0;
   int nScrollPen  = (GetSpellCastItem()==OBJECT_INVALID) ? 0 : 20;
   if      (nSpellID==SPELL_LESSER_SPELL_BREACH)       nBase = 10;
   else if (nSpellID==SPELL_GREATER_SPELL_BREACH)      nBase = 25;
   else if (nSpellID==SPELL_MORDENKAINENS_DISJUNCTION) nBase = 50;

   int nCreatorLevel = MyGetCasterLevel(oCreator);
   int nCasterLevel = GetPureCasterLevel(oCaster, SPELL_SCHOOL_ABJURATION) + GetPureCasterBonus(oCaster, SPELL_SCHOOL_ABJURATION);
   if      (GetHasFeat(FEAT_EPIC_SPELL_FOCUS_ABJURATION, oCaster))    nRollBonus = 6;
   else if (GetHasFeat(FEAT_GREATER_SPELL_FOCUS_ABJURATION, oCaster)) nRollBonus = 4;
   else if (GetHasFeat(FEAT_SPELL_FOCUS_ABJURATION, oCaster))         nRollBonus = 2;
   string sMsg = sSpellText + " Breach check (base+focus+casterlevel-creatorlevel-scroll)>d100): " + IntToString(nBase)+"+"+IntToString(nRollBonus)+"+"+IntToString(nCasterLevel)+"-"+IntToString(nCreatorLevel)+"-"+IntToString(nScrollPen)+">="+IntToString(nRoll);
   nBase += nRollBonus + nCasterLevel - (nCreatorLevel + nScrollPen);
   if (nBase>=nRoll) sMsg += ": *Success*";
   else sMsg += ": *Failure*";
   SendMessageToPC(oCaster, sMsg);
   return (nBase>=nRoll);
}

int AltGetSpellBreachProtection(int nLastChecked) {
   if      (nLastChecked== 1) return SPELL_GREATER_SPELL_MANTLE;
   else if (nLastChecked== 2) return SPELL_PREMONITION;
   else if (nLastChecked== 3) return SPELL_SPELL_MANTLE;
   else if (nLastChecked== 4) return SPELL_SHADOW_SHIELD;
   else if (nLastChecked== 5) return SPELL_GREATER_STONESKIN;
   else if (nLastChecked== 6) return SPELL_ETHEREAL_VISAGE;
   else if (nLastChecked== 7) return SPELL_GLOBE_OF_INVULNERABILITY;
   else if (nLastChecked== 8) return SPELL_ENERGY_BUFFER;
   else if (nLastChecked== 9) return SPELL_ETHEREALNESS; // greater sanctuary
   else if (nLastChecked==10) return SPELL_MINOR_GLOBE_OF_INVULNERABILITY;
   else if (nLastChecked==11) return SPELL_RESISTANCE;
   else if (nLastChecked==12) return SPELL_STONESKIN;
   else if (nLastChecked==13) return SPELL_LESSER_SPELL_MANTLE;
   else if (nLastChecked==14) return SPELL_MESTILS_ACID_SHEATH;
   else if (nLastChecked==15) return SPELL_MIND_BLANK;
   else if (nLastChecked==16) return SPELL_ELEMENTAL_SHIELD;
   else if (nLastChecked==17) return SPELL_PROTECTION_FROM_SPELLS;
   else if (nLastChecked==18) return SPELL_PROTECTION_FROM_ELEMENTS;
   else if (nLastChecked==19) return SPELL_RESIST_ELEMENTS;
   else if (nLastChecked==20) return SPELL_DEATH_ARMOR;
   else if (nLastChecked==21) return SPELL_GHOSTLY_VISAGE;
   else if (nLastChecked==22) return SPELL_ENDURE_ELEMENTS;
   else if (nLastChecked==23) return SPELL_SHADOW_SHIELD;
   else if (nLastChecked==24) return SPELL_SHADOW_CONJURATION_MAGE_ARMOR;
   else if (nLastChecked==25) return SPELL_NEGATIVE_ENERGY_PROTECTION;
   else if (nLastChecked==26) return SPELL_SANCTUARY;
   else if (nLastChecked==27) return SPELL_MAGE_ARMOR;
   else if (nLastChecked==28) return SPELL_STONE_BONES;
   else if (nLastChecked==29) return SPELL_SHIELD;
   else if (nLastChecked==30) return SPELL_SHIELD_OF_FAITH;
   else if (nLastChecked==31) return SPELL_LESSER_MIND_BLANK;
   else if (nLastChecked==32) return SPELL_IRONGUTS;
   else if (nLastChecked==33) return SPELL_SPELL_RESISTANCE;
   else if (nLastChecked==34) return SPELL_TRUE_SEEING;
   return SPELL_RESISTANCE;
}

void AltSpellBreach(object oCaster, object oTarget, int nBreachMax, int nSR, int nSpellID = SPELL_GREATER_SPELL_BREACH) {
   int nBreachCnt = 0;
   int nCheckSpell = 0;

   string sSpellName; // Spell name
   string sSuccess = "   *Success* -- these protections were breached:";

   if      (nSpellID==SPELL_LESSER_SPELL_BREACH)       sSpellName = "Lesser Spell Breach";
   else if (nSpellID==SPELL_GREATER_SPELL_BREACH)      sSpellName = "Greater Spell Breach";
   else if (nSpellID==SPELL_MORDENKAINENS_DISJUNCTION) sSpellName = "Mordenkainen's Breach";

   SendMessageToPC(oTarget, GetName(oCaster) + " casts " + sSpellName);
   SendMessageToPC(oCaster, sSpellName + " cast on " + GetName(oTarget));
   int nNextSpellID;
   if (!GetIsReactionTypeFriendly(oTarget)) {
      if (nSpellID!=SPELL_MORDENKAINENS_DISJUNCTION) SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, nSpellID));
      while (nCheckSpell <= BREACH_SPELL_COUNT && nBreachCnt < nBreachMax) {
         nNextSpellID = AltGetSpellBreachProtection(nCheckSpell);
         if (GetHasSpellEffect(nNextSpellID, oTarget)) {
            int bRemoved = FALSE;
            int bSpecialDone = FALSE;
            effect eProtection = GetFirstEffect(oTarget);
            while (GetIsEffectValid(eProtection)) {
               if (GetEffectSpellId(eProtection)==nNextSpellID) {
                  if (nNextSpellID==SPELL_SPELL_RESISTANCE) {
                     if (!bSpecialDone) bRemoved = BreachSpellCheck(oCaster, GetEffectCreator(eProtection), "Spell Resistance", nSpellID);
                     bSpecialDone = TRUE;
                  } else if (nNextSpellID==SPELL_TRUE_SEEING) {
                     if (!bSpecialDone) bRemoved = BreachSpellCheck(oCaster, GetEffectCreator(eProtection), "True Sight", nSpellID);
                     bSpecialDone = TRUE;
                  } else {
                     bRemoved = TRUE;
                  }
                  if (bRemoved) RemoveEffect(oTarget, eProtection);
               }
               eProtection = GetNextEffect(oTarget);
            }
            if (bRemoved) {
               nBreachCnt++;
               sSpellName = Get2DAString("spells", "Label", nNextSpellID);
               if (sSpellName=="") sSpellName = "Unknown Protection";
               sSuccess  += "\n   --> " + sSpellName;
            }
         }
         nCheckSpell++;
      }
      effect eSR = EffectSpellResistanceDecrease(nSR);
      effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
      effect eLink = ExtraordinaryEffect(EffectLinkEffects(eDur, eSR));
      ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(10));
      if (!nBreachCnt) sSuccess += "None";
      SendMessageToPC(oTarget, sSuccess);
      SendMessageToPC(oCaster, sSuccess);

   }
   ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_BREACH), oTarget);
}

void AltspellsDispelMagic(object oTarget, object oCaster, effect eVis, int nPureLevel, int nLimit=999) {

   // Visual Special Effect
   ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
   SignalEvent(oTarget, EventSpellCastAt(oCaster, GetSpellId(), spellsIsTarget(oTarget, SPELL_TARGET_STANDARDHOSTILE, oCaster)));

   int nCount = 0;

   int nDC;           // 16+Effect creator level
   int nDCBonus;      // Target arcane defense abjuration
   int nSpellID = GetSpellId();      // Spell ID
   int nSpellSchool;  // Spell School
   string sSpellName; // Spell name
   string sSpellList = ""; // LIST OF SPELLS CHECKED
   string sSuccess = "   *Success* -- these effects were dispelled:";
   string sFailure = "   *Failure* -- these effects were not dispelled:";
   string sMessage;
   int nSuccessCnt = 0;
   int nFailureCnt = 0;

   if      (nSpellID==SPELL_LESSER_DISPEL) sSpellName = "Lesser Dispel";
   else if (nSpellID==SPELL_DISPEL_MAGIC)  sSpellName = "Dispel";
   else if (nSpellID==SPELL_GREATER_DISPELLING) sSpellName = "Greater Dispel";
   else if (nSpellID==SPELL_MORDENKAINENS_DISJUNCTION) sSpellName = "Mordenkainen's Disjunction";

   SendMessageToPC(oTarget, GetName(oCaster) + " casts " + sSpellName);
   SendMessageToPC(oCaster, sSpellName + " cast on " + GetName(oTarget));

   int nRollBonus  = 0;
   if      (GetHasFeat(FEAT_EPIC_SPELL_FOCUS_ABJURATION, oCaster))    nRollBonus += 6;
   else if (GetHasFeat(FEAT_GREATER_SPELL_FOCUS_ABJURATION, oCaster)) nRollBonus += 4;
   else if (GetHasFeat(FEAT_SPELL_FOCUS_ABJURATION, oCaster))         nRollBonus += 2;

   effect eEffect = GetFirstEffect(oTarget);
   while (GetIsEffectValid(eEffect) && nCount<nLimit) {
      if (GetEffectSubType(eEffect)==SUBTYPE_MAGICAL) {
         nSpellID        = GetEffectSpellId(eEffect);
         nSpellSchool    = GetSchool(Get2DAString("spells", "School", nSpellID));
         sSpellName      = Get2DAString("spells", "Label", nSpellID);
         if (sSpellName=="") sSpellName = "Unknown Effect";
         int nRoll       = d20();
         object oCreator   = GetEffectCreator(eEffect);
         int nCreatorLevel = MyGetCasterLevel(oCreator);
//         int nCreatorBonus = GetPureCasterBonus(oCreator, nSpellSchool);
  //       int nCreatorLevel = GetPureCasterLevel(oCreator, nSpellSchool) + nCreatorBonus;
    //     nCreatorLevel     = GetMax(nCreatorLevel, MyGetCasterLevel(oCreator));
         int nDC           = 16;
         int nDCBonus      = GetHasFeat(FEAT_ARCANE_DEFENSE_ABJURATION,oTarget) ? 2 : 0;
         if (!GetIsTokenInString(IntToString(nSpellID), sSpellList))
         {
            sSpellList = AddTokenToString(IntToString(nSpellID), sSpellList);
            sMessage  = "\n   --> " + sSpellName;
            sMessage += " (" + IntToString(nPureLevel) + "+" + IntToString(nRollBonus) + "+" + IntToString(nRoll);
            sMessage += " = " + IntToString(nPureLevel + nRollBonus + nRoll);
            sMessage += " vs DC " + IntToString(nDC) + "+" + IntToString(nCreatorLevel) + "+" + IntToString(nDCBonus);
            sMessage += " = " + IntToString(nDC + nDCBonus + nCreatorLevel) + ")";

            //Remove effect if DC Failed
            if (nRollBonus + nRoll + nPureLevel > nDC + nCreatorLevel + nDCBonus) {
               nSuccessCnt++;
               sSuccess += sMessage;
               RemoveEffect(oTarget, eEffect);
               nCount++;         // Increment effects dispelled count

            } else {
               nFailureCnt++;
               sFailure += sMessage;
            }
         }
      }
      eEffect = GetNextEffect(oTarget);
   }
   if (!nSuccessCnt) sSuccess += "None";
   if (!nFailureCnt) sFailure += "None";
   SendMessageToPC(oTarget, sSuccess);
   SendMessageToPC(oCaster, sSuccess);
   SendMessageToPC(oTarget, sFailure);
   SendMessageToPC(oCaster, sFailure);
}

//void main (){}
