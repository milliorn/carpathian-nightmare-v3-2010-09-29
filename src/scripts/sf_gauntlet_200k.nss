// Gauntlet Token Prize Script
void main()
{
    // Variables
    object oPC = GetPCSpeaker();
    string sBoss = GetName(OBJECT_SELF, TRUE);
    string sName = GetName(oPC);
    string sLogInName = GetPCPlayerName(oPC);
    string sCDKEY = GetPCPublicCDKey(oPC, FALSE);
    string sIP = GetPCIPAddress(oPC);
    int iReward = Random(99999) +1 ;
    string sReward = IntToString(iReward);

    if (iReward <= 10000)iReward = 10000;

    GiveGoldToCreature(oPC, iReward);
    GiveXPToCreature(oPC, iReward);
    SendMessageToAllDMs(sName+"<c ó > slayed </c>" + sBoss +".  GP reward is: <c ó >"
    + IntToString(iReward)+ "</c> XP reward is: <c ó >"
    + IntToString(iReward));
}
