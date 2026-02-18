#include "nwnx_realtime"
// Script:  moduleheartbeat
// Use:     This script runs every few seconds in the module, does EVERYTHING
// By:      Elwoodini
// Updated: Milliorn

void main()
{
    object oPC = GetFirstPC(),
           oModule = GetModule();
    location lVis = GetLocation(oPC);

    if (GetLocalInt(oModule, "START_RESET") == TRUE) return;

    if ( GetServerUpSeconds() >= 60 &&  GetServerUpSeconds() <= 66)
    {
        SpeakString("<cÌwþ>Server re-start sequence will" +
        " begin in<có ó> 6<cÌwþ> hours.",TALKVOLUME_SHOUT);
        return;
    }

    else if ( GetServerUpSeconds() >= 3600 &&  GetServerUpSeconds() <= 3606)
    {
        SpeakString("<cÌwþ>Server re-start sequence will" +
        " begin in<có ó> 5<cÌwþ> hours.  Boss Camping Script Purged!" +
        "<có  > Market <cóóó>items have been </c>purged", TALKVOLUME_SHOUT);
        ExecuteScript("acn_pawn_shop", OBJECT_SELF);
        return;
    }

    else if ( GetServerUpSeconds() >= 7200 &&  GetServerUpSeconds() <= 7206)
    {
        SpeakString("<cÌwþ>Server re-start sequence will" +
        " begin in<có ó> 4<cÌwþ> hours.  Boss Camping Script Purged!" +
        "<có  > Market <cóóó>items have been </c>purged", TALKVOLUME_SHOUT);
        ExecuteScript("acn_pawn_shop", OBJECT_SELF);
        return;
    }

    else if ( GetServerUpSeconds() >= 10800 &&  GetServerUpSeconds() <= 10806)
    {
        SpeakString("<cÌwþ>Server re-start sequence will" +
        " begin in<có ó> 3<cÌwþ> hours.  Boss Camping Script Purged!" +
        "<có  > Market <cóóó>items have been </c>purged", TALKVOLUME_SHOUT);
        ExecuteScript("acn_pawn_shop", OBJECT_SELF);
        return;
    }

    else if ( GetServerUpSeconds() >= 14440 &&  GetServerUpSeconds() <= 14446)
    {
        SpeakString("<cÌwþ>Server re-start sequence will" +
        " begin in<có ó> 2<cÌwþ> hour.  Boss Camping Script Purged!" +
        "<có  > Market <cóóó>items have been </c>purged", TALKVOLUME_SHOUT);
        ExecuteScript("acn_pawn_shop", OBJECT_SELF);
        return;
    }
    else if ( GetServerUpSeconds() >= 18000 &&  GetServerUpSeconds() <= 18006)
    {
        SpeakString("<cÌwþ>Server re-start sequence will" +
        " begin in<có ó> 1<cÌwþ> hour.  Boss Camping Script Purged!" +
        "<có  > Market <cóóó>items have been </c>purged", TALKVOLUME_SHOUT);
        ExecuteScript("acn_pawn_shop", OBJECT_SELF);
        return;
    }


    else if ( GetServerUpSeconds() >= 21300 &&  GetServerUpSeconds() <= 21306)
    {
        SpeakString("<cÌwþ>Server re-start sequence will" +
        " begin in<có ó> 5<cÌwþ> minute.", TALKVOLUME_SHOUT);
        return;
    }

    else if ( GetServerUpSeconds() >= 21480 &&  GetServerUpSeconds() <= 21486)
    {
        SpeakString("<cÌwþ>Server re-start sequence will" +
        " begin in<có ó> 2<cÌwþ> minute.", TALKVOLUME_SHOUT);
        return;
    }

    else if ( GetServerUpSeconds() >= 21540 &&  GetServerUpSeconds() <= 21546)
    {
        SpeakString("<cÌwþ>Server re-start sequence will" +
        " begin in<có ó> 1<cÌwþ> minute.", TALKVOLUME_SHOUT);
        return;
    }

    else if ( GetServerUpSeconds() > 21600) // 12 hours  720.0 MINS 7200  2000  2400
    {
        while(GetIsObjectValid(oPC))
        {
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), lVis);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), lVis);
            PlaySound("as_sw_x2gong1");
            DelayCommand(1.0, PlaySound("as_sw_x2gong2"));
            DelayCommand(2.0, PlaySound("as_sw_x2gong3"));
            DelayCommand(3.0, AssignCommand(oPC, PlaySound("vs_nx2mephm_107")));
            oPC = GetNextPC();
        }

        SetLocalInt(oModule, "START_RESET", TRUE);
        SetLocalInt(oModule, "STOP_BANK", 1);
        SpeakString("<có  >Server re-start sequence has begun.",TALKVOLUME_SHOUT);
        DelayCommand(1.0, SpeakString(
        " SERVER RESET IN <cóóó>60</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(10.0, SpeakString(
        " SERVER RESET IN <cóóó>50</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(20.0, SpeakString(
        " SERVER RESET IN <cóóó>40</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(30.0, SpeakString(
        " SERVER RESET IN <cóóó>30</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(40.0, SpeakString(
        " SERVER RESET IN <cóóó>20</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(50.0, SpeakString(
        " SERVER RESET IN <cóóó>10</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(59.0, SpeakString(
        " <có  >SERVER RESET!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(60.0, WriteTimestampedLogEntry(
        "*****SERVER RESTART*****"));
        DelayCommand(61.0, ExecuteScript(
        "acn_shifter", OBJECT_SELF));
        DelayCommand(62.0, ExecuteScript(
        "acn_boot_server", OBJECT_SELF));
        DelayCommand(65.0, SetLocalString(
        GetModule(), "NWNX!RESETPLUGIN!SHUTDOWN", "1"));
        //this line is the entire nwscriptside of the reset plugin
    }
}


