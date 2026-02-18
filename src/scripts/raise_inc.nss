// Heal PC
void FakeRestore(object oTarget);

void FakeRestore(object oTarget)
{
    effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION_GREATER);

    effect eBad = GetFirstEffect(oTarget);
    //Search for negative effects
    while(GetIsEffectValid(eBad))
    {
        if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
            GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
            GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
            GetEffectType(eBad) == EFFECT_TYPE_CURSE ||
            GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
            GetEffectType(eBad) == EFFECT_TYPE_POISON ||
            GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
            GetEffectType(eBad) == EFFECT_TYPE_DARKNESS ||
            GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
            GetEffectType(eBad) == EFFECT_TYPE_DISEASE ||
            GetEffectType(eBad) == EFFECT_TYPE_POLYMORPH ||
            GetEffectType(eBad) == EFFECT_TYPE_SILENCE ||
            GetEffectType(eBad) == EFFECT_TYPE_SLOW ||
            GetEffectType(eBad) == EFFECT_TYPE_SPELLLEVELABSORPTION ||
            GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
        {
            //Remove effect if it is negative.
            RemoveEffect(oTarget, eBad);
        }
        eBad = GetNextEffect(oTarget);
    }
    if(GetRacialType(oTarget) != RACIAL_TYPE_UNDEAD)
    {
        //Apply the VFX impact and effects
        int nHeal = GetMaxHitPoints(oTarget);
        effect eHeal = EffectHeal(nHeal);

        if(nHeal<1) nHeal=1;
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eHeal, oTarget);
    }
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oTarget);
}

// * Applies an XP and GP penalty
// * to the player respawning
void ApplyPenalty(object oDead);

void ApplyPenalty(object oDead)
{
    object oBag, oGrave;
    int nGoldToTake = GetGold(oDead)/15, // 15%
        nXP, nPenalty, nHD, nMin, nNewXP;
    float fX = IntToFloat(d100() - 50) / 20.0,
          fY = IntToFloat(d100() - 50) / 20.0;
    location lLocation = GetLocation(oDead);
    vector vRandom = (GetPositionFromLocation(lLocation) + Vector(fX, fY));
    string sName = GetName(oDead);

    // * a cap of 15000gp taken from you
    if (nGoldToTake > 15000)
    {
        nGoldToTake = 15000;
    }


    lLocation = Location(GetArea(oDead), vRandom, GetFacing(oDead));
    oBag = CreateObject(OBJECT_TYPE_PLACEABLE, "bagofgold", lLocation);
    AssignCommand(oBag, TakeGoldFromCreature(nGoldToTake, oDead, TRUE));
    SetName(oBag, "<cúúú>"+sName+"<cúú> Pile of Gold");
    SetLocalInt(oBag, "gold", nGoldToTake);
    DelayCommand(900.0, DestroyObject(oBag));

    nXP = GetXP(oDead);
    nPenalty = 100 * GetHitDice(oDead);
    nHD = GetHitDice(oDead);
    // * You can not lose a level with this respawning
    nMin = ((nHD * (nHD - 1)) / 2) * 1000;
    nNewXP = nXP - nPenalty;
    if (nNewXP < nMin)
       nNewXP = nMin + 1;
    SetXP(oDead, nNewXP);
    lLocation = GetLocation(oDead);
    oGrave = CreateObject(OBJECT_TYPE_PLACEABLE, "headstone001", lLocation);
    SetName(oGrave, "<cúúú>"+sName+"<cú> Rotting Corpse");
    SetLocalInt (oGrave,"xp_dropped", nPenalty);
    SetLocalString(oGrave, "NAME", sName);
    DelayCommand(900.0, DestroyObject(oGrave));
    DelayCommand(4.0, FloatingTextStrRefOnCreature(58299, oDead, FALSE));
    DelayCommand(4.8, FloatingTextStrRefOnCreature(58300, oDead, FALSE));
}


void SetFactionsFriendly(object oPlayer)
{
    // * make friendly to Each of the 3 common factions
    AssignCommand(oPlayer, ClearAllActions());

    // * Note: waiting for Sophia to make SetStandardFactionReptuation to clear all personal reputation
    if (GetStandardFactionReputation(STANDARD_FACTION_COMMONER, oPlayer) <= 10)
    {
        SetStandardFactionReputation(STANDARD_FACTION_COMMONER, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_MERCHANT, oPlayer) <= 10)
    {
        SetStandardFactionReputation(STANDARD_FACTION_MERCHANT, 80, oPlayer);
    }
    if (GetStandardFactionReputation(STANDARD_FACTION_DEFENDER, oPlayer) <= 10)
    {
        SetStandardFactionReputation(STANDARD_FACTION_DEFENDER, 80, oPlayer);
    }
}
void Raise(object oPlayer)
{
        effect eVisual = EffectVisualEffect(VFX_IMP_RESTORATION),
               eBad = GetFirstEffect(oPlayer);

        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectResurrection(),oPlayer);
        ApplyEffectToObject(DURATION_TYPE_INSTANT,EffectHeal(GetMaxHitPoints(oPlayer)), oPlayer);

        //Search for negative effects
        while(GetIsEffectValid(eBad))
        {
            if (GetEffectType(eBad) == EFFECT_TYPE_ABILITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_AC_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_ATTACK_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_DAMAGE_IMMUNITY_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SAVING_THROW_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SPELL_RESISTANCE_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_SKILL_DECREASE ||
                GetEffectType(eBad) == EFFECT_TYPE_BLINDNESS ||
                GetEffectType(eBad) == EFFECT_TYPE_DEAF ||
                GetEffectType(eBad) == EFFECT_TYPE_PARALYZE ||
                GetEffectType(eBad) == EFFECT_TYPE_NEGATIVELEVEL)
                {
                    //Remove effect if it is negative.
                    RemoveEffect(oPlayer, eBad);
                }
            eBad = GetNextEffect(oPlayer);
        }
        //Fire cast spell at event for the specified target
        SignalEvent(oPlayer, EventSpellCastAt(OBJECT_SELF, SPELL_RESTORATION, FALSE));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, eVisual, oPlayer);
}
