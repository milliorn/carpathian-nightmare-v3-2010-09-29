#include "sfsubr_functs"

void LoadSubrace_Aasimar()
{
    SF_CreateNewSubrace("Aasimar", APPEARANCE_TYPE_INVALID, APPEARANCE_TYPE_INVALID, "sfsub_aasimar_hide");
    SF_SetSubraceRaceRestriction("Aasimar", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Aasimar", 0, 0, 0, -2, 1, 1);
    SF_SetSubraceAlignmentRestriction("Aasimar", ALLOW_USE_FALSE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_NEUTRAL1 | ALIGN_RESTRICT_NEUTRAL2);
    SF_SetSubraceBodyAttatchments("Aasimar", WINGS_TYPE_ANGEL, TAIL_TYPE_NONE);
    SF_SetSubraceClassRestriction("Aasimar", ALLOW_USE_TRUE, CLASS_RESTRICT_BARD | CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_PALADIN | CLASS_RESTRICT_SORCERER, 1);
}

void LoadSubrace_Tiefling()
{
    SF_CreateNewSubrace("Tiefling", APPEARANCE_TYPE_INVALID, APPEARANCE_TYPE_INVALID, "sfsub_tiefling_hide");
    SF_SetSubraceRaceRestriction("Tiefling", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF);
    SF_AdjustSubraceStats("Tiefling", 0, 2, 0, 2, -2, -2);
    SF_SetSubraceAlignmentRestriction("Tiefling", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL);
    SF_SetSubraceBodyAttatchments("Tiefling", WINGS_TYPE_DEMON, TAIL_TYPE_DEVIL);
    SF_SetSubraceHeadType("Tiefling", 20, 14);
    SF_SetSubraceClassRestriction("Tiefling", ALLOW_USE_TRUE, CLASS_RESTRICT_ROGUE | CLASS_RESTRICT_WIZARD, 1);
}

void LoadSubrace_Feyri()
{
    SF_CreateNewSubrace("Fey-ri");
    SF_SetSubraceRaceRestriction("Fey-ri", ALLOW_USE_TRUE, RACE_RESTRICT_ELF);
    SF_AdjustSubraceStats("Fey-ri", 0, 2, -2, 2, -2, 0);
    SF_SetSubraceAppearanceColor("Fey-ri", 44, 7);
    SF_SetSubraceAlignmentRestriction("Fey-ri", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL);
    SF_SetSubraceClassRestriction("Fey-ri", ALLOW_USE_TRUE, CLASS_RESTRICT_ROGUE | CLASS_RESTRICT_SORCERER, 1);
    SF_SetSubraceBodyAttatchments("Fey-ri", WINGS_TYPE_DEMON, TAIL_TYPE_BONE);
}

void LoadSubrace_AirGenasi()
{
    SF_CreateNewSubrace("Air-Genasi");
    SF_SetSubraceRaceRestriction("Air-Genasi", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Air-Genasi", 0, 1, 0, 1, 0, -2);
    SF_SetSubraceAppearanceColor("Air-Genasi", 20, 62);
    SF_SetSubraceFeat("Air-Genasi", FEAT_RESIST_ENERGY_ELECTRICAL);
}

void LoadSubrace_EarthGenasi()
{
    SF_CreateNewSubrace("Earth-Genasi");
    SF_SetSubraceRaceRestriction("Earth-Genasi", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Earth-Genasi", 1, 1, 0, -1, 0, -1);
    SF_SetSubraceAppearanceColor("Earth-Genasi", 60, 0);
    SF_SetSubraceFeat("Earth-Genasi", FEAT_RESIST_ENERGY_SONIC);
}

void LoadSubrace_FireGenasi()
{
    SF_CreateNewSubrace("Fire-Genasi");
    SF_SetSubraceRaceRestriction("Fire-Genasi", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Fire-Genasi", 1, 1, 0, 0, -1, -1);
    SF_SetSubraceAppearanceColor("Fire-Genasi", 58, 4);
    SF_SetSubraceFeat("Fire-Genasi", FEAT_RESIST_ENERGY_FIRE);
}

void LoadSubrace_WaterGenasi()
{
    SF_CreateNewSubrace("Water-Genasi");
    SF_SetSubraceRaceRestriction("Water-Genasi", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN | RACE_RESTRICT_HALFELF);
    SF_AdjustSubraceStats("Water-Genasi", 0, 0, 1, 1, -1, -1);
    SF_SetSubraceAppearanceColor("Water-Genasi", 50, 40);
    SF_SetSubraceFeat("Water-Genasi", FEAT_RESIST_ENERGY_COLD);
}

void LoadSubrace_Beholder()
{
    SF_CreateNewSubrace("Beholder", APPEARANCE_TYPE_BEHOLDER, APPEARANCE_TYPE_BEHOLDER_MOTHER);
    SF_SetSubraceRaceRestriction("Beholder", ALLOW_USE_FALSE, RACE_RESTRICT_HALFLING | RACE_RESTRICT_GNOME);
    SF_SetSubraceAlignmentRestriction("Beholder", ALLOW_USE_TRUE, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    SF_SetSubraceClassRestriction("Beholder", ALLOW_USE_TRUE, CLASS_RESTRICT_SORCERER | CLASS_RESTRICT_WIZARD, 1);
    SF_AdjustSubraceStats("Beholder", 0, 0, 0, 2, -1, -1);
    SF_SetSubraceFeat("Beholder", FEAT_ALERTNESS);
    SF_SetSubraceFeat("Beholder", FEAT_IMPROVED_INITIATIVE);
    SF_SetSubraceFeat("Beholder", FEAT_IRON_WILL);
    SF_SetSubracePortrait("Beholder", "po_behold_", "po_beholdm_");
}

void LoadSubrace_Ettercap()
{
    SF_CreateNewSubrace("Ettercap", APPEARANCE_TYPE_ETTERCAP, APPEARANCE_TYPE_ETTERCAP);
    SF_SetSubraceAlignmentRestriction("Ettercap", ALLOW_USE_TRUE, ALIGN_RESTRICT_NEUTRAL1 | ALIGN_RESTRICT_EVIL);
    SF_AdjustSubraceStats("Ettercap", 0, 2, 0, -2, 2, -2);
    SF_SetSubraceFeat("Ettercap", FEAT_LOWLIGHTVISION);
    SF_SetSubracePortrait("Ettercap", "po_Ettercap_", "po_Ettercap_");
}

void LoadSubrace_MindFlayer()
{
    SF_CreateNewSubrace("Mind-Flayer", APPEARANCE_TYPE_MINDFLAYER, APPEARANCE_TYPE_MINDFLAYER_2);
    SF_SetSubraceAlignmentRestriction("Mind-Flayer", ALLOW_USE_TRUE, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    SF_AdjustSubraceStats("Mind-Flayer", -1, -1, -2, 2, 1, 1);
    SF_SetSubraceFeat("Mind-Flayer", FEAT_IMPROVED_INITIATIVE);
    SF_SetSubracePortrait("Mind-Flayer", "po_mindflayer_", "po_mindflayer2_");
}

void LoadSubrace_UmberHulk()
{
    SF_CreateNewSubrace("Umber-Hulk", APPEARANCE_TYPE_UMBERHULK, APPEARANCE_TYPE_UMBERHULK);
    SF_SetSubraceAlignmentRestriction("Umber-Hulk", ALLOW_USE_TRUE, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    SF_SetSubraceRaceRestriction("Umber-Hulk", ALLOW_USE_FALSE, RACE_RESTRICT_HALFLING | RACE_RESTRICT_GNOME);
    SF_AdjustSubraceStats("Umber-Hulk", 2, -1, 2, 0, -1, -2);
    SF_SetSubracePortrait("Umber-Hulk", "po_Umberhulk_", "po_Umberhulk_");
}

void main()
{
    LoadSubrace_Aasimar();
    LoadSubrace_Tiefling();
    LoadSubrace_Feyri();
    LoadSubrace_AirGenasi();
    LoadSubrace_EarthGenasi();
    LoadSubrace_FireGenasi();
    LoadSubrace_WaterGenasi();
    LoadSubrace_Beholder();
    LoadSubrace_Ettercap();
    LoadSubrace_MindFlayer();
    LoadSubrace_UmberHulk();
}

