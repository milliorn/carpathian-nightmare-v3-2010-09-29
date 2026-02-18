void main()
{
    object oPC = GetLastOpenedBy();
    string sName = GetName(oPC, FALSE);
    AssignCommand(oPC, ActionJumpToLocation(GetStartingLocation()));
    SendMessageToAllDMs("<có  >WARNING!!! </c>"+sName+ "<có  > tried to open a Loot Generator!");
    SetLocked(oPC, TRUE);
}
