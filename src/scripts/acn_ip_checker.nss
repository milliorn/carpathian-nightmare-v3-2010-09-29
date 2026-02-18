void main()
{
    object oModule = GetModule();
    object oPC = GetEnteringObject();
    string sIP = GetPCIPAddress(oPC);
    string sName = GetName(oPC);

    if (GetLocalString(oModule, sIP) == sIP)
    {
        SendMessageToAllDMs("<có  >Duplicate IP detected from </c>"
        + sName + " <cóóó>" + sIP + ".  <có  >Check the forums for a list to see if this"
        + " client has fixed his settings.");
        return;
    }

    SetLocalString(oModule, sIP, sIP);
}
