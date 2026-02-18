#include "sfsubr_functs"

void LoadSubrace_RakshasaTiger()
{
    SF_CreateNewSubrace("Rakshasa-Tiger", APPEARANCE_TYPE_RAKSHASA_TIGER_MALE, APPEARANCE_TYPE_RAKSHASA_TIGER_FEMALE, "pcrakshasaskin", "", "", FALSE, 25);
    SF_SetSubraceRaceRestriction("Rakshasa-Tiger", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Rakshasa-Tiger", -1, -1, -1, 2, -1, 2);
    SF_SetSubraceAlignmentRestriction("Rakshasa-Tiger", ALLOW_USE_TRUE,  ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_SetSubracePortrait("Rakshasa-Tiger", "po_rakshasa_", "po_rakshasa_f_");
    SF_SetSubraceFeat("Rakshasa-Tiger", FEAT_ALERTNESS);
    SF_SetSubraceClassRestriction("Rakshasa-Tiger", ALLOW_USE_TRUE, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_SORCERER | CLASS_RESTRICT_WIZARD, 1);
}
void LoadSubrace_RakshasaBear()
{
    SF_CreateNewSubrace("Rakshasa-Bear", APPEARANCE_TYPE_RAKSHASA_BEAR_MALE, APPEARANCE_TYPE_RAKSHASA_BEAR_MALE, "pcrakshasaskin", "", "", FALSE, 25);
    SF_SetSubraceRaceRestriction("Rakshasa-Bear", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Rakshasa-Bear", 1, -1, -2, 2, -2, 2);
    SF_SetSubraceAlignmentRestriction("Rakshasa-Bear", ALLOW_USE_TRUE,  ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_SetSubracePortrait("Rakshasa-Bear", "po_rakshasa_", "po_rakshasa_f_");
    SF_SetSubraceFeat("Rakshasa-Bear", FEAT_ALERTNESS);
    SF_SetSubraceClassRestriction("Rakshasa-Bear", ALLOW_USE_TRUE, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_SORCERER | CLASS_RESTRICT_WIZARD, 1);
}
void LoadSubrace_RakshasaWolf()
{
    SF_CreateNewSubrace("Rakshasa-Wolf", APPEARANCE_TYPE_RAKSHASA_WOLF_MALE, APPEARANCE_TYPE_RAKSHASA_WOLF_MALE, "pcrakshasaskin", "", "", FALSE, 25);
    SF_SetSubraceRaceRestriction("Rakshasa-Wolf", ALLOW_USE_TRUE, RACE_RESTRICT_HUMAN);
    SF_AdjustSubraceStats("Rakshasa-Wolf", -1, 1, -2, 2, -2, 2);
    SF_SetSubraceAlignmentRestriction("Rakshasa-Wolf", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_SetSubracePortrait("Rakshasa-Wolf", "po_rakshasa_", "po_rakshasa_f_");
    SF_SetSubraceFeat("Rakshasa-Wolf", FEAT_ALERTNESS);
    SF_SetSubraceClassRestriction("Rakshasa-Wolf", ALLOW_USE_TRUE, CLASS_RESTRICT_CLERIC | CLASS_RESTRICT_SORCERER | CLASS_RESTRICT_WIZARD, 1);
}

void LoadSubrace_Ettin()
{
    SF_CreateNewSubrace("Ettin", APPEARANCE_TYPE_ETTIN, APPEARANCE_TYPE_ETTIN);
    SF_SetSubraceRaceRestriction("Ettin", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF | RACE_RESTRICT_HALFORC | RACE_RESTRICT_HUMAN);
    SF_SetSubraceAlignmentRestriction("Ettin", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    SF_AdjustSubraceStats("Ettin", 2, 0, 1, -2, 0, 0);
    SF_SetSubraceFeat("Ettin", FEAT_ALERTNESS);
    SF_SetSubraceFeat("Ettin", FEAT_IMPROVED_INITIATIVE);
    SF_SetSubracePortrait("Ettin", "po_ettin_", "po_ettin_");
}

void LoadSubrace_HillGiant()
{
    SF_CreateNewSubrace("Hill-Giant", APPEARANCE_TYPE_GIANT_HILL, APPEARANCE_TYPE_GIANT_HILL);
    SF_SetSubraceRaceRestriction("Hill-Giant", ALLOW_USE_TRUE, RACE_RESTRICT_HALFORC);
    SF_SetSubraceAlignmentRestriction("Hill-Giant", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    SF_AdjustSubraceStats("Hill-Giant", 2, -1, 1, -2, -2, 2);
    SF_SetSubracePortrait("Hill-Giant", "po_gnthill_", "po_gnthill_");
}

void LoadSubrace_StoneGiant()
{
    SF_CreateNewSubrace("Stone-Giant", APPEARANCE_TYPE_GIANT_MOUNTAIN, APPEARANCE_TYPE_GIANT_MOUNTAIN);
    SF_SetSubraceRaceRestriction("Stone-Giant", ALLOW_USE_TRUE, RACE_RESTRICT_HALFORC);
    SF_AdjustSubraceStats("Stone-Giant", 2, 1, 1, -2, -2, 0);
    SF_SetSubracePortrait("Stone-Giant", "po_gntmount_", "po_gntmount_");
    SF_SetSubraceFeat("Stone-Giant", FEAT_LIGHTNING_REFLEXES);
    SF_SetSubraceFeat("Stone-Giant", FEAT_POINT_BLANK_SHOT);
}

void LoadSubrace_FrostGiant()
{
    SF_CreateNewSubrace("Frost-Giant", APPEARANCE_TYPE_GIANT_FROST, APPEARANCE_TYPE_GIANT_FROST_FEMALE);
    SF_SetSubraceAlignmentRestriction("Frost-Giant", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    SF_SetSubraceRaceRestriction("Frost-Giant", ALLOW_USE_TRUE, RACE_RESTRICT_HALFORC);
    SF_AdjustSubraceStats("Frost-Giant", 2, -2, 2, -1, 0, -1);
    SF_SetSubracePortrait("Frost-Giant", "po_gntfrost_", "po_GntFrstFem_");
}

void LoadSubrace_FireGiant()
{
    SF_CreateNewSubrace("Fire-Giant", APPEARANCE_TYPE_GIANT_FIRE, APPEARANCE_TYPE_GIANT_FIRE_FEMALE);
    SF_SetSubraceRaceRestriction("Fire-Giant", ALLOW_USE_TRUE, RACE_RESTRICT_HALFORC);
    SF_SetSubraceAlignmentRestriction("Fire-Giant", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_LAWFUL);
    SF_AdjustSubraceStats("Fire-Giant", 2, -2, 2, -1, 0, -1);
    SF_SetSubracePortrait("Fire-Giant", "po_gntfire_", "po_GntFireFem_");
}

void LoadSubrace_Ogre()
{
    SF_CreateNewSubrace("Ogre", APPEARANCE_TYPE_OGRE, APPEARANCE_TYPE_OGREB);
    SF_SetSubraceAlignmentRestriction("Ogre", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    SF_SetSubraceRaceRestriction("Ogre", ALLOW_USE_TRUE, RACE_RESTRICT_HALFORC);
    SF_AdjustSubraceStats("Ogre", 2, -1, 2, -1, -1, -1);
    SF_SetSubracePortrait("Ogre", "po_OgreA_", "po_OgreB_");
}

void LoadSubrace_Troll()
{
    SF_CreateNewSubrace("Troll", APPEARANCE_TYPE_TROLL_CHIEFTAIN, APPEARANCE_TYPE_TROLL_SHAMAN, "pcsubracetroll", "", "", FALSE, 19);
    SF_SetSubraceRaceRestriction("Troll", ALLOW_USE_TRUE, RACE_RESTRICT_DWARF | RACE_RESTRICT_HALFORC | RACE_RESTRICT_HUMAN);
    SF_SetSubraceAlignmentRestriction("Troll", ALLOW_USE_TRUE, ALIGN_RESTRICT_EVIL | ALIGN_RESTRICT_CHAOTIC);
    SF_AdjustSubraceStats("Troll", 2, 1, 2, -2, -1, -2);
    SF_SetSubraceFeat("Troll", FEAT_ALERTNESS);
    SF_SetSubraceFeat("Troll", FEAT_IRON_WILL);
    SF_SetSubracePortrait("Troll", "po_TrollChief_", "po_Troll_");
}

void main()
{
    LoadSubrace_RakshasaTiger();
    LoadSubrace_RakshasaBear();
    LoadSubrace_RakshasaWolf();
    LoadSubrace_Ettin();
    LoadSubrace_HillGiant();
    LoadSubrace_StoneGiant();
    LoadSubrace_FireGiant();
    LoadSubrace_FrostGiant();
    LoadSubrace_Ogre();
    LoadSubrace_Troll();
}
