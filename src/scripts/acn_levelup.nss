#include "_colour_codes"
#include "sfsubr_functs"
#include "inc_pm_nerf"
//#include "sf_hips_inc"

int HasItem(object oCreature, string s)
{
    return  GetIsObjectValid(GetItemPossessedBy(oCreature, s));
}

void main()
{
    object oPC = GetPCLevellingUp(),
           oRecall = GetItemPossessedBy(oPC, "sf_recall");
    int iLevel = GetHitDice(oPC);
    int iPMLevel = GetLevelByClass(CLASS_TYPE_PALE_MASTER, oPC);
    string sLevel = IntToString(GetHitDice(oPC)),
           sName = GetName(oPC),
           sArea = GetTag(GetArea(oPC));

    switch( GetAlignmentGoodEvil(oPC))
    {
        case ALIGNMENT_NEUTRAL:
        {
            int nNewXP = (iLevel * (iLevel - 1) * 500) - 1;
            SetXP(oPC, nNewXP);
            DelayCommand(3.0, GiveXPToCreature(oPC, 1));
            SendMessageToPC(oPC, "<cþf > WARNING!  You CANNOT LEVEL UP until you choose either Good or Evil Alignment.  Go to the Alignment Pedestals in Town");
            FloatingTextStringOnCreature("<cþf > WARNING!  You CANNOT LEVEL UP until you choose either Good or Evil Alignment.  Go to the Alignment Pedestals in Town</c>", oPC, FALSE);
            SendMessageToAllDMs(sName + "<cþf > is attempting to levelup without a Good/Evil Alignment.  Reroll was performed</c>");
            break;
        }
    }
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPC);
        ExportSingleCharacter(oPC);
        SF_SubraceOnLevelUp(oPC);
        ApplyBountyFlag(oPC);
        ExecuteScript("fky_chat_levelup", oPC);
        ExecuteScript("acn_class_change", oPC);
        SendMessageToPC(oPC, "<c ó >Character Saved</c>");

//Palemaster Bone Skin Fix
    if (iPMLevel>=1)
        {DelayCommand(1.0,PaleMasterACNerf(oPC, iPMLevel));}

        if (iLevel == 5 ||
            iLevel == 10 ||
            iLevel == 15 ||
            iLevel == 20 ||
            iLevel == 25 ||
            iLevel == 30 ||
            iLevel == 35 ||
            iLevel == 40)
        {
            SpeakString(sName+" has advanced to level " + sLevel, TALKVOLUME_SHOUT);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_WAIL_O_BANSHEES), oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);
        }

        int nAlign = GetAlignmentGoodEvil(oPC);
        switch (nAlign)
        {
            case ALIGNMENT_EVIL:
            DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_10), oPC));
            DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_20), oPC));
            DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_30), oPC));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);

            break;
            case ALIGNMENT_GOOD:
            DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_10), oPC));
            DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_20), oPC));
            DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_HOLY_30), oPC));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);
            break;

            case ALIGNMENT_NEUTRAL:
            DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_10), oPC));
            DelayCommand(0.6, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_20), oPC));
            DelayCommand(0.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_NORMAL_30), oPC));
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC);
            break;
        }
}


