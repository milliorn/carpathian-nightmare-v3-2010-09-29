void main()
{
    object oPC = GetLastUsedBy(),
           oLastUser = GetLocalObject(OBJECT_SELF, "LAST_USER");

    if (GetIsDM(oPC)) return;
    if (GetIsObjectValid(oLastUser))
    {
        if (GetPCPublicCDKey(oPC) != GetLocalString(OBJECT_SELF, "LAST_USER_NAME"))
        {
            AssignCommand(oPC, ClearAllActions());
            AssignCommand(oPC, ActionMoveAwayFromObject(OBJECT_SELF, TRUE));
            FloatingTextStringOnCreature("<cÍ  >CHEST IS ALREADY IN USE!!!</c>", oPC);
        }
    }
}
