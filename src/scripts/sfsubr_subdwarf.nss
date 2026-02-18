#include "sfsubr_functs"

void LoadSubrace_ArticDwarf()
{
    SF_CreateNewSubrace("Dwarf-Artic");
    SF_SetSubraceAlignmentRestriction("Dwarf-Artic", ALLOW_USE_TRUE, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_GOOD);
    SF_AdjustSubraceStats("Dwarf-Artic", 2, -1, 1, 0, 0, -2);
    SF_SetSubraceRaceRestriction("Dwarf-Artic", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF);
    SF_SetSubraceAppearanceColor("Dwarf-Artic", 16, 16);
    SF_SetSubraceClassRestriction("Dwarf-Artic", ALLOW_USE_TRUE, CLASS_RESTRICT_BARBARIAN | CLASS_RESTRICT_FIGHTER | CLASS_RESTRICT_RANGER, 1);
    SF_SetSubraceFeat("Dwarf-Artic", FEAT_RESIST_ENERGY_COLD);
}

void LoadSubrace_Azer()
{
    SF_CreateNewSubrace("Azer", APPEARANCE_TYPE_AZER_MALE, APPEARANCE_TYPE_AZER_FEMALE,"pcazerskin", "", "", FALSE, 5);
    SF_SetSubraceRaceRestriction("Azer", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF);
    SF_AdjustSubraceStats("Azer", 1, 1, 1, -1, -1, -1);
    SF_SetSubracePortrait("Azer", "po_azerman_", "po_azergirl_");
    SF_SetSubraceAlignmentRestriction("Azer", ALLOW_USE_TRUE, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_GOOD);
}

void LoadSubrace_DeepDwarf()
{
    SF_CreateNewSubrace("Dwarf-Deep",0 ,0);
    SF_SetSubraceRaceRestriction("Dwarf-Deep", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF);
    SF_SetSubraceAlignmentRestriction("Dwarf-Deep", ALLOW_USE_TRUE, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_GOOD);
    SF_AdjustSubraceStats("Dwarf-Deep", 0, -1, 2, 0, -1, 0);
    SF_SetSubraceAppearanceColor("Dwarf-Deep", 43, 31);
}
void LoadSubrace_DerroDwarf()
{
    SF_CreateNewSubrace("Dwarf-Derro", APPEARANCE_TYPE_INVALID, APPEARANCE_TYPE_INVALID, "pcderroskin", "", "", FALSE, 13);
    SF_SetSubraceRaceRestriction("Dwarf-Derro", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF);
    SF_SetSubraceAlignmentRestriction("Dwarf-Derro", ALLOW_USE_TRUE, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    SF_AdjustSubraceStats("Dwarf-Derro", -2, 2, 1, 0, 0, -1);
    SF_SetSubraceFeat("Dwarf-Derro", FEAT_BLIND_FIGHT);
}

void LoadSubrace_DuergarDwarf()
{
    SF_CreateNewSubrace("Dwarf-Duergar", APPEARANCE_TYPE_DUERGAR_CHIEF, APPEARANCE_TYPE_DUERGAR_SLAVE);
    SF_SetSubraceRaceRestriction("Dwarf-Duergar", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF);
    SF_SetSubraceAlignmentRestriction("Dwarf-Derro", ALLOW_USE_TRUE, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    SF_AdjustSubraceStats("Dwarf-Duergar", -2, -2, 1, 1, 2, 0);
    SF_SetSubraceFeat("Dwarf-Duergar", FEAT_DRAGON_IMMUNE_PARALYSIS);
}

void LoadSubrace_DwarfGold()
{
    SF_CreateNewSubrace("Dwarf-Gold");
    SF_SetSubraceAlignmentRestriction("Dwarf-Gold", ALLOW_USE_TRUE, ALIGN_RESTRICT_GOOD);
    SF_SetSubraceRaceRestriction("Dwarf-Gold", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF);
    SF_AdjustSubraceStats("Dwarf-Gold", 0, -2, 2, 2, -2, 0);
    SF_SetSubraceAppearanceColor("Dwarf-Gold", 44, 15);
}

void LoadSubrace_DwarfShield()
{
    SF_CreateNewSubrace("Dwarf-Shield");
    SF_SetSubraceAlignmentRestriction("Dwarf-Shield", ALLOW_USE_TRUE, ALIGN_RESTRICT_GOOD);
    SF_SetSubraceRaceRestriction("Dwarf-Shield", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF);
    SF_AdjustSubraceStats("Dwarf-Shield", 0, 0, -2, -2, 2, 2);
    SF_SetSubraceAppearanceColor("Dwarf-Shield", 8, 58);
}

void LoadSubrace_DwarfUrdunnir()
{
    SF_CreateNewSubrace("Dwarf-Urdunnir");
    SF_SetSubraceAlignmentRestriction("Dwarf-Urdunnir", ALLOW_USE_TRUE, ALIGN_RESTRICT_GOOD);
    SF_SetSubraceRaceRestriction("Dwarf-Urdunnir", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF);
    SF_AdjustSubraceStats("Dwarf-Urdunnir", 0, 0, 0, -2, 1, 1);
    SF_SetSubraceAppearanceColor("Dwarf-Urdunnir", 21, 19);
}

void LoadSubrace_DwarfWild()
{
    SF_CreateNewSubrace("Dwarf-Wild");
    SF_SetSubraceAlignmentRestriction("Dwarf-Wild", ALLOW_USE_TRUE, ALIGN_RESTRICT_GOOD);
    SF_SetSubraceRaceRestriction("Dwarf-Wild", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF);
    SF_AdjustSubraceStats("Dwarf-Wild", 1, 0, 0, -1, 1, -1);
    SF_SetSubraceAppearanceColor("Dwarf-Wild", 32, 40);
    SF_SetSubraceFeat("Dwarf-Wild", FEAT_RESIST_ENERGY_FIRE);
    SF_SetSubraceClassRestriction("Dwarf-Wild", ALLOW_USE_TRUE, CLASS_RESTRICT_BARBARIAN | CLASS_RESTRICT_FIGHTER | CLASS_RESTRICT_DRUID | CLASS_RESTRICT_RANGER, 1);
}

void main()
{
    LoadSubrace_Azer();
    LoadSubrace_ArticDwarf();
    LoadSubrace_DeepDwarf();
    LoadSubrace_DerroDwarf();
    LoadSubrace_DuergarDwarf();
    LoadSubrace_DwarfGold();
    LoadSubrace_DwarfShield();
    LoadSubrace_DwarfUrdunnir();
    LoadSubrace_DwarfWild();
}
