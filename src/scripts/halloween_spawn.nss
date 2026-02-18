void main()
{
    AssignCommand(OBJECT_SELF, ActionSit(GetObjectByTag("deaths_throne")));
    DelayCommand(10.0, ApplyEffectToObject(DURATION_TYPE_PERMANENT, EffectCutsceneImmobilize(), OBJECT_SELF));
}
