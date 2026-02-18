#include "inc_wiztp_clear"

void main()
{
    int spell = GetLastSpell();
    object oCaster = GetLastSpellCaster();

    /*
    if((GetPVP(GetArea(OBJECT_SELF)) && GetIsPC(oCaster))
    {}
    */

    if((spell == SPELL_MORDENKAINENS_DISJUNCTION) ||
      (spell == SPELL_DISPEL_MAGIC) ||
      (spell == SPELL_GREATER_DISPELLING))
    {

        ClearWizTP();

        DeleteLocalObject(OBJECT_SELF,"wizTP");
        DeleteLocalObject(OBJECT_SELF,"wizTPOwner");
        DestroyObject(OBJECT_SELF);
    }

    return;
}
