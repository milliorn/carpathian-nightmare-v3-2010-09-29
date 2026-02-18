//:://////////////////////////////////////////////////
//:: NW_C2_DEFAULT9
#include "x0_i0_anims"
// #include "x0_i0_walkway" - in x0_i0_anims
//#include "x0_i0_treasure"
#include "x2_inc_switches"

void main()
{
    SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    SetListeningPatterns();
    WalkWayPoints();
    DelayCommand(2.0, ActionCastSpellAtObject(SPELL_TRUE_SEEING, OBJECT_SELF, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    DelayCommand(2.0, ExecuteScript("acn_npc_despawn", OBJECT_SELF));
    DelayCommand(6.0, SetPlotFlag(OBJECT_SELF, FALSE));
}
