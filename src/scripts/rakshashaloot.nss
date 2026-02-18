void main()
{
    object oPC = GetLastOpenedBy(),
    oLastOpened = OBJECT_SELF;
    ActionCastSpellAtObject(SPELL_HORRID_WILTING, oPC, METAMAGIC_MAXIMIZE, TRUE, 40, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
    ExecuteScript("acn_spawn_loot", oLastOpened);
}
