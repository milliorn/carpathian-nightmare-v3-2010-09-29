//::///////////////////////////////////////////////
//:: Hell Hound Fire Breath
//:: NW_S1_HndBreath
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    A cone of fire eminates from the hound.
*/
//:://////////////////////////////////////////////
//:: Created By: Preston Watamaniuk
//:: Created On: May 14, 2001
//:://////////////////////////////////////////////
//:: Updated By: Andrew Nobbs
//:: Updated On: FEb 26, 2003
//:: Note: Changed the faction check to GetIsEnemy
//:://////////////////////////////////////////////

/*
    Modified By Scarface For Scarface's No PVP Exploit Fixes
*/

void main()
{
  //Declare major variables
  object oCaster = OBJECT_SELF;
  int nHD = GetHitDice(oCaster);
  int nDamage = d4(1)+1;
  float fDelay;
  location lTargetLocation = GetSpellTargetLocation();
  object oTarget;
  effect eCone;
  effect eVis = EffectVisualEffect(VFX_IMP_FLAME_S);

  //Get first target in spell area
  oTarget = GetFirstObjectInShape(SHAPE_SPELLCONE, 11.0, lTargetLocation, TRUE);
    while(GetIsObjectValid(oTarget))
    {
      //Fire cast spell at event for the specified target
      SignalEvent(oTarget, EventSpellCastAt(oCaster, SPELLABILITY_HELL_HOUND_FIREBREATH));
      //Determine effect delay
      fDelay = GetDistanceBetween(oCaster, oTarget)/20;
      //Set damage effect
      eCone = EffectDamage(nDamage, DAMAGE_TYPE_FIRE);
        if(nDamage > 0)
        {
            //Apply the VFX impact and effects
            if (GetIsReactionTypeHostile(oTarget))
            {
                DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eCone, oTarget));
            }
            DelayCommand(fDelay, ApplyEffectToObject(DURATION_TYPE_INSTANT, eVis, oTarget));
        }
      //Get next target in spell area
      oTarget = GetNextObjectInShape(SHAPE_SPELLCONE, 11.0, lTargetLocation, TRUE);
    }
}



