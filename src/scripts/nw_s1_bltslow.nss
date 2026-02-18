//::///////////////////////////////////////////////
//:: Bolt: Slow
//:: NW_S1_BltSlow
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    Creature must make a ranged touch attack to hit
    the intended target.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: June 18 , 2001
//:: Updated On: July 15, 2003 Georg Zoeller - Removed saving throws
//:://////////////////////////////////////////////

/*
    Modified By Scarface For Scarface's No PVP Exploit Fixes
*/

#include "NW_I0_SPELLS"
void main()
{
  //Declare major variables
  object oTarget = GetSpellTargetObject();
  object oCaster = OBJECT_SELF;
  int nHD = GetHitDice(oCaster);
  effect eVis = EffectVisualEffect(VFX_IMP_SLOW);
  effect eBolt = EffectSlow();
  effect eDur = EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE);
  effect eLink = EffectLinkEffects(eBolt, eDur);
  int nDC = 10 + (nHD/2);
  int nCount = (nHD + 1) / 2;

  //Fire cast spell at event for the specified target
  SignalEvent(oTarget, EventSpellCastAt(oCaster, SPELLABILITY_BOLT_SLOW));

    //Make a saving throw check
    if (TouchAttackRanged(oTarget))
    {
        //Apply the VFX impact and effects
        if (GetIsReactionTypeHostile(oTarget))
        {
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eLink, oTarget, RoundsToSeconds(nCount));
        }
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
    }
}
