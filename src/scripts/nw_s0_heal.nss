//::///////////////////////////////////////////////
//:: Heal
//:: [NW_S0_Heal.nss]
//:: Copyright (c) 2000 Bioware Corp.
//:://////////////////////////////////////////////
//:: Heals the target to full unless they are undead.
//:: If undead they reduced to 1d4 HP.
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: Jan 12, 2001
//:://////////////////////////////////////////////
//:: Update Pass By: Preston W, On: Aug 1, 2001

#include "NW_I0_SPELLS"
void main()
{
  //Declare major variables
  object oCaster = OBJECT_SELF;
  int nCasterLvl = GetCasterLevel(oCaster);
  object oTarget = GetSpellTargetObject();
  effect eKill, eHeal;
  int nDamage, nHeal, nModify, nMetaMagic, nTouch;
  effect eSun = EffectVisualEffect(VFX_IMP_SUNSTRIKE);
  effect eHealVis = EffectVisualEffect(VFX_IMP_HEALING_X);
    //Check to see if the target is an undead
    if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
    {
        if(!GetIsReactionTypeFriendly(oTarget))
        {
            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_HEAL));
            //Make a touch attack
            if (TouchAttackMelee(oTarget))
            {
                //Make SR check
                if (!MyResistSpell(OBJECT_SELF, oTarget))
                {
                    //Roll damage
                    nDamage = 10 * nCasterLvl;
                    if (nDamage > 400){nDamage = 400;}
                    //Will save for half damage
                    if (MySavingThrow(SAVING_THROW_WILL, oTarget, GetSpellSaveDC()))
                    {
                    nDamage = nDamage/2;
                    }
                    if (nDamage > (GetCurrentHitPoints(oTarget) - 1))
                    {
                    nDamage = GetCurrentHitPoints(oTarget) - 1;
                    }
                    //Set damage
                    eKill = EffectDamage(nDamage, DAMAGE_TYPE_POSITIVE);
                    //Apply damage effect and VFX impact
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eKill, oTarget);
                    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSun, oTarget);
                }
            }
        }
    }
    else
    {
        //Fire cast spell at event for the specified target
        SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_HEAL, FALSE));
        //Figure out how much to heal
        nHeal = 10 * nCasterLvl;
        if (nHeal > 400){nHeal = 400;}
        //Set the heal effect
        eHeal = EffectHeal(nHeal);
    //Remove negative mind effects and poisons/diseases
    int bValid = FALSE;
    effect eParal = GetFirstEffect(oTarget);
    effect eVis3 = EffectVisualEffect(VFX_IMP_REMOVE_CONDITION);
    //Get the first effect on the target
    if (bValid)
    {
        //Apply VFX Impact
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis3, oTarget);
    }
        //Apply the heal effect and the VFX impact
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHealVis, oTarget);
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
    }
}
