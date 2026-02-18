// Milliorn's Recall Stone
#include "x2_inc_switches"
void CheckIsInBattle(object oPC, int iTimer, vector vLoc);
void main()
{
    int nEvent =GetUserDefinedItemEventNumber();

    if (nEvent ==  X2_ITEM_EVENT_ACTIVATE)
    {
        // Vars
        object oPC = GetItemActivator();
        string sArea = GetTag(GetArea(oPC));
        vector vLoc = GetPositionFromLocation(GetLocation(oPC));

        if (sArea == "Jail" || sArea == "HackersRealm" || sArea == "AstralPlane" ||
            sArea == "punishment" || sArea == "XPGPItemBank" ||
            sArea == "SubraceVerificationRoom" || sArea == "Hell" || GetLocalInt(GetArea(oPC), "NO_PORTALS"))
        {
            FloatingTextStringOnCreature("You cannot teleport from within this area!!", oPC);
        }
    else
        {
            if (GetIsInCombat(oPC))
            {
                FloatingTextStringOnCreature("You cannot teleport while in battle", oPC);
            }
            else
            {

                CheckIsInBattle(oPC, 3, vLoc);
            }
        }
    }
}

void CheckIsInBattle(object oPC, int iTimer, vector vLoc)
{
    FloatingTextStringOnCreature(IntToString(iTimer), oPC);
    //ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION), oPC);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_DUR_PARALYZE_HOLD),oPC);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_PWKILL), oPC);
//      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SUMMON_MONSTER_3),oPC);
      ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_S), oPC);
    if (GetIsInCombat(oPC) || GetPositionFromLocation(GetLocation(oPC)) != vLoc)


    {
        FloatingTextStringOnCreature("Teleport cancelled!", oPC);
        return;
    }
    if (iTimer <= 0)
    {
        location lLoc = GetLocation(GetWaypointByTag("NW_DEATH_TEMPLE"));
        DelayCommand(1.0,AssignCommand(oPC, JumpToLocation(lLoc)));
        ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_ELECTRIC_EXPLOSION), oPC);
        return;
    }
    iTimer--;
    DelayCommand(1.0, CheckIsInBattle(oPC, iTimer, vLoc));
}
