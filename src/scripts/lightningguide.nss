void main()
{
    object oTarget = GetLastUsedBy(),
           oCaster = OBJECT_SELF;

    if (GetIsPC(oTarget))
    {
        AssignCommand(oCaster, ActionCastSpellAtObject(SPELL_CALL_LIGHTNING, oTarget, METAMAGIC_MAXIMIZE, TRUE, 15, PROJECTILE_PATH_TYPE_DEFAULT));

    }
}
