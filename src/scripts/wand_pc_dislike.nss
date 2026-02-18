#include "x2_inc_switches"
void main()
{
    // Get entering PC
    object oActivator = GetItemActivator();
        string sName1 = GetName(oActivator);

    if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;
    // make sure they are not a DM
    if(GetIsPC(oActivator) && !GetIsDM(oActivator))
    {
       SpeakString("<cσ σ>"+sName1+"<c σσ>  status has been set to Hostile.", TALKVOLUME_SHOUT);

       // Loop all PC's in the module and set this PC to dislike them - uh oh
        object oPC = GetFirstPC();
        while(GetIsObjectValid(oPC))
        {
            // Set to dislike
            SetPCDislike(oActivator, oPC);

            // Get next PC
            oPC = GetNextPC();
        }
    }
}


