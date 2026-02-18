//::///////////////////////////////////////////////
//:: Anti Hacker OnEnter Script
//:: hacker_check
//:://////////////////////////////////////////////
//#include "sf_hack_inc"
string sGUI(int iInt)
{
    string sMsg;
    if (iInt == 1)      sMsg = "Invalid Character Name - Character name" +
                               " length must contain less than 32 letters";
    else if (iInt == 2) sMsg = "Invalid Character Name - Character name must" +
                               " contain more than 3 letters";
    else if (iInt == 3) sMsg = "Invalid Character Name" +
                               " - Character name must NOT contain 2 or more" +
                               " consecutive spaces";
    else if (iInt == 4) sMsg = "Invalid Character Name" +
                               " - The first 3 letters in your character name" +
                               " must NOT contain spaces";
    else                sMsg = "Invalid Character Name" +
                               " - Character name can only contain standard" +
                               " alphanumeric letters";
    return sMsg;
}
void main()
{
    object oPC = GetEnteringObject();
    string sName = GetName(oPC),
           sKey = GetPCPublicCDKey(oPC);
    int iInvalid = GetLocalInt(oPC, "INVALID_CHARACTER");

    if (!GetIsPC(oPC) || GetIsDM(oPC)) return;

    if (iInvalid != FALSE)
    {

        SpeakString(sName + " Has an invalid character name", TALKVOLUME_SHOUT);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,  EffectBlindness(), oPC);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT,  EffectCutsceneImmobilize(), oPC);
        PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, sGUI(iInvalid));
        return;
    }

/*    if (GetHitDice(oPC) == 1)
    {
        if (CombinedAbilityPoints(oPC) <= COMBINED_ABILITY_POINTS_MAX)
        {
            SpeakString("Player: " + sName + "<cú> Score Check Passed", TALKVOLUME_SHOUT);
            SendMessageToPC(oPC,"<cú>Score Check Passed");
            return;
        }

        else

            SpeakString("Player: " + sName + " <cú>Score Check FAILED!!! - CD KEY = " + sKey, TALKVOLUME_SHOUT);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBlindness(), oPC, 5.0);
            ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCutsceneImmobilize(), oPC, 5.0);
            PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, "<cú>Invalid Ability Score");
            DelayCommand(10.0, AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("WP_HACKER")))));
*/
    //}
}

