//::///////////////////////////////////////////////
//:: [Harm]
//:: [NW_S0_Harm.nss]
//:: Copyright (c) 2000 Bioware Corp.
//:://////////////////////////////////////////////
//:: Reduces target to 1d4 HP on successful touch
//:: attack.  If the target is undead it is healed.
//:://////////////////////////////////////////////
//:: Created By: Keith Soleski
//:: Created On: Jan 18, 2001
//:://////////////////////////////////////////////
//:: VFX Pass By: Preston W, On: June 20, 2001
//:: Update Pass By: Preston W, On: Aug 1, 2001

#include "NW_I0_SPELLS"
void main()
{
    //Declare major variables
    object oCaster = OBJECT_SELF;
    int nCasterLvl = GetCasterLevel(oCaster);
    object oTarget = GetSpellTargetObject();
    int nDamage, nHeal;
    int nMetaMagic = GetMetaMagicFeat();
    int nTouch = TouchAttackMelee(oTarget);
    effect eVis = EffectVisualEffect(246);
    effect eVis2 = EffectVisualEffect(VFX_IMP_HEALING_G);
    effect eHeal, eDam;
    //Check that the target is undead
    if (GetRacialType(oTarget) == RACIAL_TYPE_UNDEAD)
    {
        //Figure out the amount of damage to heal
        nHeal = 10 * nCasterLvl;
        if (nHeal > 400){nHeal = 400;}
        //Set the heal effect
        eHeal = EffectHeal(nHeal);
        int bValid = FALSE;
    effect eParal = GetFirstEffect(oTarget);
    effect eVis3 = EffectVisualEffect(VFX_IMP_REMOVE_CONDITION);
    //Get the first effect on the target
    }
    else if (nTouch) //== TRUE) 1 or 2 are valid return numbers from TouchAttackMelee
    {
        if(!GetIsReactionTypeFriendly(oTarget))
        {
            //Fire cast spell at event for the specified target
            SignalEvent(oTarget, EventSpellCastAt(OBJECT_SELF, SPELL_HARM));
            if (!MyResistSpell(OBJECT_SELF, oTarget))
            {
                //Will save for half damage
                if (MySavingThrow(SAVING_THROW_WILL, oTarget, GetSpellSaveDC()))
                    {
                    nDamage = nDamage/2;
                    }
                nDamage = 10*nCasterLvl;
                if (nDamage > 400){nDamage = 400;}
                if (nDamage > (GetCurrentHitPoints(oTarget) - 1))
                {
                nDamage = GetCurrentHitPoints(oTarget) - 1;
                }
                eDam = EffectDamage(nDamage,DAMAGE_TYPE_NEGATIVE);
                //Apply the VFX impact and effects
                DelayCommand(1.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oTarget));
                ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget);
            }
        }
    }
}
