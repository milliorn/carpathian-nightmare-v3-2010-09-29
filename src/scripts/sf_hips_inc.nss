// Amount of time allowed between each use
const int RESTRICTION_TIMER = 12;
// Pseudo function to check the PCs current <span class="highlight">HIPS</span> status
void SF_PseudoHipsCheck(object oPC, int nCount, string sPlayerID)
{
    nCount--;
    if (!GetIsObjectValid(oPC))
    {
        DeleteLocalInt(GetModule(), "HIPS_RESTRICTION_" + sPlayerID);
        return;
    }
    if (nCount < 1)
    {
        nCount = RESTRICTION_TIMER;
        DeleteLocalInt(GetModule(), "HIPS_RESTRICTION_" + sPlayerID);
    }
    int nUseHips = GetLocalInt(GetModule(), "HIPS_RESTRICTION_" + sPlayerID);
    int nActionMode = GetActionMode(oPC, ACTION_MODE_STEALTH);
    if (!nUseHips && nActionMode)
    {
        SetLocalInt(GetModule(), "HIPS_RESTRICTION_" + sPlayerID, 1);
    }
    else if (nUseHips && !nActionMode)
    {`
        nUseHips++;
        SetLocalInt(GetModule(), "HIPS_RESTRICTION_" + sPlayerID, nUseHips);
    }
    else if (nUseHips > 1 && nActionMode)
    {
        SendMessageToAllDMs(GetName(oPC) + "<có  > could possibly be spamming hips.");
        SendMessageToPC(oPC, "<có  >SPAMMING HIPS IS FORBIDDEN!!!");
        FloatingTextStringOnCreature("<có  >SPAMMING HIPS IS FORBIDDEN!!!", oPC);
        ClearAllActions(FALSE);
        SetActionMode(oPC, ACTION_MODE_STEALTH, FALSE);
    }

    DelayCommand(1.0, SF_PseudoHipsCheck(oPC, nCount, sPlayerID));
}
// Call this OnClientEnter
void SF_HipsRestrictionOnClientEnter()
{
    object oPC = GetEnteringObject();
    if (GetHasFeat(FEAT_HIDE_IN_PLAIN_SIGHT, oPC))
    {
        SetLocalInt(oPC, "PSEUDO_RUNNING", TRUE);
        SF_PseudoHipsCheck(oPC, RESTRICTION_TIMER, GetPCPublicCDKey(oPC, TRUE));
    }
}
// Call this OnPlayerLevelUp
void SF_HipsRestrictionOnPCLevelUp()
{
    object oPC = GetEnteringObject();
    if (GetHasFeat(FEAT_HIDE_IN_PLAIN_SIGHT, oPC) &&
        !GetLocalInt(oPC, "PSEUDO_RUNNING"))
    {
        SetLocalInt(oPC, "PSEUDO_RUNNING", TRUE);
        SF_PseudoHipsCheck(oPC, RESTRICTION_TIMER, GetPCPublicCDKey(oPC, TRUE));
    }
}

/*
void main()
{

}
