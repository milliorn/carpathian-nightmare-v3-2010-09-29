//#include "x2_inc_itemprop"           // object oSkin,
void PaleMasterACNerf(object oPC, int iPMLevel)
{
    int iNerfAmount;
    switch (iPMLevel)
    {
        case 1: iNerfAmount = 1; break;
        case 2: iNerfAmount = 1; break;
        case 3: iNerfAmount = 1; break;
        case 4: iNerfAmount = 2; break;
        case 5: iNerfAmount = 2; break;
        case 6: iNerfAmount = 2; break;
        case 7: iNerfAmount = 2; break;
        case 8: iNerfAmount = 3; break;
        case 9: iNerfAmount = 3; break;
        case 10: iNerfAmount = 3; break;
        case 12: iNerfAmount = 4; break;
        case 13: iNerfAmount = 4; break;
        case 14: iNerfAmount = 4; break;
        case 15: iNerfAmount = 4; break;
        case 16: iNerfAmount = 5; break;
        case 17: iNerfAmount = 5; break;
        case 18: iNerfAmount = 5; break;
        case 19: iNerfAmount = 5; break;
        case 20: iNerfAmount = 6; break;
        case 21: iNerfAmount = 6; break;
        case 22: iNerfAmount = 6; break;
        case 23: iNerfAmount = 6; break;
        case 24: iNerfAmount = 7; break;
        case 25: iNerfAmount = 7; break;
        case 26: iNerfAmount = 7; break;
        case 27: iNerfAmount = 7; break;
        case 28: iNerfAmount = 8; break;
        case 29: iNerfAmount = 8; break;
        case 30: iNerfAmount = 8; break;
        default: iNerfAmount = 0; break;
    }
    ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectACDecrease(iNerfAmount, AC_NATURAL_BONUS, AC_VS_DAMAGE_TYPE_ALL)), oPC);
}
