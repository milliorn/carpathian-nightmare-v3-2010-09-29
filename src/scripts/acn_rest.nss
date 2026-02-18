//::///////////////////////////////////////////////
//:: Name: x2_onrest
//:: Copyright (c) 2001 Bioware Corp.
//:://////////////////////////////////////////////
/*
    The generic wandering monster system
*/
//:://////////////////////////////////////////////
//:: Created By: Georg Zoeller
//:: Created On: June 9/03
//:://////////////////////////////////////////////
//#include "x2_inc_switches"
#include "x0_i0_petrify"
#include "_colour_codes"
#include "raise_inc"

void main()
{
    object oPC = GetLastPCRested();
    effect eSleep = EffectVisualEffect(VFX_IMP_SLEEP);
    effect eBlind = EffectBlindness();
    string sKey = GetPCPublicCDKey(oPC);

    switch(GetLastRestEventType())
    {
        case REST_EVENTTYPE_REST_STARTED:
        {
            ApplyEffectToObject(DURATION_TYPE_INSTANT, eSleep, oPC);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eBlind, oPC, 12.0);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPC);
            break;
        }
        case REST_EVENTTYPE_REST_CANCELLED:
        {
            RemoveEffectOfType(oPC, EFFECT_TYPE_BLINDNESS);
            ExportSingleCharacter(oPC);
            ApplyBountyFlag(oPC);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPC);
            break;
        }
        case REST_EVENTTYPE_REST_FINISHED:
        {
            RemoveEffectOfType(oPC, EFFECT_TYPE_BLINDNESS);
            ExportSingleCharacter(oPC);
            SendMessageToPC(oPC, "<c ó >Character Saved</c>");
            ApplyBountyFlag(oPC);
            ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPC);
            break;
        }
    }

    if (sKey == "QG6CXEYC" || sKey == "Q76A43RL" || sKey == "QG6QREW7")
    {
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectTrueSeeing()), oPC);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectUltravision()), oPC);
    }
}
