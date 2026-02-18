void main()
{
    object  oPC = GetFirstPC(),
            oModule = GetModule(),
            oTarget = GetLastUsedBy();
    location lVis = GetLocation(oPC);
    string sName1 = GetName(oTarget);

    {
        while(GetIsObjectValid(oPC))
        {
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_METEOR_SWARM), lVis);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_FIRESTORM), lVis);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SCREEN_SHAKE), lVis);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_SCREEN_BUMP), lVis);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_NATURES_BALANCE), lVis);
            ApplyEffectAtLocation(DURATION_TYPE_TEMPORARY, EffectVisualEffect(VFX_FNF_STRIKE_HOLY), lVis);
            PlaySound("as_sw_x2gong1");
            DelayCommand(2.0, PlaySound("as_sw_x2gong2"));
            DelayCommand(3.0, PlaySound("as_sw_x2gong3"));
            DelayCommand(4.0, AssignCommand(oPC, PlaySound("vs_nx2mephm_107")));

            ExportSingleCharacter(oPC);

            oPC = GetNextPC();
        }

        SetLocalInt(oModule, "STOP_BANK", 1);
        ExportAllCharacters();
        ExecuteScript("acn_shifter", oPC);
        SpeakString( "All characters have been saved by auto-reboot script.", TALKVOLUME_SHOUT);

        WriteTimestampedLogEntry(sName1+
        " has activated SERVER RESET!!!Account: "
        + GetPCPlayerName( oTarget )+ " CD Key: "
        + GetPCPublicCDKey( oTarget )+ " IP: "
        + GetPCIPAddress( oTarget ));

        SpeakString(sName1+
        " has activated SERVER RESET!!!Account: "
        + GetPCPlayerName( oTarget )+ " CD Key: "
        + GetPCPublicCDKey( oTarget ), TALKVOLUME_SHOUT);

        DelayCommand(1.0,  SpeakString(" SERVER RESET IN <cσσσ>60</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(10.0, SpeakString(" SERVER RESET IN <cσσσ>50</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(20.0, SpeakString(" SERVER RESET IN <cσσσ>40</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(30.0, SpeakString(" SERVER RESET IN <cσσσ>30</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(40.0, SpeakString(" SERVER RESET IN <cσσσ>20</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(50.0, SpeakString(" SERVER RESET IN <cσσσ>10</c> SECONDS!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(59.0, SpeakString(" <cσ  >SERVER RESET!!!!!",TALKVOLUME_SHOUT));
        DelayCommand(60.0, WriteTimestampedLogEntry("*****SERVER RESTART*****"));
        DelayCommand(61.0, ExecuteScript("acn_boot_server", OBJECT_SELF));
        DelayCommand(62.0, SetLocalString(GetModule(), "NWNX!RESETPLUGIN!SHUTDOWN", "1"));
        //this line is the entire nwscriptside of the reset plugin
    }
}
