//Penguin player conversation starter
#include "penguin_inc"
#include "x2_inc_switches"
void main()
{
    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;

    if (sName == "QG6CXEYC" || //milliorn
        sName == "Q76A43RL" || //milliorn
        sName == "QG6QREW7" || //milliorn
        sName == "QCRWUXFF" || //bassmaster
        sName == "QC74AN4H")

    {

        if(GetCutsceneMode(oTarget) == FALSE)
        {
            SendMessageToPC(oActivator, "Target is not in cutscene mode");
            return;
        }

        else if(GetCutsceneMode(oTarget) == TRUE)
        {
            SetCutsceneMode(oTarget, FALSE, TRUE);
        }
    }

    else
    {
        SendMessageToPC(oActivator, "You cannot use this item");
        SendMessageToAllDMs("<có  >Player </c>"+sName1+"<có  > is trying to use a DM item");
        DestroyObject(oPenguin);
    }
}
