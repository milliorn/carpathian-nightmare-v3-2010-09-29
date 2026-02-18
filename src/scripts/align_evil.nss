#include "dm_inc_forge"
void main()
{
    object oPC = GetPCSpeaker();

    if (!GetHasTokens(oPC, 5))
    {
        SpeakString("You do not have enough Gil to use this feature.");
        return;
    }

    else if (GetHasTokens(oPC, 5))
    {
        GetTokens(oPC, 5);
    }

    AdjustAlignment(oPC, ALIGNMENT_EVIL, 100, FALSE);
    SpeakString("You have shifted alignment - Evil");
}
