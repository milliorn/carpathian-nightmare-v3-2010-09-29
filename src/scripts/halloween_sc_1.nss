int StartingConditional()
{
    object oPC = GetPCSpeaker();
    string sKey = GetPCPublicCDKey(oPC);
    return (GetCampaignInt("HALLOWEEN", "SEEN_DEATH_" + sKey));
}
