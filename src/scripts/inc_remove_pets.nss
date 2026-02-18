//Remove Pets Onspawn casted by Spells
void RemovePetsOnSpawn(object oPC);
void RemovePetsOnSpawn(object oPC)
{
    if(GetHasSpell(SPELL_STORM_OF_VENGEANCE, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_STORM_OF_VENGEANCE);
    }

    if(GetHasSpell(SPELL_SUMMON_CREATURE_I, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SUMMON_CREATURE_I);
    }

    if(GetHasSpell(SPELL_SUMMON_CREATURE_II, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SUMMON_CREATURE_II);
    }

    if(GetHasSpell(SPELL_SUMMON_CREATURE_III, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SUMMON_CREATURE_III);
    }

    if(GetHasSpell(SPELL_SUMMON_CREATURE_IV, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SUMMON_CREATURE_IV);
    }

    if(GetHasSpell(SPELL_SUMMON_CREATURE_V, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SUMMON_CREATURE_V);
    }

    if(GetHasSpell(SPELL_SUMMON_CREATURE_VI, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SUMMON_CREATURE_VI);
    }

    if(GetHasSpell(SPELL_SUMMON_CREATURE_VII, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SUMMON_CREATURE_VII);
    }

    if(GetHasSpell(SPELL_SUMMON_CREATURE_VIII, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SUMMON_CREATURE_VIII);
    }

    if(GetHasSpell(SPELL_SUMMON_CREATURE_IX, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SUMMON_CREATURE_IX);
    }

    if(GetHasSpell(SPELL_SUMMON_SHADOW, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SUMMON_SHADOW);
    }

    if(GetHasSpell(SPELL_SHADES_SUMMON_SHADOW, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SHADES_SUMMON_SHADOW);
    }

    if(GetHasSpell(SPELL_SHADOW_CONJURATION_SUMMON_SHADOW, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, SPELL_SHADOW_CONJURATION_SUMMON_SHADOW);
    }

    if(GetHasFeat(FEAT_SUMMON_FAMILIAR, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, FEAT_SUMMON_FAMILIAR);
    }

    if(GetHasFeat(FEAT_SUMMON_GREATER_UNDEAD, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, FEAT_SUMMON_GREATER_UNDEAD);
    }

    if(GetHasFeat(FEAT_SUMMON_SHADOW, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, FEAT_SUMMON_SHADOW);
    }

    if(GetHasFeat(FEAT_SUMMON_UNDEAD, OBJECT_SELF))
    {
        DecrementRemainingSpellUses(OBJECT_SELF, FEAT_SUMMON_UNDEAD);
    }
}
/*
void main(){}
