void main()
{
    object oPC = GetEnteringObject(),
           oTarget = GetWaypointByTag("NW_DEATH_TEMPLE"),
           oModule = GetModule();
    string sPC1 = GetName(oPC, FALSE),
           sPC2 = GetPCPublicCDKey(oPC, FALSE),
           sPC3 = GetPCPlayerName(oPC);
    int    iDice = d6(),
           iReward = Random(10000),
           iRecord = StringToInt(sPC1);

    if (!GetIsPC(oPC) || GetIsDM(oPC)) return;
    else if (GetLocalInt(oModule, "GOD_REWARD") == iRecord) return;
    else

        SetLocalInt(oModule, "GOD_REWARD", iRecord);

        if (iDice == 6)
        {
            if (iReward <= 1000) iReward = 1000;
            GiveGoldToCreature(oPC, iReward);
            GiveXPToCreature(oPC, iReward);
            DelayCommand(IntToFloat(d6()), ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_MYSTICAL_EXPLOSION), oTarget));
            DelayCommand(IntToFloat(d6()), ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_CESSATE_NEGATIVE), oTarget));
            FloatingTextStringOnCreature("<có ó>GP/XP REWARD FROM THE GODS OF CARPATHIA", oPC, TRUE);
            SpeakString("Player: "+sPC1+" Account: "+sPC3+" CD Key: "+sPC2+
            " was granted "+ IntToString(iReward) + " XP/GP from the Carpathian Gods!", TALKVOLUME_SHOUT);
        }
}
