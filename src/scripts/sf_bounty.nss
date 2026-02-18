//::///////////////////////////////////////////////
//::
//::  Bounty/PKing system
//::
//:://////////////////////////////////////////////
#include "_colour_codes"
#include "jail_timer"
#include "raise_inc"
#include "acn_bounty"
#include "inc_socket_gener"
#include "mod_ondeath"
#include "nwnx_realtime"

//Bounty Reward constants (This is multiplied by the Dead PCs Level)
const int GP_REWARD = 1000, // GP Reward(This is multiplied by the
          XP_REWARD = 1000,  // dead players character level
          GP_BONUS_MULTIPLIER = 10, // Multipliers for ending a
          XP_BONUS_MULTIPLIER = 10; // PCs killing spree
                                   // Default is 2(Double reward)

void main()
{
    //Define objects
    object oDead    = GetLastPlayerDied(),
           oKiller  = GetLastHostileActor(oDead);

    // Check if oDead is a player
    if (!GetIsPC(oDead)) return;

    // Check if oKiller is a player possessed familiar
    if (GetIsPossessedFamiliar(oKiller))
    {
        oKiller = GetMaster(oKiller);
    }

    string sTag = GetTag(OBJECT_SELF);
    string sLeft = GetStringLeft(sTag, 3);

    if (sLeft == "SU_" && GetIsPossessedFamiliar(oKiller))
    {
        oKiller = GetMaster(oKiller);
    }

    // Check if oKiller is a player or
    else if (!GetIsPC(oKiller)) return;

    AdjustPlayerStats();
    AssignCommand(oKiller, ClearAllActions());

    // More objects
    object oArea    = GetArea(oDead),
           oRecall  = GetItemPossessedBy(oDead, "sf_recall"),
           oRecall2 = GetItemPossessedBy(oKiller, "sf_recall");

    //Define effects
    effect eBlood1  = EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE),
           eBlood2  = EffectVisualEffect(VFX_COM_BLOOD_SPARK_LARGE),
           eSmoke   = EffectVisualEffect(VFX_IMP_DEATH_L),
           Vfx3     = EffectVisualEffect(VFX_DUR_PROT_EPIC_ARMOR_2),
           eFlag    = EffectVisualEffect(VFX_DUR_FLAG_RED);

    int iPC     = GetHitDice(oDead),
        iKiller = GetHitDice(oKiller),
        iRandom = Random(999) +1,
        iBounty = GetLocalInt(oRecall, "BOUNTY");

    //Define strings
    string sName    = GetName(oDead),
           sName2   = GetName(oKiller),
           sArea    = GetTag(GetArea(oDead)),
           sArea2   = GetName(oArea),
           sLevel1  = IntToString(iPC),
           sLevel2  = IntToString(iKiller);

    object oPlayer  = GetLastPlayerDied(),
           oVictor  = GetLastHostileActor(oPlayer);
    int    nVictims = GetLocalInt(oRecall2, "ACN_KILL"),
           nDeaths  = GetLocalInt(oRecall, "ACN_DEATH"),
           nKilled  = GetLocalInt(oRecall2, "ACN_DEATH"),
           nScore   = (nVictims - nKilled);
    string sKilled  = GetName(oPlayer),
           sKiller  = GetName(oVictor),
           sVictims = IntToString(nVictims),
           sDeaths  =  IntToString(nDeaths),
           sScore   = IntToString(nScore);

    //Apply effects to dead PC
    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eBlood1, oDead));
    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eBlood2, oDead));
    DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_INSTANT, eSmoke, oDead));

    //Play Evil Laugh to dead player
    AssignCommand(oDead, PlaySound("vs_nx2mephm_107"));

    int iDeadLoot = GetLootable(oDead);
    int iKillLoot = GetLootable(oKiller);

        //Check if dead PC had a bounty on his head

         if (iBounty >=1 && iBounty <10)
        {
            //Reward the bounty to oKiller
            if (iDeadLoot > 40) iPC = GetLootable(oDead);
            if (iKillLoot > 40) iKiller = GetLootable(oKiller);
            GiveXPToCreature(oKiller, XP_REWARD + iRandom);
            GiveGoldToCreature(oKiller, GP_REWARD + iRandom);
            PKReward(oKiller);
            GenerateSockets(oKiller);
            //Shout bounty server message
            SpeakString("<cfÌþ>Bounty settled.  " + sName +
            " was destroyed by " + sName2 + " and has been rewarded.  <cú>"
            +sKiller+"<c • > has </c>"
            +sVictims+"<c • > kills.<cú>  "
            +sKilled+"<c • > has </c>"+sDeaths+"<c • > deaths.  <cúúú>"
            +sKiller+"<cú> Score Is: <cúú>"+sScore+".  ", TALKVOLUME_SHOUT);
            //Delete the dead pc's bounty
            DeleteLocalInt(oRecall, "BOUNTY");

            //Jail player
            CreateItemOnObject("jail_token", oDead);
            DelayCommand(0.5, Raise(oDead));
            DelayCommand(0.7, JailPlayer(oDead));
            return;

            //End script
            return;
        }
        else if (iBounty >= 10)
        {
            //Reward the bounty to oKiller
            GiveXPToCreature(oKiller, XP_REWARD + iRandom * XP_BONUS_MULTIPLIER);
            GiveGoldToCreature(oKiller, GP_REWARD + iRandom * GP_BONUS_MULTIPLIER);
            PKReward(oKiller);
            GenerateSockets(oKiller);
            //Shout bounty server message
            SpeakString("<cfÌþ>" + sName + "'s killing spree"+
            " is over and was destroyed by "+ sName2 +" with " + IntToString(iBounty) +
            " player kills. Double bounty has been rewared.  <cú>"+sKiller+
            "<c • > has </c>"
            +sVictims+"<c • > kills.<cú>  "
            +sKilled+"<c • > has </c>"+sDeaths+"<c • > deaths.  <cúúú>"
            +sKiller+"<cú> Score Is: <cúú>"+sScore+".", TALKVOLUME_SHOUT);
            DeleteLocalInt(oRecall, "BOUNTY");

            //Jail player
            CreateItemOnObject("jail_token", oDead);
            DelayCommand(0.5, Raise(oDead));
            DelayCommand(0.7, JailPlayer(oDead));
            return;
        }
        else
        {
            // Get Bounty Count
            iBounty = GetLocalInt(oRecall2, "BOUNTY")+1;

            // Check player challenge rating
            string sRating = CheckPCCR(oDead, oKiller);

            if (iBounty >= 10)
            {
                //If the player is a male
                if (iDeadLoot > 40) iPC = GetLootable(oDead);
                if (iKillLoot > 40) iKiller = GetLootable(oKiller);
                sLevel1 = IntToString(iPC);
                sLevel2 = IntToString(iKiller);
                SpeakString("<cóóó>" + sName2 +
                "<cú> Level " + sLevel2 + "<cú> PKed <cóóó>" + sName +"<cú> Level "
                + sLevel1 + "<cóóó> with a "+ sRating + "<cóóó> and is on a killing spree"
                +" at location: <cfÌþ>"+sArea2+"<cóóó> With <c°°°>"
                + IntToString(iBounty) + "<cóóó> player kills!!!  <cú>"+sKiller+
                "<c • > has </c>"
                +sVictims+"<c • > kills.<cú>  "
                +sKilled+"<c • > has </c>"+sDeaths+"<c • > deaths.  <cúúú>"
                +sKiller+"<cú> Score Is: <cúú>"+sScore+".  " + GetServerDateTime(), TALKVOLUME_SHOUT);
                PKReward(oKiller);
                GenerateSockets(oKiller);
                GiveGoldToCreature(oKiller, iRandom * 10);
                GiveXPToCreature(oKiller, iRandom * 10);
            }

            //Otherwise the player is a female
            else
            {
                // Get gender
                string sGender;

                if (GetGender(oKiller) == GENDER_MALE)
                {
                    sGender = "his";
                }

                else
                {
                    sGender = "her";
                }

                    if (iDeadLoot > 40) iPC = GetLootable(oDead);
                    if (iKillLoot > 40) iKiller = GetLootable(oKiller);
                    sLevel1 = IntToString(iPC);
                    sLevel2 = IntToString(iKiller);
                    SpeakString("<cóóó>" + sName2 +
                    "<cú> Level " + sLevel2 +"<có  > PKed <cóóó> " + sName +
                    "<cú> Level " + sLevel1 +"<cóóó> with a " + sRating +
                    " <cóóó>at location: <cfÌþ>" + sArea2 +". <cóóó>" + sName2 +
                    "</c> now has a bounty over " + sGender +" head.  <cú>"+sKiller+
                    "<c • > has </c>"
                    +sVictims+"<c • > kills.<cú>  "
                    +sKilled+"<c • > has </c>"+sDeaths+"<c • > deaths.  <cúúú>"
                    +sKiller+"<cú> Score Is: <cúú>"+sScore+".  " +GetServerDateTime(), TALKVOLUME_SHOUT);
                    GiveGoldToCreature(oKiller, iRandom);
                    GiveXPToCreature(oKiller, iRandom);
                }

                // Set the bounty variable
                SetLocalInt(oRecall2, "BOUNTY", iBounty);

                // Apply bounty flag
                ApplyBountyFlag(oKiller);
            }
}

