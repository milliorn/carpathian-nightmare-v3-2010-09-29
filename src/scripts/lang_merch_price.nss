void main()
{
    object oPC = GetPCSpeaker();
    int iSkill = 1 + GetSkillRank(SKILL_LORE, oPC, TRUE);
    int iCost = 100000 / iSkill;
    float fCost = IntToFloat(iCost);
    string sCost = FloatToString(fCost, 7, 0);
    int iGP = StringToInt(sCost);
    SetLocalInt(oPC, "GOLD_LANG", iGP);
    SetCustomToken(9876, sCost);
}
