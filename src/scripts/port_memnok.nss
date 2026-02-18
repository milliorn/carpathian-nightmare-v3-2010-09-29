void main()
{
    object oPC = GetLastUsedBy();
    location lTarget= GetLocation(GetWaypointByTag("POST_memnoklair"));
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_30), GetLocation(oPC));
    AssignCommand(oPC, ClearAllActions());
    AssignCommand(oPC, ActionJumpToLocation(lTarget));
}

