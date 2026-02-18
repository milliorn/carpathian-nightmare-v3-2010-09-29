#include "sfsubr_functs"

void LoadSubrace_Bugbear()
{
    SF_CreateNewSubrace("Bugbear", APPEARANCE_TYPE_BUGBEAR_CHIEFTAIN_A, APPEARANCE_TYPE_BUGBEAR_CHIEFTAIN_B);
    SF_SetSubraceRaceRestriction("Bugbear", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_SetSubraceAlignmentRestriction("Bugbear", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_SetSubracePortrait("Bugbear", "po_BugChiefA_","po_bugchiefb_");
    SF_AdjustSubraceStats("Bugbear", 2, 0, 0, 0, -1, -1);
    SF_SetSubraceFeat("Bugbear", FEAT_ALERTNESS);
}

void LoadSubrace_Dryad()
{
    SF_CreateNewSubrace("Dryad", APPEARANCE_TYPE_DRYAD, APPEARANCE_TYPE_DRYAD);
    SF_SetSubraceRaceRestriction("Dryad", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Dryad", -1, 2, 0, -2, -1, 2);
    SF_SetSubraceAlignmentRestriction("Dryad", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_SetSubracePortrait("Dryad", "po_dryad_", "po_dryad_");
    SF_SetSubraceClassRestriction("Dryad", ALLOW_USE_TRUE,CLASS_RESTRICT_SORCERER, 1);
    SF_SetSubraceFeat("Dryad", FEAT_ALERTNESS);
    SF_SetSubraceFeat("Dryad", FEAT_IMPROVED_INITIATIVE);
}

void LoadSubrace_Nymph()
{
    SF_CreateNewSubrace("Nymph", APPEARANCE_TYPE_NYMPH, APPEARANCE_TYPE_NYMPH);
    SF_SetSubracePortrait("Nymph", "po_nymph_","po_nymph_");
    SF_SetSubraceRaceRestriction("Nymph", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Nymph", -1, 0, -2, 0, 1, 2);
    SF_SetSubraceAlignmentRestriction("Nymph", ALLOW_USE_TRUE, ALIGN_RESTRICT_GOOD | ALIGN_RESTRICT_CHAOTIC);
    SF_SetSubraceFeat("Nymph", FEAT_ALERTNESS);
    SF_SetSubraceFeat("Nymph", FEAT_IRON_WILL);
}

void LoadSubrace_Pixie()
{
    SF_CreateNewSubrace("Pixie",APPEARANCE_TYPE_FAIRY,APPEARANCE_TYPE_FAIRY, "pcpixieskin", "", "", FALSE, 7);
    SF_SetSubraceRaceRestriction("Pixie", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Pixie", -2, 2, 0, 0, 0, 0);
    SF_SetSubraceFeat("Pixie", FEAT_POINT_BLANK_SHOT);
    SF_SetSubracePortrait("Pixie", "po_pixie_","po_pixie_");
}

void LoadSubrace_Goblin()
{
    SF_CreateNewSubrace("Goblin", APPEARANCE_TYPE_GOBLIN_B, APPEARANCE_TYPE_GOBLIN_SHAMAN_B);
    SF_SetSubraceRaceRestriction("Goblin", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Goblin", -1, 1, 0, 0, 0, 0);
    SF_SetSubraceAlignmentRestriction("Goblin", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_NEUTRAL1);
    SF_SetSubracePortrait("Goblin", "po_goblin_", "po_goblin_");
    SF_SetSubraceFeat("Goblin", FEAT_ALERTNESS);
    SF_SetSubraceFeat("Goblin", SKILL_MOVE_SILENTLY);
}

void LoadSubrace_Hobgoblin()
{
    SF_CreateNewSubrace("Hobgoblin", APPEARANCE_TYPE_HOBGOBLIN_WARRIOR, APPEARANCE_TYPE_HOBGOBLIN_WIZARD);
    SF_SetSubraceRaceRestriction("Hobgoblin", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Hobgoblin", 0, 2, 2, -2, 0, -2);
    SF_SetSubraceFeat("Hobgoblin", FEAT_ALERTNESS);
    SF_SetSubraceAlignmentRestriction("Hobgoblin", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_SetSubracePortrait("Hobgoblin", "po_Hob_", "po_Hobwiz_");
}


void LoadSubrace_Asabi()
{
    SF_CreateNewSubrace("Asabi", APPEARANCE_TYPE_ASABI_WARRIOR, APPEARANCE_TYPE_ASABI_SHAMAN);
    SF_SetSubraceRaceRestriction("Asabi", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_SetSubracePortrait("Asabi", "po_asabwar_","po_asabmage_");
    SF_AdjustSubraceStats("Asabi", 0, 1, 0, 0, 0, -1);
    SF_SetSubraceMovementSpeed("Asabi", CHARACTER_SPEED_FAST);
}

void LoadSubrace_Kobold()
{
    SF_CreateNewSubrace("Kobold", APPEARANCE_TYPE_KOBOLD_A, APPEARANCE_TYPE_KOBOLD_B, "sfsub_kobold_hide");
    SF_SetSubraceRaceRestriction("Kobold", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_SetSubraceAlignmentRestriction("Kobold", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_SetSubraceClassRestriction("Kobold", ALLOW_USE_TRUE, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_SORCERER, 1);
    SF_SetSubracePortrait("Kobold", "po_koba_","po_Kobb_");
    SF_AdjustSubraceStats("Kobold", 0, 0, 0, -2, 1, 1);
    SF_SetSubraceFeat("Kobold", FEAT_ALERTNESS);
    SF_SetSubraceFeat("Kobold", FEAT_DARKVISION);
}

void LoadSubrace_Lizardfiend()
{
    SF_CreateNewSubrace("Lizardfiend", APPEARANCE_TYPE_LIZARDFOLK_A, APPEARANCE_TYPE_LIZARDFOLK_B);
    SF_SetSubraceRaceRestriction("Lizardfiend", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_SetSubracePortrait("Lizardfiend", "po_OldChiefA_","po_OldChiefB_");
    SF_AdjustSubraceStats("Lizardfiend", 1, 0, 0, 0, 0, -1);
    SF_SetSubraceMovementSpeed("Lizardfiend", CHARACTER_SPEED_FAST);

}

void LoadSubrace_Sahuagin()
{
    SF_CreateNewSubrace("Sahuagin", APPEARANCE_TYPE_SAHUAGIN, APPEARANCE_TYPE_SAHUAGIN_CLERIC, "sfsub_elfaquatic");
    SF_SetSubraceRaceRestriction("Sahuagin", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_SetSubraceAlignmentRestriction("Sahuagin", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_SetSubraceClassRestriction("Sahuagin", ALLOW_USE_TRUE, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_RANGER, 1);
    SF_AdjustSubraceStats("Sahuagin", 2, 0, -2, 0, 2, -2);
    SF_SetSubracePortrait("Sahuagin", "sahuagin_","sahuagin_");
}


void main()
{
    LoadSubrace_Bugbear();
    LoadSubrace_Dryad();
    LoadSubrace_Nymph();
    LoadSubrace_Pixie();
    LoadSubrace_Goblin();
    LoadSubrace_Hobgoblin();
    LoadSubrace_Asabi();
    LoadSubrace_Kobold();
    LoadSubrace_Sahuagin();
    LoadSubrace_Lizardfiend();
}
