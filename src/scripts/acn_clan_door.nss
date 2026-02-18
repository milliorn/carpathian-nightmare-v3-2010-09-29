 void main()
{
object oPC = GetLastOpenedBy();
object oTarget = GetObjectByTag("KnightsofCynphoniaGuildHouseEntr");

if (!GetIsPC(oPC)) return;

if (GetItemPossessedBy(oPC, "ForgottenDreamsClanHouseKey")!= OBJECT_INVALID)
   {
   ActionOpenDoor(oTarget);

   DelayCommand(3.0, ActionCloseDoor(oTarget));
   DelayCommand(4.0, SetLocked(oTarget, TRUE));
}
}

