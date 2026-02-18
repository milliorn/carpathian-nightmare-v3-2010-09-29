#include "sfsubr_functs"

void LoadSubrace_AquaticElf()
{
    SF_CreateNewSubrace("Elf-Aquatic", APPEARANCE_TYPE_INVALID, APPEARANCE_TYPE_INVALID,"sfsub_elfaquatic");
    SF_SetSubraceAlignmentRestriction("Elf-Aquatic", ALLOW_USE_FALSE, ALIGN_RESTRICT_EVIL);
    SF_SetSubraceRaceRestriction("Elf-Aquatic", ALLOW_USE_TRUE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF);
    SF_SetSubraceClassRestriction("Elf-Aquatic", ALLOW_USE_TRUE, CLASS_RESTRICT_BARD | CLASS_RESTRICT_FIGHTER | CLASS_RESTRICT_RANGER | CLASS_RESTRICT_SORCERER, 1);
    SF_AdjustSubraceStats("Elf-Aquatic", 0, 2, 0, -2, 0, 0);
    SF_SetSubraceAppearanceColor("Elf-Aquatic", 36, 40);
    SF_SetSubraceFeat("Elf-Aquatic", FEAT_BLOODED);
}

void LoadSubrace_Avariel()
{
    SF_CreateNewSubrace("Avariel");
    SF_SetSubraceRaceRestriction("Avariel", ALLOW_USE_TRUE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF);
    SF_AdjustSubraceStats("Avariel", -2, 2, -2, 1, 1, 0);
    SF_SetSubraceAlignmentRestriction("Avariel", ALLOW_USE_FALSE, ALIGN_RESTRICT_EVIL);
    SF_SetSubraceClassRestriction("Avariel", ALLOW_USE_FALSE, CLASS_RESTRICT_BARBARIAN, 1);
    SF_SetSubraceFeat("Avariel", FEAT_ARTIST);
    SF_SetSubraceFeat("Avariel", FEAT_STRONGSOUL);
    SF_SetSubraceAppearanceColor("Avariel", 62, 57);
    SF_SetSubraceBodyAttatchments("Avariel", 6, 0);
}

void LoadSubrace_Drow()
{
    SF_CreateNewSubrace("Drow", APPEARANCE_TYPE_DROW_WARRIOR_2, APPEARANCE_TYPE_DROW_MATRON, "pcdrowskin", "", "", FALSE, 3);
    SF_SetSubraceAlignmentRestriction("Drow", ALLOW_USE_FALSE, ALIGN_RESTRICT_NEUTRAL1 | ALIGN_RESTRICT_NEUTRAL2);
    SF_SetSubraceRaceRestriction("Drow", ALLOW_USE_TRUE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF);
    SF_AdjustSubraceStats("Drow", -2, 2, 0, 0, 0, 0);
    SF_SetSubraceFeat("Drow", FEAT_BLOODED);
    SF_SetSubraceFeat("Drow", FEAT_STEALTHY);
    SF_SetSubraceFeat("Drow", FEAT_IRON_WILL);
    SF_SetSubracePortrait("Drow", "po_drowwar_", "po_matmother_");
}

void LoadSubrace_MoonElf()
{
    SF_CreateNewSubrace("Elf-Moon");
    SF_SetSubraceAlignmentRestriction("Elf-Moon", ALLOW_USE_TRUE, ALIGN_RESTRICT_GOOD);
    SF_SetSubraceAppearanceColor("Elf-Moon", 56, 57);
    SF_SetSubraceRaceRestriction("Elf-Moon", ALLOW_USE_TRUE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF);
    SF_AdjustSubraceStats("Elf-Moon", -1, 1, 0, 0, -1, 1);
}

void LoadSubrace_SunElf()
{
    SF_CreateNewSubrace("Elf-Sun");
    SF_SetSubraceAlignmentRestriction("Elf-Sun", ALLOW_USE_TRUE, ALIGN_RESTRICT_GOOD);
    SF_SetSubraceRaceRestriction("Elf-Sun", ALLOW_USE_TRUE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF);
    SF_AdjustSubraceStats("Elf-Sun", -2, 1, 1, 1, -1, 0);
    SF_SetSubraceAppearanceColor("Elf-Sun", 54, 58);
}

void LoadSubrace_WildElf()
{
    SF_CreateNewSubrace("Elf-Wild");
    SF_SetSubraceRaceRestriction("Elf-Wild", ALLOW_USE_TRUE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF);
    SF_SetSubraceAlignmentRestriction("Elf-Wild", ALLOW_USE_FALSE, ALIGN_RESTRICT_NEUTRAL1 | ALIGN_RESTRICT_NEUTRAL2);
    SF_AdjustSubraceStats("Elf-Wild", 2, 0, 0, -2, -2, 2);
    SF_SetSubraceAppearanceColor("Elf-Wild", 11, 59);
}

void LoadSubrace_WoodElf()
{
    SF_CreateNewSubrace("Elf-Wood");
    SF_SetSubraceRaceRestriction("Elf-Wood", ALLOW_USE_TRUE, RACE_RESTRICT_ELF);
    SF_AdjustSubraceStats("Elf-Wood", 0, 1, -2, 0, 1, 0);
    SF_SetSubraceAppearanceColor("Elf-Wood", 54, 2);
    SF_SetSubraceAlignmentRestriction("Elf-Wood", ALLOW_USE_TRUE, ALIGN_RESTRICT_LAWFUL);
    SF_SetSubraceClassRestriction("Elf-Wood", ALLOW_USE_TRUE, CLASS_RESTRICT_BARD | CLASS_RESTRICT_SORCERER, 1);
}

void LoadSubrace_Drider()
{
    SF_CreateNewSubrace("Drider", APPEARANCE_TYPE_DRIDER_CHIEF, APPEARANCE_TYPE_DRIDER_FEMALE, "pcdriderskin", "", "", FALSE, 5);
    SF_SetSubraceRaceRestriction("Drider", ALLOW_USE_TRUE, RACE_RESTRICT_ELF | RACE_RESTRICT_HALFELF);
    SF_AdjustSubraceStats("Drider", -2, 2, 0, -2, 2, 0);
    SF_SetSubraceAlignmentRestriction("Drider", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    SF_SetSubracePortrait("Drider", "po_dr_m_07_", "po_dr_f_05_");
}

void main()
{
    LoadSubrace_AquaticElf();
    LoadSubrace_Avariel();
    LoadSubrace_Drow();
    LoadSubrace_MoonElf();
    LoadSubrace_SunElf();
    LoadSubrace_WildElf();
    LoadSubrace_WoodElf();
    LoadSubrace_Drider();
}
