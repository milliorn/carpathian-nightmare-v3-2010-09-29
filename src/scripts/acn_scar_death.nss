//Scarface Cockpit Respawn
void main()
{
    object oKiller = GetLastKiller(),
           oArea = GetArea(OBJECT_SELF),
           oPartyMember = GetFirstFactionMember(oKiller, TRUE);
    int iHD = GetHitDice(oPartyMember),
        iMaxLvl = iHD + 10,
        iMinLvl = iHD - 10,
        iReward = (iHD * d20());
    string sName = GetName(oPartyMember, FALSE),
           sAcct = GetPCPlayerName(oPartyMember),
           sPCArea = GetTag(GetArea(oPartyMember)),
           sArea = GetTag(GetArea(OBJECT_SELF));

    ExecuteScript("acn_scar_decay", OBJECT_SELF);

    while (GetIsObjectValid(GetMaster(oKiller)))
    {
        oKiller = GetMaster(oKiller);
    }
    if (!GetIsPC(oKiller) || GetIsDM(oKiller)) return;

    if (iReward <= 50) iReward = 50;
    else if (iReward >= 500) iReward = 500;

    while (GetIsObjectValid(oPartyMember) == TRUE)
    {
         if (GetArea(oPartyMember) == oArea)
         {
            if ((iHD < iMinLvl) || (iHD > iMaxLvl))
            {
                DelayCommand(2.5, SendMessageToPC(oPartyMember, "You are not within 5 levels of Boss Killer - No Boss Reward"));
                DelayCommand(5.0,FloatingTextStringOnCreature("Not within 5 levels of Boss Killer", oPartyMember));
            }

            // passed all tests - now give the Reward already - first set the Boss Tag...
            else
            {
                DelayCommand(0.3, FloatingTextStringOnCreature("MY GP reward is: "
                + IntToString(iReward)+ " MY XP reward is: "
                + IntToString(iReward), oPartyMember, TRUE));
                GiveGoldToCreature(oPartyMember, iReward);
                GiveXPToCreature(oPartyMember, iReward);
                PlayVoiceChat(VOICE_CHAT_CHEER, oPartyMember);
                AssignCommand(oPartyMember, ActionPlayAnimation(ANIMATION_FIREFORGET_VICTORY1));
            }
        }

        oPartyMember = GetNextFactionMember(oKiller, TRUE);
    }
}
