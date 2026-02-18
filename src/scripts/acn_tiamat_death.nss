//::///////////////////////////////////////////////
//:: ACN OnDeath Boss Script
//:: acn_boss_death
//:://////////////////////////////////////////////
//:: Created By: Milliorn, Scarface, Moe
//:: Created On: 2006
//:://////////////////////////////////////////////
#include "inc_socket_gener"
#include "aps_include"
void main()
{
    // get rid of dead Boss
    ExecuteScript("nw_c2_default7", OBJECT_SELF);

    object oCoffin = GetObjectByTag("KoscheisCoffin");
    CreateItemOnObject("item005", oCoffin);

//    DestroyObject(OBJECT_SELF, 60.0);
//    SetIsDestroyable(TRUE, FALSE, FALSE);

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

    int iCR = FloatToInt(GetChallengeRating(OBJECT_SELF));
    int iLevel = 0;
    int iRewardXP = 0; int iRewardGP = 0;

    string sNpc = GetResRef(OBJECT_SELF);
    string sBoss = GetName(OBJECT_SELF, TRUE);
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
    if (iCR >= 40) iCR = 40;
    iRewardXP = ((iKillerLvl * iCR)* 10);
    iRewardGP = ((iKillerLvl * iCR) * 100);

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
            if ((iLevel > iCR + 5) && (sPCArea == sArea))
            {
                AssignCommand(oPartyMember, ClearAllActions());
                AssignCommand(oPartyMember, ActionJumpToLocation(GetStartingLocation()));
                DelayCommand(2.5, SendMessageToPC(oPartyMember, "You are too High Level to be with that Boss - No Boss Reward"));
                DelayCommand(5.0,FloatingTextStringOnCreature("Too High Level for Boss", oPartyMember));
                SendMessageToAllDMs("<có  >PLAYER: </c>"+sName+" <có  >CD KEY: </c>"+sKey+" <có  >ACCT: </c>"
                +sAcct+" <có  >has been ported out for being too high level!!!");
            }

            // not within 10 levels of Killer - no Reward
            else if ((iLevel < iMinLvl) || (iLevel > iMaxLvl))
            {
                DelayCommand(2.5, SendMessageToPC(oPartyMember, "You are not within 5 levels of Boss Killer - No Boss Reward"));
                DelayCommand(5.0,FloatingTextStringOnCreature("Not within 5 levels of Boss Killer", oPartyMember));
            }

            // have received Boss Reward already - Port them out - no reward
            else if (GetPersistentInt(oPartyMember, sBoss, "BOSS"))
            {
                DelayCommand(2.5, SendMessageToPC(oPartyMember, "You have already killed this Boss - No Boss Reward"));
                DelayCommand(5.0,FloatingTextStringOnCreature("Already Killed Boss", oPartyMember));
                AssignCommand(oPartyMember, ClearAllActions());
                AssignCommand(oPartyMember, ActionJumpToLocation(GetStartingLocation()));
                SendMessageToAllDMs("<có  >PLAYER: </c>"+sName+"<có  > CD KEY: </c>"+sKey+"<có  > ACCT: </c>"
                +sAcct+"<có  > has been ported out for Boss Camping!!!");
            }

            // passed all tests - now give the Reward already - first set the Boss Tag...
            else
            {
                SetPersistentInt(oPartyMember, sBoss, TRUE, 1, "BOSS");
                DelayCommand(2.0, SendMessageToPC(oPartyMember, "MY GP reward is: "
                + IntToString(iRewardGP)+ " MY XP reward is: "
                + IntToString(iRewardXP)));
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
