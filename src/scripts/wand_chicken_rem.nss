//  Un-Penguin Player
#include "penguin_inc"
void main()
{
    ActionCastSpellAtObject(SPELL_REMOVE_PARALYSIS, oTarget, METAMAGIC_EMPOWER, TRUE, 50, PROJECTILE_PATH_TYPE_DEFAULT, TRUE);
    ForceRest(oTarget);
}
