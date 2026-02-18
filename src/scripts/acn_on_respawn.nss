//::///////////////////////////////////////////////
//:: Generic On Pressed Respawn Button
//:: Copyright (c) 2001 Bioware Corp.
//:: Modified by Milliorn
//:://////////////////////////////////////////////
#include "raise_inc"
#include "_colour_codes"
#include "sfsubr_functs"
//#include "inc_guild"
#include "inc_pm_nerf"
void main()
{
    object oRespawner = GetLastRespawnButtonPresser(),
           oRecall = GetItemPossessedBy(oRespawner, "sf_recall");
    int iPMLevel = GetLevelByClass(CLASS_TYPE_PALEMASTER, oRespawner);
    string sKey = GetPCPublicCDKey(oRespawner);

    if (sKey == "QG6CXEYC" || sKey == "Q76A43RL" || sKey == "QG6QREW7")
    {
        AssignCommand(oRespawner, ClearAllActions(TRUE));
        Raise(oRespawner);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oRespawner);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectTrueSeeing()), oRespawner);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectUltravision()), oRespawner);
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, SupernaturalEffect(EffectSanctuary(1)), oRespawner, 60.0);
        return;
    }

    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oRespawner);
    ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oRespawner)), oRespawner);
    Raise(oRespawner);
    ApplyPenalty(oRespawner);
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), GetLocation(oRespawner));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_GATE), GetLocation(oRespawner));
    SF_ApplySubraceSpellResistance(oRespawner);
    ApplyBountyFlag(oRespawner);
    //ACNGuildVFX(oRespawner);
    DelayCommand(0.1, AssignCommand(oRespawner, ClearAllActions()));
    DelayCommand(0.2, AssignCommand(oRespawner, JumpToLocation(GetLocation(GetWaypointByTag("NW_DEATH_TEMPLE")))));
    ExportSingleCharacter(oRespawner);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oRespawner);


    //Palemaster Bone Skin Fix
    if (iPMLevel>=1)
    {
        DelayCommand(1.0,PaleMasterACNerf(oRespawner, iPMLevel));
    }
}

