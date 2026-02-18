#include "x2_inc_switches"
void main()
{
    object oActivator = GetItemActivator(),
           oBoot = GetItemActivated(),
           oTarget = GetItemActivatedTarget();
    string sName = GetName(oTarget);
    string sCDKey = GetPCPublicCDKey(oActivator);
    effect eFly = EffectDisappearAppear(GetItemActivatedTargetLocation());

    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;

    if (sCDKey == "QG6CXEYC" || //milliorn
        sCDKey == "Q76A43RL" || //milliorn
        sCDKey == "QCRWUXFF" || //bassmaster
        sCDKey == "QG6QREW7" || //fooshwa
        sCDKey == "QC74AN4H")

    {
        ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eFly, GetItemActivator(), 6.0);
    }

    else
    {
        SendMessageToPC(oActivator, "You cannot use this item");
        SendMessageToAllDMs("Player "+sName+" is trying to use a DM item");
        DestroyObject(oBoot);
    }
}
