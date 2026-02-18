//::///////////////////////////////////////////////
//:: ACN OnDeath Boss Script
//:: acn_boss_death
//:://////////////////////////////////////////////
//:: Created By: Milliorn, Scarface, Moe
//:: Created On: 2006
//:://////////////////////////////////////////////
void main()
{
    // get rid of dead Boss
    ExecuteScript("nw_c2_default7", OBJECT_SELF);
/*    DestroyObject(OBJECT_SELF, 60.0);
    SetIsDestroyable(FALSE, FALSE, TRUE);
*/
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

    int iLevel = GetHitDice(oKiller);

    string sBoss = GetName(OBJECT_SELF, FALSE);
    string sArea = "";
    string sName = GetName(oKiller);
    string sLvl = IntToString(iLevel);
    string sMsg = sName + ", <c ó >level </c>" + sLvl + ", <c ó >has slayed </c>" + sBoss + "." ;

    SendMessageToAllDMs(sMsg);

    // now that everything is figured out - loop through party to see who gets reward
    while (GetIsObjectValid(oPartyMember) == TRUE)
    {
         // Check if oPartyMember is in the same area, if not then skip
         // all code inside the statement and carry on with loop
         if (GetArea(oPartyMember) == oArea)
         {
            DelayCommand(2.0,AssignCommand(oPartyMember, SpeakString("You have"+
            " slayed the BOSS.  Loot his key!", TALKVOLUME_TALK)));
         }
            else
            {
                DelayCommand(2.5, SendMessageToPC(oPartyMember, "Must be in same area as the Boss to receive reward!"));
                DelayCommand(5.0,FloatingTextStringOnCreature("Must be in same area as the Boss to receive reward!", oPartyMember));
            }

        oPartyMember = GetNextFactionMember(oKiller, TRUE);
    }
}
