void main()
{
    object oPC = GetEnteringObject();
    location lPC = GetLocation(oPC);
    int nHD = GetHitDice(oPC) / 2,
        nDmg = d20(20),
        nTimer = d6(2),
        nDice = d2(),
        nRoll = Random(20) + 1;
    float fConvert = IntToFloat(nTimer);
    if (!GetIsPC(oPC) && GetIsDM(oPC))return;
    switch (nRoll)
    {
        case 1:  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBlindness(),  oPC, fConvert);return;
        case 2:  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectCharmed(),    oPC, fConvert);return;
        case 3:  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectConfused(),   oPC, fConvert);return;
        case 4:  ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCurse(),      oPC)          ;return;
        case 5:  ApplyEffectToObject(DURATION_TYPE_INSTANT,   EffectDamage(nHD),  oPC)          ;return;
        case 6:  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDarkness(),   oPC, fConvert);return;
        case 7:  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDazed(),      oPC, fConvert);return;
        case 8:  ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDeaf(),       oPC, fConvert);return;
        case 9:  ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectDeath(),      oPC, fConvert);return;
        case 10: ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectDominated(),  oPC, fConvert);return;
        case 11: ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectEntangle(),   oPC, fConvert);return;
        case 12: ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectFrightened(), oPC, fConvert);return;
        case 13: ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectKnockdown(),  oPC, fConvert);return;
        case 14: ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectParalyze(),   oPC, fConvert);return;
        case 15: ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectPetrify(),    oPC, fConvert);return;
        case 16: ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSilence(),    oPC, fConvert);return;
        case 17: ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSleep(),      oPC, fConvert);return;
        case 18: ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectSlow(),       oPC, fConvert);return;
        case 19: ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectStunned(),    oPC, fConvert);return;
        case 20: ApplyEffectToObject(DURATION_TYPE_INSTANT,   EffectDamage(nDmg), oPC)          ;return;        default: ;
        break;
    }
}


