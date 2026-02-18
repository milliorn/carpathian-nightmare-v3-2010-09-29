void ClearWizTP()
{
    object oPC = GetLocalObject(OBJECT_SELF,"wizTPOwner");

    DeleteLocalInt(oPC,"wizTPCtr");
    DeleteLocalString(oPC,"wizTPColor");

    int j;
    for(j = 791; j < 795; j++)
    {
        DeleteLocalObject(oPC,"wizTP"+IntToString(j));
        DeleteLocalInt(oPC,"wizTP"+IntToString(j));
    }

}
