void main()
{
    object oPC = GetPCSpeaker();
    string sKey = GetPCPublicCDKey(oPC);
    SetCampaignInt("HALLOWEEN", "BEEN_BAD_" + sKey, TRUE);
}
