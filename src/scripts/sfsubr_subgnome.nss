#include "sfsubr_functs"

void LoadSubrace_Svirfneblin()
{
    SF_CreateNewSubrace("Svirfneblin", APPEARANCE_TYPE_SVIRF_MALE, APPEARANCE_TYPE_SVIRF_FEMALE, "pcsvirfneblins", "", "", FALSE, 3);
    SF_SetSubraceRaceRestriction("Svirfneblin", ALLOW_USE_TRUE, RACE_RESTRICT_GNOME);
    SF_AdjustSubraceStats("Svirfneblin", 0, 0, 0, 1, 1, -2);
    SF_SetSubraceFeat("Svirfneblin", FEAT_DARKVISION);
    SF_SetSubraceFeat("Svirfneblin", FEAT_EPIC_SPELL_FOCUS_ILLUSION);
    SF_SetSubraceClassRestriction("Svirfneblin", ALLOW_USE_TRUE, CLASS_RESTRICT_WIZARD |  CLASS_RESTRICT_CLERIC, 1);
}
void LoadSubrace_ForestGnome()
{
    SF_CreateNewSubrace("Gnome-Forest");
    SF_SetSubraceRaceRestriction("Gnome-Forest", ALLOW_USE_TRUE, RACE_RESTRICT_GNOME);
    SF_AdjustSubraceStats("Gnome-Forest", -1, 0, 0, 2, 1, -2);
    SF_SetSubraceFeat("Gnome-Forest", FEAT_SKILL_FOCUS_HIDE);
    SF_SetSubraceFeat("Gnome-Forest", FEAT_EPIC_SKILL_FOCUS_HIDE);
    SF_SetSubraceAppearanceColor("Gnome-Forest", 36, 19);
    SF_SetSubraceAlignmentRestriction("Gnome-Forest", ALLOW_USE_TRUE, ALIGN_RESTRICT_GOOD);
}

void LoadSubrace_RockGnome()
{
    SF_CreateNewSubrace("Gnome-Rock");
    SF_SetSubraceRaceRestriction("Gnome-Rock", ALLOW_USE_TRUE, RACE_RESTRICT_GNOME);
    SF_AdjustSubraceStats("Gnome-Rock", -2, -1, 0, 1, 1, 1);
    SF_SetSubraceAppearanceColor("Gnome-Rock", 0, 8);

}

