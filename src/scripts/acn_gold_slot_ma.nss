//#include "inc_acn_casino"
#include "nw_i0_plot"
void main()
{

object oPC   = GetLastUsedBy();
int    oGold = GetGold(oPC),
        slot = GetLocalInt(OBJECT_SELF, "slot"),
       iroll = d6();
effect  eVfx = EffectVisualEffect(VFX_FNF_LOS_NORMAL_20, FALSE),
       eVfx1 = EffectVisualEffect(VFX_FNF_LOS_EVIL_20, FALSE),
       eVfx2 = EffectVisualEffect(VFX_FNF_LOS_HOLY_20, FALSE);

    if (slot != 0)
    {
        return;
    }

    SetLocalInt(OBJECT_SELF, "slot", 1);

    if(oGold <= 11999)
    {
        SendMessageToPC(oPC, "<có ó>You do not have enough gold to play this slot machine.");
        DelayCommand(3.5,  SetLocalInt(OBJECT_SELF, "slot", 0));
        return;
    }

    ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx, GetLocation(OBJECT_SELF));
    ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
    ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE); // move the lever
    DelayCommand(3.5,  SetLocalInt(OBJECT_SELF, "slot", 0));

    if(iroll == 1)

    {
        GiveGoldToCreature(oPC, Random(100000));
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx2, GetLocation(OBJECT_SELF));
        SendMessageToPC(oPC, "<cú>You won!!!"); return;

    }

    else

    {
        SendMessageToPC(oPC, "<cú>You Lose!");
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx1, GetLocation(oPC));
        AssignCommand(oPC, TakeGoldFromCreature(12000, oPC, TRUE));
    }
}
