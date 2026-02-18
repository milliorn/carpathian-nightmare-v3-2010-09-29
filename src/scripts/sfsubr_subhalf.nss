#include "sfsubr_functs"

void LoadSubrace_Ghostwise()
{
    SF_CreateNewSubrace("Ghostwise");
    SF_SetSubraceRaceRestriction("Ghostwise", ALLOW_USE_TRUE, RACE_RESTRICT_HALFLING);
    SF_AdjustSubraceStats("Ghostwise", 1, 1, 0, 0, -1, -1);
    SF_SetSubraceAlignmentRestriction("Ghostwise", ALLOW_USE_FALSE, ALIGN_RESTRICT_LAWFUL);
    SF_SetSubraceFeat("Ghostwise", FEAT_BLOODED);
}

void LoadSubrace_Lightfoot()
{
    SF_CreateNewSubrace("Lightfoot");
    SF_SetSubraceRaceRestriction("Lightfoot", ALLOW_USE_TRUE, RACE_RESTRICT_HALFLING);
    SF_AdjustSubraceStats("Lightfoot", -2, 2, 0, 2, -1, -1);
    SF_SetSubraceAlignmentRestriction("Lightfoot", ALLOW_USE_FALSE, ALIGN_RESTRICT_LAWFUL);
}

void LoadSubrace_DeepHalfling()
{
    SF_CreateNewSubrace("Halfling-Deep", 3, 3);
    SF_SetSubraceRaceRestriction("Halfling-Deep", ALLOW_USE_TRUE, RACE_RESTRICT_HALFLING);
    SF_AdjustSubraceStats("Halfling-Deep", -1, 1, 0, 0, 0, 0);
    SF_SetSubraceFeat("Halfling-Deep", FEAT_KEEN_SENSE);
    SF_SetSubraceFeat("Halfling-Deep", FEAT_DARKVISION);
}

void LoadSubrace_Strongheart()
{
    SF_CreateNewSubrace("Strongheart");
    SF_SetSubraceRaceRestriction("Strongheart", ALLOW_USE_TRUE, RACE_RESTRICT_HALFLING);
    SF_AdjustSubraceStats("Strongheart", 0, 1, 0, -1, 1, -1);
}

void LoadSubrace_Tallfellow()
{
    SF_CreateNewSubrace("Tallfellow");
    SF_SetSubraceRaceRestriction("Tallfellow", ALLOW_USE_TRUE, RACE_RESTRICT_HALFLING);
    SF_AdjustSubraceStats("Tallfellow", -2, 2, 0, 0, 0, 0);
    SF_SetSubraceFeat("Tallfellow", FEAT_KEEN_SENSE);
}

void LoadSubrace_GrayOrc()
{
    SF_CreateNewSubrace("Orc-Gray");
    SF_SetSubraceRaceRestriction("Orc-Gray", ALLOW_USE_TRUE, RACE_RESTRICT_HALFORC);
    SF_SetSubraceAppearanceColor("Orc-Gray", 60, 57);
    SF_SetSubraceAlignmentRestriction("Orc-Gray", ALLOW_USE_TRUE, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    SF_SetSubraceClassRestriction("Orc-Gray", ALLOW_USE_TRUE, CLASS_RESTRICT_BARBARIAN | CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_FIGHTER, 1);
    SF_AdjustSubraceStats("Orc-Gray", 1, 0, 0, -1, 2, -2);
}

void LoadSubrace_MountainOrc()
{
    SF_CreateNewSubrace("Orc-Mountain");
    SF_SetSubraceRaceRestriction("Orc-Mountain", ALLOW_USE_TRUE, RACE_RESTRICT_HALFORC);
    SF_SetSubraceAppearanceColor("Orc-Mountain", 32, 63);
    SF_SetSubraceAlignmentRestriction("Orc-Mountain", ALLOW_USE_TRUE, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    SF_AdjustSubraceStats("Orc-Mountain", 2, 0, 0, -1, 0, -1);
}

void LoadSubrace_Orog()
{
    SF_CreateNewSubrace("Orog");
    SF_SetSubraceRaceRestriction("Orog", ALLOW_USE_TRUE, RACE_RESTRICT_HALFORC);
    SF_SetSubraceAppearanceColor("Orog", 54, 60);
    SF_SetSubraceAlignmentRestriction("Orog", ALLOW_USE_TRUE, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    SF_AdjustSubraceStats("Orog", 2, -2, 0, 0, -2, 2);
    SF_SetSubraceFeat("Orog", FEAT_RESIST_ENERGY_FIRE);
    SF_SetSubraceFeat("Orog", FEAT_RESIST_ENERGY_COLD);
}


void main()
{
    LoadSubrace_Ghostwise();
    LoadSubrace_Tallfellow();
    LoadSubrace_Lightfoot();
    LoadSubrace_DeepHalfling();
    LoadSubrace_Strongheart();
    LoadSubrace_GrayOrc();
    LoadSubrace_MountainOrc();
    LoadSubrace_Orog();
}

