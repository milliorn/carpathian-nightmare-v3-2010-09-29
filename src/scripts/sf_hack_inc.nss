const int COMBINED_ABILITY_POINTS_MAX = 78; // Total ability points allowed
const int ABILITY_POINTS_MAX_SINGLE   = 20; // Max points in any one ability
const int MAX_SKILL_POINTS_TOTAL      = 52; // Max skill points in total
const int MAX_SKILL_POINTS_SINGLE     = 4; // Max skill points in any one skill

int CombinedAbilityPoints(object oPC);
int CheckFeatTotal(object oPC);
int CheckSkillPointsTotal(object oPC);
int TotalFeatsByRaceClass(object oPC);
int CheckAllAbiltyScores(object oPC);
int CheckSkillPointsSingle(object oPC);
int CheckForInvalidFeats(object oPC);
int CheckPlayerValidity(object oPC);

int PlayerValidityCheck(object oPC);

object oPC = GetEnteringObject();
//object oServer = GetObjectByTag("server_npc");

string sName = GetName(oPC, TRUE);
string sAcct = GetPCPlayerName(oPC);
string sKey = GetPCPublicCDKey(oPC);
string sNumFeatsClass;
string sFeatTotal;
string sSkillTotal;
string sTotalAbility;

int CheckPlayerValidity(object oPC)
{
    if(CombinedAbilityPoints(oPC)   > COMBINED_ABILITY_POINTS_MAX   ||
       CheckSkillPointsTotal(oPC)   > MAX_SKILL_POINTS_TOTAL        ||
       CheckFeatTotal(oPC)          > TotalFeatsByRaceClass(oPC)    ||
       CheckAllAbiltyScores(oPC)    > MAX_SKILL_POINTS_TOTAL        ||
       CheckSkillPointsSingle(oPC)                                  ||
       CheckForInvalidFeats(oPC))
{
        return TRUE;
    }
        return FALSE;
}

int CheckForInvalidFeats(object oPC)
{
int nFeat = 52;// start from FEAT_IMPROVED_CRITICAL_DAGGER
    while (nFeat < 89) // stop at FEAT_IMPROVED_CRITICAL_TWO_BLADED_SWORD
    {
       if(GetHasFeat(nFeat, oPC))
        return TRUE;
        else
          nFeat++;
    }

    nFeat = 128;// start from FEAT_WEAPON_SPECIALIZATION_DAGGER
    while (nFeat < 165) // stop at FEAT_WEAPON_SPECIALIZATION_TWO_BLADED_SWORD
    {
       if(GetHasFeat(nFeat, oPC))
        return TRUE;
       else
          nFeat++;
    }

    nFeat = 214;// start from FEAT_DIAMOND_BODY
    while (nFeat < 216) // stop at FEAT_PERFECT_SELF
    {
       if(GetHasFeat(nFeat, oPC))
        return TRUE;
       else
          nFeat++;
    }

    nFeat = 222;// start from FEAT_CRIPPLING_STRIKE
    while (nFeat < 226) // stop at FEAT_PERFECT_SELF
    {
       if(GetHasFeat(nFeat, oPC))
        return TRUE;
       else
          nFeat++;
    }
    nFeat = 251;// start from FEAT_UNCANNY_DODGE_2
    while (nFeat < 255) // stop at FEAT_UNCANNY_DODGE_6
    {
       if(GetHasFeat(nFeat, oPC))
        return TRUE;
       else
          nFeat++;
    }

    nFeat = 345;// start from FEAT_UNCANNY_DODGE_2
    while (nFeat < 353) // stop at FEAT_UNCANNY_DODGE_6
    {
       if(GetHasFeat(nFeat, oPC))
        return TRUE;
       else
          nFeat++;
    }


    nFeat = 427;// start from FEAT_RESIST_ENERGY_COLD
    while (nFeat < 870) // stop at FEAT_EPIC_LASTING_INSPIRATION
    {
       if(GetHasFeat(nFeat, oPC))
        return TRUE;
       else
          nFeat++;
    }

    nFeat = 872;// start from FEAT_EPIC_WILD_SHAPE_UNDEAD
    while (nFeat < 910) // stop at FEAT_EXTRA_SMITING
    {
       if(GetHasFeat(nFeat, oPC))
        return TRUE;
       else
          nFeat++;
    }

    nFeat = 917;// start from FEAT_EPIC_SKILL_FOCUS_BLUFF
    while (nFeat < 943) // stop at FEAT_WEAPON_OF_CHOICE_TWOBLADEDSWORD
    {
       if(GetHasFeat(nFeat, oPC))
        return TRUE;
       else
          nFeat++;
    }
    nFeat = 947;// start from FEAT_EPIC_DEVASTATING_CRITICAL_DWAXE
    while (nFeat < 951) // stop at FEAT_EPIC_SUPERIOR_WEAPON_FOCUS
    {
        if(GetHasFeat(nFeat, oPC))
        return TRUE;
        else
          nFeat++;
    }

    nFeat = 953;// start from FEAT_EPIC_DEVASTATING_CRITICAL_DWAXE
    while (nFeat < 1071) // stop at FEAT_EPIC_SUPERIOR_WEAPON_FOCUS
    {
       if(GetHasFeat(nFeat, oPC))
          return TRUE;
        else
          nFeat++;
    }

    if( GetHasFeat(5, oPC) ||
        GetHasFeat(195, oPC) ||
        GetHasFeat(259, oPC) ||
        GetHasFeat(296, oPC) ||
        GetHasFeat(297, oPC) ||
        GetHasFeat(409, oPC) ||
        GetHasFeat(412, oPC) ||
        GetHasFeat(944, oPC) ||
        GetHasFeat(946, oPC))
    {
        return TRUE;
    }
        return FALSE;
}

