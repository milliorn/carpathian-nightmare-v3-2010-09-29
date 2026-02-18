void main()
{
    object oPC = GetEnteringObject(),
           oExamine = GetObjectByTag("EXAMINE_ME");

        if (!GetLocalInt(oPC, "EXAMINE") && GetIsPC(oPC) && !GetIsDM(oPC))
        {
            AssignCommand(oPC, ClearAllActions());
            ActionExamine(oExamine);
            SetLocalInt(oPC, "EXAMINE", TRUE);
        }
}
