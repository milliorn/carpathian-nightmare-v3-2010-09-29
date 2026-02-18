#include "jail_timer"
//#include "inc_guild"
void main()
{
    object oPC = GetEnteringObject(), oItem;
    string sName = GetName(oPC);
    object oOriginalLootPile;
    string sLootTag;

    if (GetIsDM(oPC)) return;
    if (!GetIsPC(oPC)) return;

    //Stop any attacking set up in other areas
    AssignCommand(oPC, ClearAllActions(TRUE));

    //Jail if you have a token
    if (GetIsObjectValid(GetItemPossessedBy(oPC, "jail_token")))
    {
        AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(2.0, JailPlayer(oPC));
    }

    //Jail if you have a Guild Relic
/*    else if (GetIsObjectValid(GetItemPossessedBy(oPC, "guild_relic")))
    {
        oItem = GetItemPossessedBy(oPC, "guild_relic");

        //Remove the Int
        DeleteLocalInt(oPC, "RAID");

            switch (GetLocalInt(oItem, "RELIC"))
            {
                case 1: sLootTag = "TREASSURE_GUILD_HOUSE"; break;
                case 2: sLootTag = "TREASSURE_GUILD_TOWER"; break;
                case 3: sLootTag = "TREASSURE_GUILD_HAVEN"; break;
                case 4: sLootTag = "TREASSURE_GUILD_SANCTUARY"; break;
            }

        //Tell everyone
        SpeakString(GetName(oPC)+
        "<cÌwþ> has been sent to Jail for taking</c> " +GetName(oItem)
        +" to <cÌwþ>" +GetName(GetArea(oPC)) +".",TALKVOLUME_SHOUT);

        oOriginalLootPile = GetObjectByTag(sLootTag);

        if (!HasItem(oOriginalLootPile, "guild_relic"))
        {
            CopyItem(oItem, oOriginalLootPile, TRUE);
        }

        DestroyObject(oItem);

        //Remove the VFX for the Guild Loot
        effect eLoop = GetFirstEffect(oPC);
        while (GetIsEffectValid(eLoop))
        {
            if(GetEffectType(eLoop) == EFFECT_TYPE_VISUALEFFECT)
            RemoveEffect(oPC, eLoop);
            eLoop=GetNextEffect(oPC);
        }

        //Put the Guild Aura back
        ACNGuildVFX(oPC);

        //AssignCommand(oPC, ClearAllActions(TRUE));
        DelayCommand(2.0, JailPlayer(oPC));
    }

    //Else Save oPC
    else
    {
        DelayCommand(6.0, ExportSingleCharacter(oPC));
    }
*/}
