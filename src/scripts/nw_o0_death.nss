// Player OnDeath
#include "raise_inc"
void main()
{
    object oPlayer = GetLastPlayerDied(),
           oJail = GetItemPossessedBy(oPlayer, "jail_token");
    string sArea = GetTag(GetArea(oPlayer)),
           sKey = GetPCPublicCDKey(oPlayer);
    SetFactionsFriendly(oPlayer);

    if (sArea =="Arena" || sArea == "Jail" || sArea == "AstralPlane" ||
        sArea == "Home" || sArea == "CarpathianChristmas")
    {
        DelayCommand(1.0, Raise(oPlayer));
    }

    if (GetIsObjectValid(oJail))
    {
        return;
    }

    else if (sArea =="Arena")
    {
        return;
    }

    else
    {
         DelayCommand(2.5, PopUpDeathGUIPanel(oPlayer, TRUE, TRUE, 0, "Respawning will lose you 100xp per character level and 15% of your total gold with a maximum of 15,000 gp"));
    }
}
