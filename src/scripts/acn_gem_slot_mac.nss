#include "inc_acn_casino"
#include "inc_socket_gener"

void main()
{

    object oPC   = GetLastUsedBy();
    int    oGold = GetGold(oPC),
           slot = GetLocalInt(OBJECT_SELF, "slot"),
           iroll = d20();
    effect  eVfx = EffectVisualEffect(VFX_FNF_LOS_NORMAL_20, FALSE),
            eVfx1 = EffectVisualEffect(VFX_FNF_LOS_EVIL_20, FALSE);

    if (slot != 0)
    {
        return;
    }

    SetLocalInt(OBJECT_SELF, "slot", 1);

    if(oGold <= 19999)
    {
        SendMessageToPC(oPC, "<có ó>You do not have enough gold to play this slot machine.");
        DelayCommand(3.5,  SetLocalInt(OBJECT_SELF, "slot", 0));
        return;
    }
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx, GetLocation(OBJECT_SELF));
        ActionPlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        ActionPlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE); // move the lever
        AssignCommand(oPC, TakeGoldFromCreature(20000, oPC, TRUE));
        DelayCommand(3.5,  SetLocalInt(OBJECT_SELF, "slot", 0));

    if(iroll == 20)
    {
        Gem_Jackpot(oPC);
        effect  eVfx = EffectVisualEffect(VFX_FNF_LOS_HOLY_30, FALSE);
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx, GetLocation(oPC));
        SendMessageToPC(oPC, " You won <cú>Jackpot!!!");
        SendMessageToAllDMs(GetName(oPC)+" "+GetPCPublicCDKey(oPC)+"<c ó > won "+
        "the socket jackpot!!!");
        AssignCommand(oPC, TakeGoldFromCreature(20000, oPC, TRUE));
        return;
    }

    else if(iroll >= 2 && iroll <= 6)
    {
        GenerateSockets(oPC);
        AssignCommand(oPC, TakeGoldFromCreature(20000, oPC, TRUE));
        return;
    }

    else
    {
        SendMessageToPC(oPC, "<cú>You Lose!");
        ApplyEffectAtLocation(DURATION_TYPE_INSTANT, eVfx1, GetLocation(oPC));
        AssignCommand(oPC, TakeGoldFromCreature(20000, oPC, TRUE));
    }
}

