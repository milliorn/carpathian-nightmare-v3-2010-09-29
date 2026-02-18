#include "x2_inc_itemprop"
void main()
{
    object oPC = GetModuleItemAcquiredBy(),
           oItem = GetModuleItemAcquired();
    int    iRefund = GetGoldPieceValue(oItem);
    string sPlayerName = GetName (oPC);

   // shifter fix from bioware forums
   // http://nwn.bioware.com/forums/viewtopic.html?topic=308039&forum=56&highlight=shifter+crash
    if (GetTag(oItem) == "NW_WSWMLS013"     ||
        GetTag(oItem) == "X2_IT_CREWMAZERA" ||
        GetTag(oItem) == "X2_IT_CREWPWH001" ||
        GetTag(oItem) == "x2_it_wplmss011"  ||
        GetTag(oItem) == "x2_it_wplmss012"  ||
        GetTag(oItem) == "X2_WDROWLS002"    ||
        GetTag(oItem) == "X2_IT_CREWPKOBS2" ||
        GetTag(oItem) == "X2_IT_CREWPKOBSW" ||
        GetTag(oItem) == "x2_it_crewprakxb" ||
        GetTag(oItem) == "x2_it_rakstaff"   ||
        GetTag(oItem) == "x2_it_crewpvscyt" )
        {

            SpeakString("EXPLOIT - Shifter Crash Bug avoided: "
            +GetTag(oItem)+" from "+GetName(oPC), TALKVOLUME_SHOUT);
            WriteTimestampedLogEntry("EXPLOIT - Shifter Crash Bug avoided:"
            +GetTag(oItem)+" from "+GetName(oPC));
            DestroyObject(oItem);
            return;
   }

    if (GetTag(oItem) == "sf_sockets" && IPGetNumberOfItemProperties(oItem) > 4)
    {
        ActionUnequipItem(oItem);
        return;
    }

    if (GetTag(oItem) == "NW_IT_CONTAIN002" ||
        GetTag(oItem) == "NW_IT_CONTAIN003" ||
        GetTag(oItem) == "NW_IT_CONTAIN004" ||
        GetTag(oItem) == "NW_IT_CONTAIN005")
    {
        GiveGoldToCreature(oPC, iRefund);
        DestroyObject(oItem, 0.3);
        SendMessageToPC(oPC, "<cú>Containers/Magic Bags are Forbidden.</c>");
        SpeakString(sPlayerName + "<cú>had a Containers/Magic Bags(Forbidden).</c>", TALKVOLUME_SHOUT);
        FloatingTextStringOnCreature("<cú>Containers/Magic Bags are Forbidden.</c>", oPC);
        return;
    }

    if (GetTag(oItem) == "NW_IT_MRING004")
    {
        GiveGoldToCreature(oPC, iRefund);
        DestroyObject(oItem, 0.3);
        SendMessageToPC(oPC, "<cú>Regeneration Rings +4 are not allowed(Forbidden)." +
        "  You have been refunded Double the Value in Gold Pieces.</c>");
        SpeakString(sPlayerName + "<cú>had a Regeneration Rings +4(Forbidden)."  +
        "  Gold Piece Refund of double Gold Value has been given.</c>", TALKVOLUME_SHOUT);
        FloatingTextStringOnCreature("<cú>Regeneration Rings +4 are not allowed(Forbidden)." +
        "  You have been refunded Double the Value in Gold Pieces.</c>", oPC);
        return;
    }
}
