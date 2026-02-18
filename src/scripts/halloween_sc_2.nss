int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sKey = GetPCPublicCDKey(oPC);
    return (GetCampaignInt("HALLOWEEN", "BEEN_BAD_" + sKey));
}
