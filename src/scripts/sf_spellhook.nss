//::///////////////////////////////////////////////
//:: Scarface's No PvP Exploit Fixes
//:: sf_spellhook
//:://////////////////////////////////////////////
/*
     Spell hooking script to stop casting
     of spells/scrolls in certain areas.

     Written By Scarface
     Additions by Milliorn
*/
//:://////////////////////////////////////////////

#include "x2_inc_switches"

int SummonCheck(object oCaster, int nID)
{
        if(nID == SPELL_ANIMATE_DEAD ||
           nID == SPELL_CONTROL_UNDEAD ||
           nID == SPELL_CREATE_GREATER_UNDEAD ||
           nID == SPELL_CREATE_UNDEAD ||
           nID == SPELL_EPIC_DRAGON_KNIGHT ||
           nID == SPELL_EPIC_MUMMY_DUST ||
           nID == SPELL_GATE ||
           nID == SPELL_GREATER_SHADOW_CONJURATION_SUMMON_SHADOW ||
           nID == SPELL_GREATER_PLANAR_BINDING ||
           nID == SPELL_LESSER_PLANAR_BINDING ||
           nID == SPELL_ELEMENTAL_SWARM ||
           nID == SPELL_ELEMENTAL_SUMMONING_ITEM ||
           nID == SPELL_GREATER_PLANAR_BINDING ||
           nID == SPELL_MORDENKAINENS_SWORD ||
           nID == SPELL_PLANAR_ALLY ||
           nID == SPELL_PLANAR_BINDING ||
           nID == SPELL_SHADES_SUMMON_SHADOW ||
           nID == SPELL_SHADOW_CONJURATION_SUMMON_SHADOW ||
           nID == SPELL_SHELGARNS_PERSISTENT_BLADE ||
           nID == SPELL_SUMMON_CREATURE_I ||
           nID == SPELL_SUMMON_CREATURE_II ||
           nID == SPELL_SUMMON_CREATURE_III ||
           nID == SPELL_SUMMON_CREATURE_IV ||
           nID == SPELL_SUMMON_CREATURE_IX ||
           nID == SPELL_SUMMON_CREATURE_V ||
           nID == SPELL_SUMMON_CREATURE_VI ||
           nID == SPELL_SUMMON_CREATURE_VII ||
           nID == SPELL_SUMMON_CREATURE_VIII ||
           nID == SPELL_SUMMON_SHADOW ||
           nID == SPELL_BLACK_BLADE_OF_DISASTER)
           return TRUE;
return FALSE;
}

void main()
{
    object    oTarget      = GetSpellTargetObject();
    object oFam = GetAssociate (ASSOCIATE_TYPE_FAMILIAR);
    object oSum = GetAssociate (ASSOCIATE_TYPE_SUMMONED);
    location  lLocal       = GetSpellTargetLocation();
    object oCaster = OBJECT_SELF;
    object oItem = GetSpellTargetObject();
    int nID = GetSpellId();
    string sSpell = IntToString(nID);
    string sAoE = IntToString(nID);
    int nTimer = GetLocalInt(oCaster, sAoE);

    if(GetBaseItemType(oItem) == BASE_ITEM_BLANK_POTION ||
       GetBaseItemType(oItem) == BASE_ITEM_BLANK_SCROLL ||
       GetBaseItemType(oItem) == BASE_ITEM_BLANK_WAND)
    {
        FloatingTextStringOnCreature("Spell used for crafting!!", oCaster);
        return;
    }

    if (oItem == GetObjectByTag("rodfastcast"))
    {
       //FloatingTextStringOnCreature("Sequencer used!!", oCaster);
        return;
    }

    if (GetLocalInt(GetArea(oCaster), "NO_CASTING"))
    {
        SetModuleOverrideSpellScriptFinished();
        FloatingTextStringOnCreature("No spellcasting allowed in this area!!", oCaster);
        return;
    }

    if (GetLocalInt(oCaster, "SEQUENCER") == TRUE)
    {
        //FloatingTextStringOnCreature("Sequencer spell casted!", oCaster);
        return;
    }

    if (nID == SPELL_ACID_FOG ||
        nID == SPELL_BLADE_BARRIER ||
        nID == SPELL_CLOUD_OF_BEWILDERMENT ||
        nID == SPELL_CLOUDKILL ||
        nID == SPELL_ENTANGLE ||
        nID == SPELL_EVARDS_BLACK_TENTACLES ||
        nID == SPELL_GREASE ||
        nID == SPELL_INCENDIARY_CLOUD ||
        nID == SPELL_STINKING_CLOUD ||
        nID == SPELL_STONEHOLD ||
        nID == SPELL_STORM_OF_VENGEANCE ||
        nID == SPELL_WALL_OF_FIRE ||
        nID == SPELL_WEB)
    {
        oTarget = GetFirstObjectInShape(SHAPE_SPHERE,20.0,lLocal,FALSE,OBJECT_TYPE_AREA_OF_EFFECT);

        while (GetIsObjectValid(oTarget))
        {
            if(GetObjectType(oTarget) == OBJECT_TYPE_AREA_OF_EFFECT)
            {
                if(oCaster  == GetAreaOfEffectCreator(oTarget))
                {
                    DestroyObject (oTarget);
                }
            }
                oTarget =GetNextObjectInShape(SHAPE_SPHERE,20.0,lLocal,FALSE,OBJECT_TYPE_AREA_OF_EFFECT);
        }
            return;
    }

    if (GetLocalInt(oCaster, sSpell) == nID)
    {
        SetModuleOverrideSpellScriptFinished();
        FloatingTextStringOnCreature("No SPAMMING SPELLS allowed!", oCaster);
        return;
    }

    if ((oTarget == OBJECT_SELF) &&
    (!GetIsObjectValid(GetSpellCastItem()))
    && (GetSpellId()!=SPELL_SHAPECHANGE)
    && (GetSpellId()!=SPELL_POLYMORPH_SELF)
    && (GetIsObjectValid(oFam)))
    {
        AssignCommand(oFam, ActionCastSpellAtObject (nID, oFam, GetMetaMagicFeat(), TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    }

    else if ((oTarget == OBJECT_SELF) &&
    (!GetIsObjectValid(GetSpellCastItem()))
    && (GetSpellId()!=SPELL_SHAPECHANGE)
    && (GetSpellId()!=SPELL_POLYMORPH_SELF)
    && (GetIsObjectValid(oSum)))
    {
        AssignCommand(oFam, ActionCastSpellAtObject (nID, oSum, GetMetaMagicFeat(), TRUE, 0, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    }

    if (SummonCheck(oCaster, nID) && GetLocalInt(oCaster, "SUMMONSPAM"))
    {
        SetModuleOverrideSpellScriptFinished();
        FloatingTextStringOnCreature("You can't summon again for 60 seconds because some people are childish and likes to abuse pulses.", oCaster, FALSE);
        return;
    }

    else if (SummonCheck(oCaster, nID) && !GetLocalInt(oCaster, "SUMMONSPAM"))
    {
        SetLocalInt(oCaster, "SUMMONSPAM", TRUE);
        DelayCommand(1.0, SetLocalInt(oCaster, "SUMMONSPAM", FALSE));
    }

    SetLocalInt(oCaster, sSpell, nID);
    DelayCommand(0.2, DeleteLocalInt(oCaster, sSpell));
}
