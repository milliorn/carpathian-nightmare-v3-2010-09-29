//Put this script OnClose
void main()
{
    DelayCommand(0.1,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_CRT_RED), GetLocation(OBJECT_SELF)));
    DelayCommand(0.3,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_LRG_RED), GetLocation(OBJECT_SELF)));
    DelayCommand(0.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_REG_RED), GetLocation(OBJECT_SELF)));
    DelayCommand(0.7,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_BONE_MEDIUM), GetLocation(OBJECT_SELF)));
    DelayCommand(0.9,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE), GetLocation(OBJECT_SELF)));
    DelayCommand(1.1,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_BALLISTA), GetLocation(OBJECT_SELF)));
    DelayCommand(1.3,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_STONE_MEDIUM), GetLocation(OBJECT_SELF)));
    DelayCommand(1.5,ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DESTRUCTION), GetLocation(OBJECT_SELF)));
}

