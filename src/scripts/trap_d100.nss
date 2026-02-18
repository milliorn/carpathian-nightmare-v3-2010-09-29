void main()
{
    object oUser = GetLastUsedBy();
    int iDamage = Random(999) + 1 ;
    effect eDamage = EffectDamage(iDamage);
    ApplyEffectToObject(DURATION_TYPE_INSTANT, eDamage, oUser);
    FloatingTextStringOnCreature("You sense something attacking your soul", oUser, TRUE);

}
