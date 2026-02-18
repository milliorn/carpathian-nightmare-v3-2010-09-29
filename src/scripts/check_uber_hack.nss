#include "inc_uber_hack"

void main()
{
    if(GetIsPC(oPC) && !GetIsDM(oPC))
    {
        if(iAC > 130 ||
           iHP > 2100 ||
           iSpeed == 8 ||
           iStr > 61 ||
           iDex > 52 ||
           iWis > 50 ||
           iInt > 50 ||
           iCon > 52 ||
           iCha > 52 ||
           iFort > 76 ||
           iRefl > 78 ||
           iWill > 76 )
        {
            DelayCommand(0.1, AssignCommand(oPC, ClearAllActions()));
            DelayCommand(5.0, AssignCommand(oPC, ActionJumpToLocation(GetStartingLocation())));
            DelayCommand(0.5, ApplyEffectToObject(DURATION_TYPE_PERMANENT, eImmobile, oPC));
            DelayCommand(1.0, PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, ""+
            "YOU HAVE INVALID/UBER STATS!  IF YOU BELIEVE THIS IS A MISTAKE, RELOG "+
            "AN NOTIFY A DUNGEON MASTER PLEASE."));
            SpeakString(GetName(oPC)+" <cú>"+
                                GetPCPlayerName(oPC)+" <cúúú>"+
                                GetPCPublicCDKey(oPC)+"<cúú> has INVALID/UBER STATS!"
                                +"  IF YOU BELIEVE THIS IS A MISTAKE, RELOG"
                                +" AN NOTIFY A DUNGEON MASTER PLEASE.", TALKVOLUME_SHOUT);
        }
    }
}
