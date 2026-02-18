#include "sfsubr_functs"
#include "pw_inc_anticheat"
void main()
{
    object oPC = GetExitingObject();
    object oModule = GetModule();
    int nHP = GetCurrentHitPoints(oPC);
    int nPCT = (nHP * 100) / GetMaxHitPoints(oPC);

    ExecuteScript("fky_chat_clexit", OBJECT_SELF);
    ExecuteScript("hgll_client_exit", OBJECT_SELF);
    SF_SubraceOnExit(oPC);
    StorePlayerInfo(oPC);

    if (nPCT<10 && GetIsInCombat(oPC))
    { // Less than 10% Hitpoints, Consider a Death Log
        object oAttacker = GetLastHostileActor(oPC);
        effect eDam = EffectDamage(nHP+20, DAMAGE_TYPE_MAGICAL, DAMAGE_POWER_PLUS_TWENTY);
        string sMsg = GetName(oAttacker, TRUE) + " <có  >autokilled <cfÌþ>"+GetName(oPC)+
        "<có  > for possible deathlog while in </c>COMBAT"+
        "<có  > with less than </c>10% HP!";
        SpeakString(sMsg, TALKVOLUME_SHOUT);
        AssignCommand(oAttacker, ApplyEffectToObject(DURATION_TYPE_INSTANT, eDam, oPC));
        return;
    }

    else if (!GetIsDM(oPC))
    {
        SpeakString("<có  >"+GetName(oPC)+ "</c> has logged out", TALKVOLUME_SHOUT);
    }
}