void LoadSubrace_Troglodyte()
{
    SF_CreateNewSubrace("Troglodyte");
    SF_SetSubraceRaceRestriction("Troglodyte", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_SetSubraceAlignmentRestriction("Troglodyte", ALLOW_USE_TRUE, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    SF_SetSubraceFeat("Troglodyte", FEAT_SKILL_FOCUS_HIDE);
    SF_AdjustSubraceStats("Troglodyte", 0, 0, 1, -1, 1, -1);
    SF_SetSubraceClassRestriction("Troglodyte", ALLOW_USE_TRUE, CLASS_RESTRICT_CLERIC, 1);
    SF_SetSubracePortrait("Troglodyte", "Trog_","Trog_");
}

void LoadSubrace_Yuanti()
{
    SF_CreateNewSubrace("Yuan-ti", APPEARANCE_TYPE_YUAN_TI, APPEARANCE_TYPE_YUAN_TI_CHIEFTEN );
    SF_SetSubraceRaceRestriction("Yuan-ti", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Yuan-ti", 0, 0, 0, 1, 1, -2);
    SF_SetSubraceFeat("Yuan-ti", FEAT_SKILL_FOCUS_HIDE);
    SF_SetSubraceClassRestriction("Yuan-ti", ALLOW_USE_TRUE, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_RANGER, 1);
    SF_SetSubraceAlignmentRestriction("Yuan-ti", ALLOW_USE_TRUE, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    SF_SetSubracePortrait("Yuan-ti", "po_yuan_ti_","po_Yuanchief_");
}
void LoadSubrace_Gnoll()
{
    SF_CreateNewSubrace("Gnoll", APPEARANCE_TYPE_GNOLL_WARRIOR, APPEARANCE_TYPE_GNOLL_WIZ );
    SF_SetSubraceRaceRestriction("Gnoll", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Gnoll", 2, 0, 1, -1, 0, -2);
    SF_SetSubraceAlignmentRestriction("Gnoll", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_SetSubracePortrait("Gnoll", "po_Ginger_", "po_fginger_");
}

void LoadSubrace_Minotaur()
{
    SF_CreateNewSubrace("Minotaur", APPEARANCE_TYPE_MINOTAUR_CHIEFTAIN, APPEARANCE_TYPE_MINOTAUR_SHAMAN);
    SF_SetSubraceRaceRestriction("Minotaur", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Minotaur", 2, 2, 0, -2, 0, -2);
    SF_SetSubraceAlignmentRestriction("Minotaur", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    SF_SetSubracePortrait("Minotaur", "po_Minotaur_","po_MinoWiz_");
    SF_SetSubraceFeat("Minotaur", FEAT_KEEN_SENSE);
}

void LoadSubrace_Orc()
{
    SF_CreateNewSubrace("Orc", APPEARANCE_TYPE_ORC_A, APPEARANCE_TYPE_ORC_B);
    SF_SetSubraceRaceRestriction("Orc", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Orc", 2, 2, 2, -2, -2, -2);
    SF_SetSubraceAlignmentRestriction("Orc", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    SF_SetSubraceFeat("Orc", FEAT_ALERTNESS);
    SF_SetSubraceClassRestriction("Orc", ALLOW_USE_TRUE, CLASS_RESTRICT_BARBARIAN, 1);
    SF_SetSubracePortrait("Orc", "po_OrcA_","po_OrcB_");
}

void LoadSubrace_Medusa()
{
    SF_CreateNewSubrace("Medusa", APPEARANCE_TYPE_MEDUSA, APPEARANCE_TYPE_MEDUSA);
    SF_SetSubraceRaceRestriction("Medusa", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_SetSubraceAlignmentRestriction("Medusa", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_AdjustSubraceStats("Medusa", 0, 2, 0, -1, -1, 2);
    SF_SetSubraceFeat("Medusa", FEAT_POINT_BLANK_SHOT);
    SF_SetSubracePortrait("Medusa", "po_medusa_","po_medusa_");
}

void LoadSubrace_Seahag()
{
    SF_CreateNewSubrace("Sea-Hag", APPEARANCE_TYPE_SEA_HAG, APPEARANCE_TYPE_SEA_HAG, "sfsub_elfaquatic");
    SF_SetSubraceRaceRestriction("Sea-Hag", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Sea-Hag", 2, 0, -2, 0, 0, 0);
    SF_SetSubraceFeat("Sea-Hag", FEAT_ALERTNESS);
    SF_SetSubraceAlignmentRestriction("Sea-Hag", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    SF_SetSubracePortrait("Sea-Hag", "Seahag_","Seahag_");
}

void LoadSubrace_Stinger()
{
    SF_CreateNewSubrace("Stinger", APPEARANCE_TYPE_STINGER, APPEARANCE_TYPE_STINGER_MAGE);
    SF_AdjustSubraceStats("Stinger", 2, 1, 1, -1, -1, -2);
    SF_SetSubraceAlignmentRestriction("Stinger", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_NEUTRAL1);
    SF_SetSubraceRaceRestriction("Stinger", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_SetSubracePortrait("Stinger", "stinger_","stingmage_");
}

void main()
{
    LoadSubrace_Svirfneblin();
    LoadSubrace_ForestGnome();
    LoadSubrace_RockGnome();
    LoadSubrace_Troglodyte();
    LoadSubrace_Yuanti();
    LoadSubrace_Gnoll();
    LoadSubrace_Minotaur();
    LoadSubrace_Orc();
    LoadSubrace_Medusa();
    LoadSubrace_Stinger();
    LoadSubrace_Seahag();
}
