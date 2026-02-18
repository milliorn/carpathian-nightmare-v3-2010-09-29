// Milliorn's PC Info displayer item
#include "x2_inc_switches"
void main()
{
    object oActivator = GetItemActivator(),
           oGold = GetItemActivated(),
           oTarget = GetItemActivatedTarget();
    string sName = GetName(oTarget), sGold;
    string sCDKey = GetPCPublicCDKey(oActivator);
    int iGold;

    if (sCDKey == "QG6CXEYC" || //milliorn
        sCDKey == "Q76A43RL" || //milliorn
        sCDKey == "QCRWUXFF" || //bassmaster
        sCDKey == "QG6QREW7" || //fooshwa
        sCDKey == "QC74AN4H")

    {
     string sReport;

        SendMessageToPC(oActivator, sReport);
        iGold = GetGold(oTarget);
        sGold = IntToString(iGold);
        SendMessageToAllDMs(sName+" has "+sGold+" Gold"+ " Account: "+ GetPCPlayerName( oTarget )
                                    + " CD Key: " + GetPCPublicCDKey( oTarget )
                                    + " IP: " + GetPCIPAddress( oTarget ));


    }
    else
    {
        SendMessageToPC(oActivator, "You cannot use this item");
        SendMessageToAllDMs("<có  >Player </c>"+sCDKey+"<có  > is trying to use a DM item");
        DestroyObject(oGold);
    }
}
