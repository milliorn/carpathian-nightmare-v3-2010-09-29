void main()
{
    object oPC = GetPCSpeaker();
    if ((GetLevelByClass(CLASS_TYPE_DRAGONDISCIPLE, oPC) >= 1)|| (GetLevelByClass(CLASS_TYPE_PALE_MASTER, oPC) >=1)){
         AssignCommand(oPC, ClearAllActions());
         AssignCommand(oPC, ActionJumpToLocation(GetStartingLocation()));}}

