// Milliorn's ClientOnEnter script
#include "sfsubr_functs"
//#include "inc_guild"
#include "pw_inc_anticheat"

void main()
{
    object oPC = GetEnteringObject();
    string sCDKey = GetPCPublicCDKey(oPC),
           sIP = GetPCIPAddress(oPC),
           sLogInName = GetPCPlayerName(oPC);

    if (GetIsDM(oPC)) return;
    if (!GetIsPC(oPC)) return;

    SF_SubraceOnEnter(oPC);
//    ACNGuildVFX(oPC);
    LoadPlayerInfo(oPC);
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPC);
    SetLocalInt(oPC, "SUMMONSPAM", TRUE);
    DelayCommand(TurnsToSeconds(1), SetLocalInt(oPC, "SUMMONSPAM", FALSE));
    DelayCommand(7.0, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_TIME_STOP), GetStartingLocation()));
}



