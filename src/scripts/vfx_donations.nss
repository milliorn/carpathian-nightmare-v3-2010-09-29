//Put this script OnOpen
void main()
{
    object oPC = GetLastOpenedBy(),
           oTarget = OBJECT_SELF;
    if (!GetIsPC(oPC)) return;
    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_GAS_EXPLOSION_FIRE), GetLocation(oTarget));
    DelayCommand(0.5, ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_SMOKE_PUFF), GetLocation(oTarget)));
}

