#include "nw_i0_tool"

void main()
{
    object oDoor = GetObjectByTag("PrisonDoor3");
    object oPC = GetLastUsedBy();
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
    PlaySound("as_sw_lever1");
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    SetLocked(oDoor,FALSE);
    AssignCommand (oDoor,ActionOpenDoor(oDoor));
}
