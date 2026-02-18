#include "nwnx_realtime"
void main()
{
    object oPC = GetLastUsedBy();

    int iMinuteUp       = GetServerUpMinutes();
    int iMinuteTimer    = 360;
    int iMinuteLeft     = iMinuteTimer - iMinuteUp;

    string sUpMinute    = IntToString(iMinuteLeft);
    string sPlayer      = "SUNDIAL";
    string sKey         = "TRUE";

    if (GetLocalString(oPC, sPlayer) != sKey)
    {
        SendMessageToPC(oPC, "<c ออ>A Carpathian Nightmare resets on a 6 hour timer.</c>");
        SendMessageToPC(oPC, "<c ออ>The next reset will be in <cอออ>" + sUpMinute + "</c> minutes.");
        SendMessageToPC(oPC, "<c ออ>Uptime: <cอออ>" + GetServerUptime() + "</c>");
        SendMessageToPC(oPC, "<c ออ>The date is <cอออ>" + GetServerDate() + "</c>");
        SendMessageToPC(oPC, "<c ออ>The time is <cอออ>" + GetServerTime() + "</c>");
        SendMessageToPC(oPC, "<c ออ>Server Clock is set to 'Central Time Zone U.S.A.'</c>");
        SetLocalString(oPC, "SUNDIAL", "TRUE");
        DelayCommand(6.0, DeleteLocalString(oPC, "SUNDIAL"));
    }
    else
    {
        SendMessageToPC(oPC, "<cอ  >Wait a few seconds before using Sundial again</c>");
    }
}
