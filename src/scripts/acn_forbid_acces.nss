void main()
{
    object oPC = GetEnteringObject();
    string sName = GetName(oPC, FALSE);
    string sCDKey = GetPCPublicCDKey(oPC);

    if (sCDKey == "QG6CXEYC" ||
        sCDKey == "Q76A43RL" ||
        sCDKey == "QG6QREW7"){
        return;}
        AssignCommand(oPC, ActionJumpToLocation(GetStartingLocation()));
        SendMessageToAllDMs("<có  >WARNING!!! </c>" + sName + " <có  >tried to access </c>"
        + GetName(GetArea(oPC)));
}
