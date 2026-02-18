#include "aps_include"
void main()
{
    object oPC = GetEnteringObject();
    string sName = GetName(oPC, FALSE),
           sAcct = GetPCPlayerName(oPC),
           sArea = GetTag(GetArea(OBJECT_SELF)),
           sMap  = GetName(GetArea(OBJECT_SELF)),
           sKey  = GetPCPublicCDKey(oPC, FALSE);

    if (!GetIsPC(oPC) || GetIsDM(oPC))return; //if (!GetIsPC(oPC)) return;
    else if (GetPersistentInt(oPC, sArea, "BOSS"))
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetStartingLocation()));
        DelayCommand(5.0, SendMessageToPC(oPC, "You may only kill the same Boss once per hour!"));
        DelayCommand(2.5 ,FloatingTextStringOnCreature("You may only kill the same Boss once per hour!", oPC));
        SendMessageToAllDMs("<có  >PLAYER: </c>"+sName+" <có  >CD KEY: </c>"+sKey+" <có  >ACCT: </c>"
        +sAcct+" <có  >has been ported out for possible boss camping at </c>" +sMap);
        return;
    }

    else if (GetHitDice(oPC) >= 15)
    {
        AssignCommand(oPC, ClearAllActions());
        AssignCommand(oPC, ActionJumpToLocation(GetStartingLocation()));
        DelayCommand(5.0, SendMessageToPC(oPC, "YOUR ARE TOO HIGH LEVEL FOR THAT BOSS!!!!!!!!!"));
        DelayCommand(2.5 ,FloatingTextStringOnCreature("YOUR ARE TOO HIGH LEVEL FOR THAT BOSS!!!!!!!!!", oPC));
        SendMessageToAllDMs("<có  >PLAYER: </c>"+sName+" <có  >CD KEY: </c>"+sKey+" <có  >ACCT: </c>"
        +sAcct+" <có  >has been ported out for being too high level at </c>" +sMap);
   }
}


