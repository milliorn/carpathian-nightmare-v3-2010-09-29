////////////////////////////////////////////////////////////////////////////////
//:: Scarface's No Trap Setting In No PVP Areas
//:: OnUnaqcuiredItem Script
////////////////////////////////////////////////////////////////////////////////
void CheckForTraps(object oArea, object oPC)
{
object oTrap = GetNearestTrapToObject(oPC, FALSE);
if (GetIsObjectValid(oTrap) && GetTrapCreator(oTrap) == oPC)
  {
    DestroyObject(oTrap);
    FloatingTextStringOnCreature("Trap was disabled", oPC);
    DelayCommand(0.4, FloatingTextStringOnCreature("Traps are not allowed to be set in NO PVP areas", oPC));
  }
}
void main()
{
  object oItem = GetModuleItemLost();
  object oPC = GetModuleItemLostBy();
  object oArea = GetArea(oPC);
    if (GetBaseItemType(oItem) == BASE_ITEM_TRAPKIT)
    {
      if (GetLocalInt(oArea, "NO_PVP"))
      {
        CheckForTraps(oArea, oPC);
      }
    }
}
