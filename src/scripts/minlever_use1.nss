//:://////////////////////////////////////////////
//:: Created By: Rich Dersheimer
//:: Created On: July 5, 2002
//:://////////////////////////////////////////////
#include "nw_i0_tool"

void main()
{
object oDoor = GetObjectByTag("mindoor1"); // assign oDoor the stuck door
object oPC = GetLastUsedBy(); // assign oPC to the player who pulls the lever

    //does the party have some oil?


    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE); // move the lever
    PlaySound("as_sw_lever1");
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    SetLocked(oDoor,FALSE);
    AssignCommand (oDoor,ActionOpenDoor(oDoor));



 }
