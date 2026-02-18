#include "x0_i0_anims"
void main()
{
    float  fVFX_Timer = IntToFloat(d6());
    string sArcherNPC = "golubacarcher";
    effect eSwarm     = EffectSwarm(TRUE, "golubac001");
    effect eVisual    = EffectVisualEffect(VFX_IMP_LIGHTNING_M);
    object oArcher_1  = GetWaypointByTag("NW_Golubac_1"),
           oArcher_2  = GetWaypointByTag("NW_Golubac_2"),
           oArcher_3  = GetWaypointByTag("NW_Golubac_3"),
           oArcher_4  = GetWaypointByTag("NW_Golubac_4"),
           oArcher_5  = GetWaypointByTag("NW_Golubac_5"),
           oArcher_6  = GetWaypointByTag("NW_Golubac_6"),
           oArcher_7  = GetWaypointByTag("NW_Golubac_7"),
           oArcher_8  = GetWaypointByTag("NW_Golubac_8"),
           oArcher_9  = GetWaypointByTag("NW_Golubac_9");

    SetSpawnInCondition(NW_FLAG_IMMOBILE_AMBIENT_ANIMATIONS);
    SetListeningPatterns();
    WalkWayPoints();
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eSwarm, OBJECT_SELF);

    CreateObject(OBJECT_TYPE_CREATURE, sArcherNPC, GetLocation(oArcher_1), TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, sArcherNPC, GetLocation(oArcher_2), TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, sArcherNPC, GetLocation(oArcher_3), TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, sArcherNPC, GetLocation(oArcher_4), TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, sArcherNPC, GetLocation(oArcher_5), TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, sArcherNPC, GetLocation(oArcher_6), TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, sArcherNPC, GetLocation(oArcher_7), TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, sArcherNPC, GetLocation(oArcher_8), TRUE);
    CreateObject(OBJECT_TYPE_CREATURE, sArcherNPC, GetLocation(oArcher_9), TRUE);

    DelayCommand(fVFX_Timer, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVisual, GetLocation(oArcher_1)));
    DelayCommand(fVFX_Timer + 0.1, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVisual, GetLocation(oArcher_2)));
    DelayCommand(fVFX_Timer + 0.2, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVisual, GetLocation(oArcher_3)));
    DelayCommand(fVFX_Timer + 0.3, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVisual, GetLocation(oArcher_4)));
    DelayCommand(fVFX_Timer + 0.4, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVisual, GetLocation(oArcher_5)));
    DelayCommand(fVFX_Timer + 0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVisual, GetLocation(oArcher_6)));
    DelayCommand(fVFX_Timer + 0.6, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVisual, GetLocation(oArcher_7)));
    DelayCommand(fVFX_Timer + 0.7, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVisual, GetLocation(oArcher_8)));
    DelayCommand(fVFX_Timer + 0.8, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVisual, GetLocation(oArcher_9)));
}
