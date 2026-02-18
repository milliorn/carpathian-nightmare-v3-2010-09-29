//::///////////////////////////////////////////////
//:: ACN OnDeath Boss Script
//:: acn_boss_death
//:://////////////////////////////////////////////
//:: Created By: Milliorn, Scarface, Moe
//:: Created On: 2006
//:://////////////////////////////////////////////
#include "inc_socket_gener"

void main()
{
    // Spawn in next henchman
    CreateObject(OBJECT_TYPE_CREATURE, "gatekeepervr", GetLocation(GetWaypointByTag("WP_SPAWN_VROK")), TRUE);
    // get rid of dead Boss
    ExecuteScript("nw_c2_default7", OBJECT_SELF);
    DestroyObject(OBJECT_SELF, 60.0);
    SetIsDestroyable(TRUE, FALSE, TRUE);

    // Initial necessary var
    object oKiller = GetLastKiller();

    // Validate Killer as PC and not a DM
    while (GetIsObjectValid(GetMaster(oKiller)))
    {
        oKiller = GetMaster(oKiller);
    }
    if (!GetIsPC(oKiller) || GetIsDM(oKiller)) return;

    // Other vars
    object oModule = GetModule();
    object oArea = GetArea(OBJECT_SELF);
    object oPartyMember = GetFirstFactionMember(oKiller, TRUE);

    float fTimer = 6.0;

    int iCR = FloatToInt(GetChallengeRating(OBJECT_SELF)); int iLevel = 0;
    int iRewardXP = 0; int iRewardGP = 0;

    string sNpc = GetResRef(OBJECT_SELF);
    string sBoss = GetName(OBJECT_SELF, FALSE);
    string sCheck = GetLocalString(oModule, sNpc);
    string sArea = "";
    string sName = "";
    string sInfo = "";
    string sAcct = "";
    string sKey  = "";
    string sPCArea = "";
    string sLvl = IntToString(iLevel);
    string sMsg = sName + ", level " + sLvl + ", has slayed " + sBoss + "." ;

    // NOW get Killer info
    int iKillerLvl = GetHitDice(oKiller);
    int iMaxLvl = iKillerLvl + 5;
    int iMinLvl = iKillerLvl - 5;

    // and calculate Bonus
    if (iCR >= 60) iCR = 60;
    iRewardXP = ((iKillerLvl * iCR)* 6);
    iRewardGP = ((iKillerLvl * iCR) * 20);

    // now that everything is figured out - loop through party to see who gets reward
    while (GetIsObjectValid(oPartyMember) == TRUE)
    {

            sName = GetName(oPartyMember, FALSE);
            sInfo = GetSubString(sName, 0, 32);
            sAcct = GetPCPlayerName(oPartyMember);
            sKey  = GetPCPublicCDKey(oPartyMember, FALSE);
            iLevel = GetHitDice(oPartyMember);
            sPCArea = GetTag(GetArea(oPartyMember));
            sArea = GetTag(GetArea(OBJECT_SELF));

         // Check if oPartyMember is in the same area, if not then skip
         // all code inside the statement and carry on with loop
         if (GetArea(oPartyMember) == oArea)
         {
            // Too high for Boss AND in the Boss Area - Port out without Reward
            if ((iLevel < iMinLvl) || (iLevel > iMaxLvl))
            {
                DelayCommand(2.5, SendMessageToPC(oPartyMember, "You are not within 5 levels of Boss Killer - No Boss Reward"));
                DelayCommand(5.0,FloatingTextStringOnCreature("Not within 5 levels of Boss Killer", oPartyMember));
            }

            // have received Boss Reward already - no reward
            else
            {
                DelayCommand(2.0,AssignCommand(oPartyMember, SpeakString("MY GP reward is: "
                + IntToString(iRewardGP)+ " MY XP reward is: "
                + IntToString(iRewardXP), TALKVOLUME_TALK)));
                GiveGoldToCreature(oPartyMember, iRewardGP);
                GiveXPToCreature(oPartyMember, iRewardXP);

                // if it's the Killer (and not previously disqualified) give Killer a gem
                if (oPartyMember == oKiller) GenerateSockets(oKiller);
                    SendMessageToAllDMs(sName+"<c ó > slayed </c>" + sBoss +".  GP reward is: <c ó >"
                    + IntToString(iRewardGP)+ "</c> XP reward is: <c ó >"
                    + IntToString(iRewardXP));
            }
        }
        else
        {
            DelayCommand(2.5, SendMessageToPC(oPartyMember, "Must be in same area as the Boss to receive reward!"));
            DelayCommand(5.0,FloatingTextStringOnCreature("Must be in same area as the Boss to receive reward!", oPartyMember));
        }

        oPartyMember = GetNextFactionMember(oKiller, TRUE);
    }
}