int CheckSkillPointsSingle(object oPC)
{
    int i;
    for (i = 0; i < 27; i++)
    {
        if(GetSkillRank(i, oPC, TRUE) > MAX_SKILL_POINTS_SINGLE)
        return TRUE;
    }
    return FALSE;
}

int CheckAllAbiltyScores(object oPC)
{
   if(GetAbilityScore(oPC, ABILITY_CHARISMA, TRUE) > ABILITY_POINTS_MAX_SINGLE ||
      GetAbilityScore(oPC, ABILITY_CONSTITUTION, TRUE) > ABILITY_POINTS_MAX_SINGLE ||
      GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE) > ABILITY_POINTS_MAX_SINGLE ||
      GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE) > ABILITY_POINTS_MAX_SINGLE ||
      GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE) > ABILITY_POINTS_MAX_SINGLE ||
      GetAbilityScore(oPC, ABILITY_WISDOM, TRUE) > ABILITY_POINTS_MAX_SINGLE)

    return TRUE;
    else
    return FALSE;
}

int TotalFeatsByRaceClass(object oPC)
{
    int nFeats = 1;
    //racial feat count
    switch(GetRacialType(oPC))
    {
        case RACIAL_TYPE_DWARF:    nFeats += 8; break;
        case RACIAL_TYPE_ELF:      nFeats += 8; break;
        case RACIAL_TYPE_GNOME:    nFeats += 9; break;
        case RACIAL_TYPE_HALFELF:  nFeats += 6; break;
        case RACIAL_TYPE_HALFLING: nFeats += 6; break;
        case RACIAL_TYPE_HALFORC:  nFeats += 1; break;
        case RACIAL_TYPE_HUMAN:    nFeats += 2; break;// +1(extra feat for humans)
    }
    //class feat count
    switch(GetClassByPosition(1, oPC))
    {
        case CLASS_TYPE_BARBARIAN:nFeats += 7; break;
        case CLASS_TYPE_BARD:     nFeats += 6; break;// -1 for Scribe Scroll
        case CLASS_TYPE_CLERIC:   nFeats += 8; break;// +2 for Domain Powers
                                                     // -1 for Scribe Scroll
        case CLASS_TYPE_DRUID:    nFeats += 6; break;// -1 for Scribe Scroll
        case CLASS_TYPE_FIGHTER:  nFeats += 7; break;
        case CLASS_TYPE_MONK:     nFeats += 7; break;
        case CLASS_TYPE_PALADIN:  nFeats += 9; break;// -1 for Scribe Scroll
        case CLASS_TYPE_RANGER:   nFeats += 10; break;// +2 for Ambidexterity & Two Weapon Fighting
                                                      // -1 for Scribe Scroll
        case CLASS_TYPE_ROGUE:    nFeats += 3; break;
        case CLASS_TYPE_SORCERER: nFeats += 2; break;// -1 for Scribe Scroll
        case CLASS_TYPE_WIZARD:   nFeats += 3; break;
    }
    sNumFeatsClass = IntToString(nFeats);
    SetLocalString(oPC, sNumFeatsClass, sNumFeatsClass);
    return nFeats;
}

int CheckSkillPointsTotal(object oPC)
{
    int nSkill, i;
    for (i = 0; i < 27; i++)
    {
        if(GetSkillRank(i, oPC, TRUE) > -1)
        nSkill += GetSkillRank(i, oPC, TRUE);
    }

    sSkillTotal = IntToString(nSkill);
    SetLocalString(oPC, sSkillTotal, sSkillTotal);
    return nSkill;
}

int CheckFeatTotal(object oPC)
{
    int nFeat, i;
    for (i = 0; i < 1071; i++)
    {
        if(GetHasFeat(i, oPC))
        {
            nFeat++;
        }
    }

    sFeatTotal = IntToString(nFeat);
    SetLocalString(oPC, sFeatTotal, sFeatTotal);
    return nFeat;
}

int CombinedAbilityPoints(object oPC)
{
    int n = GetAbilityScore(oPC, ABILITY_CHARISMA, TRUE);
    n += GetAbilityScore(oPC, ABILITY_CONSTITUTION, TRUE);
    n += GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE);
    n += GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE);
    n += GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE);
    n += GetAbilityScore(oPC, ABILITY_WISDOM, TRUE);
    sTotalAbility = IntToString(n);
    SetLocalString(oPC, sTotalAbility, sTotalAbility);
    return n;
}

int PlayerValidityCheck(object oPC)
{
    if(CheckPlayerValidity(oPC) == TRUE)
    {
        return FALSE;
    }
        return TRUE;
}

//void main(){}
