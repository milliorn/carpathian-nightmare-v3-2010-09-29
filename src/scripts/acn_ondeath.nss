#include "raise_inc"
#include "acn_bounty"
//#include "inc_guild"
void main()
{
object  oPlayer = GetLastPlayerDied(),
        oKiller = GetLastHostileActor(oPlayer),
        oArea  = GetArea(oPlayer),
        oRecall = GetItemPossessedBy(oPlayer, "sf_recall"),
        oRecall2 = GetItemPossessedBy(oKiller, "sf_recall");
int     iScore = GetLocalInt(oRecall2, "ACN_KILL"),
        iScore1 = GetLocalInt(oRecall2, "ACN_DEATH"),
        iBounty = GetLocalInt(oRecall, "BOUNTY"),
        iLevel1 = GetHitDice(oPlayer),
        iLevel2 = GetHitDice(oKiller);
string  sLootTag,
        sKey = GetPCPublicCDKey(oPlayer),
        sLevel1 = IntToString(iLevel1),
        sLevel2 = IntToString(iLevel2),
        sRating = CheckPCCR(oPlayer, oKiller),
        sArea = GetTag(GetArea(oPlayer)),
        sArea2 = GetName(oArea),
        sName = GetName(oPlayer),
        sName2 = GetName(oKiller);

/*    if (GetLocalInt(oPlayer, "RAID"))
    {
        object oItem = GetItemPossessedBy(oPlayer, "guild_relic");
        object oOriginalLootPile;

        //Remove the Int
        DeleteLocalInt(oPlayer, "RAID");

        switch (GetLocalInt(oItem, "RELIC"))
        {
            case 1: sLootTag = "TREASSURE_GUILD_HOUSE"; break;
            case 2: sLootTag = "TREASSURE_GUILD_TOWER"; break;
            case 3: sLootTag = "TREASSURE_GUILD_HAVEN"; break;
            case 4: sLootTag = "TREASSURE_GUILD_SANCTUARY"; break;
        }

        //Tell everyone
        SpeakString(GetName(oPlayer)+"<cÌwþ> has lost of the</c> " + GetName(oItem)
        +"<cÌwþ>.",TALKVOLUME_SHOUT);

        oOriginalLootPile = GetObjectByTag(sLootTag);
        CopyItem(oItem, oOriginalLootPile, TRUE);
        DestroyObject(oItem);

        //Remove the VFX for the Guild Loot
        effect eLoop = GetFirstEffect(oPlayer);
        while (GetIsEffectValid(eLoop))
        {
            if(GetEffectType(eLoop) == EFFECT_TYPE_VISUALEFFECT)
            RemoveEffect(oPlayer, eLoop);
            eLoop=GetNextEffect(oPlayer);
        }

        //Put the Guild Aura back
       //ACNGuildVFX(oPlayer);

        //Plus the normal death
        ExecuteScript("sf_bounty", OBJECT_SELF);
        DelayCommand(0.5, ExecuteScript("nw_o0_death", OBJECT_SELF));
        DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), OBJECT_SELF));
        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE), OBJECT_SELF));
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH_L), OBJECT_SELF));
    }
*/
    if (sArea == "Arena")
    {
        //Send the 2 PC's a message
        DelayCommand(1.0,FloatingTextStringOnCreature("You Win", oKiller));
        DelayCommand(1.0,FloatingTextStringOnCreature("You Lose", oPlayer));

        //Shout server Arena message
        SpeakString("<cúú>"+sName+"</c> lost a duel to <cúú>" +sName2+
        "</c> in the <có ó>Arena</c>", TALKVOLUME_SHOUT);
        AssignCommand(oKiller, ClearAllActions(TRUE));
        Raise(oPlayer);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPlayer);
        return;
    }

    else if (sArea == "Jail"        ||
             sArea == "AstralPlane" ||
             sArea == "Home"        ||
             sArea == "Hell"        ||
             sArea == "CarpathianChristmas")
    {
        AssignCommand(oKiller, ClearAllActions(TRUE));
        Raise(oPlayer);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPlayer);
        return;
    }

    else if (sArea == "GladiatorPit")
    {
        AssignCommand(oKiller, ClearAllActions());
        AssignCommand(oPlayer, ClearAllActions());
        AssignCommand(oKiller, JumpToLocation(GetLocation(GetWaypointByTag("WP_PIT_WINNER"))));
        AssignCommand(oPlayer, JumpToLocation(GetLocation(GetWaypointByTag("WP_PIT_LOSER"))));
        Raise(oPlayer);
        ApplyEffectToObject(DURATION_TYPE_PERMANENT, SupernaturalEffect(EffectHaste()), oPlayer);
        DelayCommand(1.0,FloatingTextStringOnCreature("<cú>You Win!</c>", oKiller));
        DelayCommand(1.0,FloatingTextStringOnCreature("<cú>You Lose</c>", oPlayer));
        SpeakString("<cúú>"+sName+"</c> was defeated by <cúú>" +sName2+
        "</c> in the <cddÈ>Gladiator Ring</c>", TALKVOLUME_SHOUT);
        return;
    }

    else
    {
        ExecuteScript("sf_bounty", OBJECT_SELF);
        DelayCommand(0.5, ExecuteScript("nw_o0_death", OBJECT_SELF));
        DelayCommand(0.1, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), OBJECT_SELF));
        DelayCommand(0.2, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE), OBJECT_SELF));
        DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_DEATH_L), OBJECT_SELF));
    }
}
