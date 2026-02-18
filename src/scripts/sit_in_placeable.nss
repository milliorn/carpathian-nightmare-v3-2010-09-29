void main()
{
    object oPC = GetLastUsedBy();
    object oChair = OBJECT_SELF;
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionSit(oChair));
}
