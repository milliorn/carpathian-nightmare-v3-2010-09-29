#include "sfsubr_functs"

void LoadSubrace_Aranea()
{
    SF_CreateNewSubrace("Aranea", APPEARANCE_TYPE_ARANEA, APPEARANCE_TYPE_ARANEA);
    SF_AdjustSubraceStats("Aranea", -1, -1, -1, 2, -1, 2);
    SF_SetSubracePortrait("Aranea", "po_Aranea_", "po_Aranea_");
    SF_SetSubraceFeat("Aranea", FEAT_IMPROVED_INITIATIVE);
    SF_SetSubraceFeat("Aranea", FEAT_ALERTNESS);
}

void LoadSubrace_Weretiger()
{
    SF_CreateNewSubrace("Weretiger", APPEARANCE_TYPE_WERECAT, APPEARANCE_TYPE_WERECAT);
    SF_AdjustSubraceStats("Weretiger", 2, 0, 1,-1, -2, 0);
    SF_SetSubraceFeat("Weretiger", FEAT_BLIND_FIGHT);
    SF_SetSubracePortrait("Weretiger", "po_werecat_", "po_werecat_");
}

void LoadSubrace_Werewolf()
{
    SF_CreateNewSubrace("Werewolf", APPEARANCE_TYPE_WEREWOLF, APPEARANCE_TYPE_WEREWOLF);
    SF_AdjustSubraceStats("Werewolf", 1, 2, 2,-2, -2, -1);
    SF_SetSubraceAlignmentRestriction("Werewolf", ALLOW_USE_TRUE, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    SF_SetSubraceFeat("Werewolf", FEAT_BLIND_FIGHT);
    SF_SetSubraceFeat("Werewolf", FEAT_IMPROVED_INITIATIVE);
    SF_SetSubracePortrait("Werewolf", "po_Werewolf_", "po_Werewolf_");
}

void LoadSubrace_Wererat()
{
    SF_CreateNewSubrace("Wererat", APPEARANCE_TYPE_WERERAT, APPEARANCE_TYPE_WERERAT);
    SF_AdjustSubraceStats("Wererat", 0, 2, 2, 0, -2, -2);
    SF_SetSubraceAlignmentRestriction("Weretiger", ALLOW_USE_TRUE, ALIGN_RESTRICT_LAWFUL | ALIGN_RESTRICT_EVIL);
    SF_SetSubracePortrait("Wererat", "po_Wererat_", "po_Wererat_");
}

void LoadSubrace_Quasit()
{
    SF_CreateNewSubrace("Quasit", APPEARANCE_TYPE_QUASIT, APPEARANCE_TYPE_QUASIT, "pcsubracequas", "", "", FALSE, 11);
    SF_AdjustSubraceStats("Quasit", -2, 2, 0, -1, 2, -1);
    SF_SetSubraceAlignmentRestriction("Quasit", ALLOW_USE_TRUE, ALIGN_RESTRICT_CHAOTIC | ALIGN_RESTRICT_EVIL);
    SF_SetSubracePortrait("Quasit", "po_dmquasit_", "po_dmquasit_");
    SF_SetSubraceRaceRestriction("Quasit", ALLOW_USE_TRUE, RACE_RESTRICT_GNOME | RACE_RESTRICT_HALFLING);
}

void main()
{
    LoadSubrace_Aranea();
    LoadSubrace_Weretiger();
    LoadSubrace_Werewolf();
    LoadSubrace_Wererat();
    LoadSubrace_Quasit();
}
