// Token Giving Script
void main()
{
    object oPC = GetLastUsedBy(),
           oRecall, oToken;

    // Make sure Only Players Get A Token
    if (!GetIsPC(oPC)) return;

    oRecall = GetItemPossessedBy(oPC, "sf_recall");
    oToken = GetItemPossessedBy(oPC, "gauntlet_token");
    int iToken = GetLocalInt(oRecall, "GAUNTLET_TOKEN");

    // Check If Token Variable Exists, If It Does Then Dont Give
    // The Player Another Token (To Avoid Exploits)This Variable Will
    // Be Removed When The Token Is Cashed In
    if (!GetIsObjectValid(oToken) && iToken == TRUE)
    {
        // This Should Never Happen
        FloatingTextStringOnCreature("There has been a problem with your gauntlet Token, Please speak to a DM a.s.a.p", oPC);
        return;
    }
    else if (iToken == TRUE) return;
    else
    {
        // Set Token Variable On The Recall Stone
        SetLocalInt(oRecall, "GAUNTLET_TOKEN", TRUE);
        // Give Player Token
        CreateItemOnObject("gauntlet_token", oPC);
        // Display Message To player
        FloatingTextStringOnCreature("You have recieved a token", oPC);
    }
}
