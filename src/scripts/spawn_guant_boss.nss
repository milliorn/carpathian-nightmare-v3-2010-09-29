/************************ [On Spawn] *******************************************
    Filename: j_ai_onspawn or nw_c2_default9
*/
#include "inc_name_creator"
#include "x2_inc_switches"
#include "x0_i0_anims"
void main()
{
    SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    SetListeningPatterns();
    WalkWayPoints();
    DelayCommand(2.0, ActionCastSpellAtObject(SPELL_TRUE_SEEING, OBJECT_SELF, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE));
    DelayCommand(2.0, ExecuteScript("acn_npc_despawn", OBJECT_SELF));
    effect eSwarm = EffectSwarm(TRUE, "vampiremage", "vampiremaster", "vampirepriestgau", "vampirerogue");
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSwarm, OBJECT_SELF);

}
