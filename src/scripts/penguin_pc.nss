//Penguin player conversation starter
#include "penguin_inc"
#include "x2_inc_switches"
void main()
{
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;

    if (sName == "QG6CXEYC" || //milliorn
        sName == "Q76A43RL" || //milliorn
        sName == "QCRWUXFF" || //bassmaster
        sName == "QG6QREW7" || //fooshwa
        sName == "QC74AN4H")
    {
        AssignCommand( oActivator, ActionStartConversation(oActivator, "penguin_conv", TRUE, FALSE));
    }

    else
    {
        SendMessageToPC(oActivator, "You cannot use this item");
        SendMessageToAllDMs("<có  >Player </c>" + sName1 + "<có  > is trying to use a DM item");
        DestroyObject(oPenguin);
     }
}
