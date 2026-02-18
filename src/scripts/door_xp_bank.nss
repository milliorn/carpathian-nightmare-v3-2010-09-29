#include "nw_i0_plot"

void main()
{
    object oPC = GetLastUsedBy();
    object oKey = GetItemPossessedBy(oPC, "XPBankKey");
    object oDest = GetWaypointByTag("XPBankExit");

    ActionCloseDoor(OBJECT_SELF);

    if(HasItem(oPC, "XPBankKey") == TRUE)
    {
        DestroyObject(oKey);
        AssignCommand(oPC, JumpToLocation(GetLocation(oDest)));
        return;
    }

    else

    SendMessageToPC(oPC, "<cú>CANNOT ENTER XP BANK WITHOUT A KEY.</c>");
    FloatingTextStringOnCreature("<cú>CANNOT ENTER XP BANK WITHOUT A KEY.</c>", oPC);
}
