#include "inc_colour"
void main()
{
    object oPC = GetLastUsedBy();
    object oModule = GetModule();
    string sPlayer = GetName(oPC);
    string sKey = GetPCPublicCDKey(oPC);
    int iLevel = GetHitDice(oPC);

    if (GetLocalString(oModule, sPlayer) == sKey)
    {
        FloatingTextStringOnCreature("<c ó >Anti Spamming Code - <cóóó>", oPC);
        SendMessageToPC(oPC, "<c ó >Anti Spamming Code - <cóóó>");
        SendMessageToAllDMs("<cþf >(Magic Mushroom) Anti Spamming Code fired on </c>"+ sPlayer);
    }

    else if (iLevel <= 20)
    {
        ActionCastSpellAtObject(SPELL_AURA_OF_VITALITY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_CAMOFLAGE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_CLAIRAUDIENCE_AND_CLAIRVOYANCE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_CLARITY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_DARKVISION, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_DISPLACEMENT, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_GHOSTLY_VISAGE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_BULLS_STRENGTH, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_CATS_GRACE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_EAGLE_SPLEDOR, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_ENDURANCE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_FOXS_CUNNING, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_OWLS_WISDOM, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_STONESKIN, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_INVISIBILITY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_SPELL_RESISTANCE, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_SEE_INVISIBILITY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_SANCTUARY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_DARKFIRE, oPC, TRUE);

        SetLocalString(oModule, sPlayer, sKey);
        DelayCommand(6.0, DeleteLocalString(oModule, sPlayer));
        return;
    }

    else
    {
        ActionCastSpellAtObject(SPELL_SANCTUARY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_SEE_INVISIBILITY, oPC, TRUE);
        ActionCastSpellAtObject(SPELL_CLARITY, oPC, TRUE);
        SetLocalString(oModule, sPlayer, sKey);
        DelayCommand(6.0, DeleteLocalString(oModule, sPlayer));
    }
}


