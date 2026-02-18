#include "nw_i0_plot"
void main()
{
    object oPC = GetPCSpeaker();
    object oSoul = GetItemPossessedBy(oPC, "item005");
    object oItem = GetFirstItemInInventory(oPC);

    if (GetIsObjectValid(oSoul) == FALSE)
    {
        SendMessageToAllDMs(GetName(oPC) + "<cþf > could be cheating Koschei");
        ActionStartConversation(oPC);
        return;
    }

    else
    {
        while (GetIsObjectValid(oItem) == TRUE)
        {
            if (oItem == oSoul)
            {
                DestroyObject(oItem);
            }

            oItem = GetNextItemInInventory(oPC);
        }
    }
            CreateItemOnObject("koscheikey", oPC);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), OBJECT_SELF);
            ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_HIT_NEGATIVE), OBJECT_SELF);
            DestroyObject(OBJECT_SELF, 3.0);
}
