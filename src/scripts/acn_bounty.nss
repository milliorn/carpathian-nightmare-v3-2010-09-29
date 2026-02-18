#include "inc_socket_gener"
#include "inc_santa"
#include "inc_xmas"
#include "raise_inc"

/*void CheckGriefer (object oPC)
{
    object oDead = GetLastPlayerDied(),
           oKiller = GetLastHostileActor(oDead),
           oRecall = GetItemPossessedBy(oDead, "sf_recall"),
           oRecall2 = GetItemPossessedBy(oKiller, "sf_recall"),
           oServer = GetObjectByTag("server_npc");

    int iPC = GetHitDice(oDead),
        iKiller = GetHitDice(oKiller),
        iBounty = GetLocalInt(oRecall, "BOUNTY"),
        iScore = GetLocalInt(oRecall2, "ACN_KILL"),
        iScore1 = GetLocalInt(oRecall2, "ACN_DEATH");

    string sName = GetName(oDead),
           sName2 = GetName(oKiller);


    if (iPC + 10 < iKiller)
    {
        AssignCommand(oKiller, ClearAllActions(TRUE));
        Raise(oDead);
        SetLocalInt(oKiller, "ACN_KILL", iScore - 2);
        AssignCommand(oServer,(SpeakString("<cfÌþ>"+sName2+" punished! "+sName+" has been resurrected.", TALKVOLUME_SHOUT)));

    }
}
*/
void PKReward(object oPC)
{
object oDead = GetLastPlayerDied(),
       oKiller = GetLastHostileActor(oDead);
   int iPC = GetLootable(oDead),
       iKiller = GetHitDice(oKiller);
string sArea = GetTag(GetArea(oDead));

    if (sArea == "Arena")return;

    else if (iKiller + 2 == iPC || iKiller + 1 == iPC || iKiller == iPC)
        {
            GenerateSockets(oKiller);
            return;
        }

    else if (iKiller + 4 == iPC || iKiller + 3 == iPC)
        {
            GenerateSockets(oKiller);
            Xmas(oKiller);
            return;
        }

    else if (iKiller + 5 <= iPC)
        {
            GenerateSockets(oKiller);
            Xmas(oKiller);
            SantaShack(oKiller);
            return;
        }
    }

string CheckPCCR(object oDead, object oKiller)
{
/*
     a rating of effortless is 6 levels lower
     a rating of easy is 4 to 5 levels lower
     a rating of moderate is 2 to 3 levels lower
     a rating f challenging is same or 1 level lower
     a rating of very difficult is 1 or 2 levels higher
     a rating of overpowering is 3 or 4 levels higher
     a rating of impossible is 5 or more levels higher.
*/
    int iPC = GetHitDice(oDead),
        iKiller = GetHitDice(oKiller);

    if (iPC + 6 <= iKiller)                            return "<c°°°> EFFORTLESS rating";
    else if (iPC + 5 == iKiller || iPC + 4 == iKiller) return "<c ó > EASY <cóóó> rating";
    else if (iPC + 3 == iKiller || iPC + 2 == iKiller) return "<c fþ> MODERATE <cóóó> rating";
    else if (iPC + 1 == iKiller || iPC == iKiller)     return "<cóó > CHALLENGING <cóóó> rating";
    else if (iKiller + 2 == iPC || iKiller + 1 == iPC) return "<cþf > VERY DIFFICULT <cóóó> rating";
    else if (iKiller + 4 == iPC || iKiller + 3 == iPC) return "<có  > OVERPOWERING <cóóó> rating";
    else if (iKiller + 5 <= iPC)                       return "<có ó> IMPOSSIBLE <cóóó> rating";

    // This should never display
    else return "an UNKNOWN rating";
}
/*void main(){}
