// Stop players follow attacking from pvp area to no pvp area
void main()
{
    object oPC = GetEnteringObject();
    AssignCommand(oPC, ClearAllActions(TRUE));
    ExecuteScript("check_uber_hack", oPC);
    ExecuteScript("send_jail", oPC);
}



