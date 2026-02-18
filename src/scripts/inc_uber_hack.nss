object oPC = GetEnteringObject();

string sID = GetPCIPAddress(oPC),
       sKey =  GetPCPublicCDKey(oPC),
       sName = GetPCPlayerName(oPC),
       sPlayer = GetName(oPC, FALSE);

effect eImmobile = EffectCutsceneImmobilize();

int iTotalHD = GetXP(oPC);
int iAC = GetAC(oPC);
int iHP = GetMaxHitPoints(oPC);
int iSpeed = GetMovementRate(oPC);

int iBarbarian  = GetClassByPosition(1, oPC);
int iBard       = GetClassByPosition(1, oPC);
int iCleric     = GetClassByPosition(1, oPC);
int iDruid      = GetClassByPosition(1, oPC);
int iFighter    = GetClassByPosition(1, oPC);
int iMonk       = GetClassByPosition(1, oPC);
int iPaladin    = GetClassByPosition(1, oPC);
int iRanger     = GetClassByPosition(1, oPC);
int iRogue      = GetClassByPosition(1, oPC);
int iSorcerer   = GetClassByPosition(1, oPC);
int iWizard     = GetClassByPosition(1, oPC);

int iStr = GetAbilityScore(oPC, ABILITY_STRENGTH, TRUE);
int iDex = GetAbilityScore(oPC, ABILITY_DEXTERITY, TRUE);
int iWis = GetAbilityScore(oPC, ABILITY_WISDOM, TRUE);
int iInt = GetAbilityScore(oPC, ABILITY_INTELLIGENCE, TRUE);
int iCon = GetAbilityScore(oPC, ABILITY_CONSTITUTION, TRUE);
int iCha = GetAbilityScore(oPC, ABILITY_CHARISMA, TRUE);

int iFort = GetFortitudeSavingThrow(oPC);
int iRefl = GetReflexSavingThrow(oPC);
int iWill = GetWillSavingThrow(oPC);

int iSkill_1 = GetSkillRank(SKILL_ANIMAL_EMPATHY, oPC);
int iSkill_2 = GetSkillRank(SKILL_APPRAISE, oPC);
int iSkill_3 = GetSkillRank(SKILL_BLUFF, oPC);
int iSkill_4 = GetSkillRank(SKILL_CONCENTRATION, oPC);
int iSkill_5 = GetSkillRank(SKILL_CRAFT_ARMOR, oPC);

int iSkill_6 = GetSkillRank(SKILL_CRAFT_TRAP, oPC);
int iSkill_7 = GetSkillRank(SKILL_CRAFT_WEAPON, oPC);
int iSkill_8 = GetSkillRank(SKILL_DISABLE_TRAP, oPC);
int iSkill_9 = GetSkillRank(SKILL_DISCIPLINE, oPC);
int iSkill_10 = GetSkillRank(SKILL_HEAL, oPC);

int iSkill_11 = GetSkillRank(SKILL_HIDE, oPC);
int iSkill_12 = GetSkillRank(SKILL_INTIMIDATE, oPC);
int iSkill_13 = GetSkillRank(SKILL_LISTEN, oPC);
int iSkill_14 = GetSkillRank(SKILL_LORE, oPC);

int iSkill_15 = GetSkillRank(SKILL_MOVE_SILENTLY, oPC);
int iSkill_16 = GetSkillRank(SKILL_OPEN_LOCK, oPC);
int iSkill_17 = GetSkillRank(SKILL_PARRY, oPC);
int iSkill_18 = GetSkillRank(SKILL_PERFORM, oPC);
int iSkill_19 = GetSkillRank(SKILL_PERSUADE, oPC);
int iSkill_20 = GetSkillRank(SKILL_PICK_POCKET, oPC);

int iSkill_21 = GetSkillRank(SKILL_SEARCH, oPC);
int iSkill_22 = GetSkillRank(SKILL_SET_TRAP, oPC);
int iSkill_23 = GetSkillRank(SKILL_SPELLCRAFT, oPC);
int iSkill_24 = GetSkillRank(SKILL_SPOT, oPC);
int iSkill_25 = GetSkillRank(SKILL_TAUNT, oPC);

int iSkill_26 = GetSkillRank(SKILL_TUMBLE, oPC);
int iSkill_27 = GetSkillRank(SKILL_USE_MAGIC_DEVICE, oPC);

/*void main()
{

}
