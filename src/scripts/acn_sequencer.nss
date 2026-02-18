#include "nw_i0_plot"
int HasSequencerItem(object oCreature, string s);
// Take Carpathian Sequencer from PC an give a new one
void Sequencer(object oPC, string sItem);

int HasSequencerItem(object oCreature, string s)
{
    return  GetIsObjectValid(GetItemPossessedBy(oCreature, s));
}

void Sequencer(object oPC, string sItem)
{
    object oItem;

    if(HasSequencerItem(oPC, sItem) == FALSE)
    {
        SendMessageToPC(oPC, "<cú>SERVER Message: </c> You have been given"+
        " a new Carpathian Sequencer Wand.");
        oItem = CreateItemOnObject("rodfastcast", oPC);
        DelayCommand(2.0, ActionDoCommand(ActionGiveItem(oItem, oPC)));

    }

    else if(HasSequencerItem(oPC, sItem) == TRUE)
    {
        object oWand = GetObjectByTag(sItem);
        SetDroppableFlag(oWand, TRUE);
        SetPlotFlag(oWand, FALSE);
        DestroyObject(GetItemPossessedBy(oPC, sItem));
        SendMessageToPC(oPC, "<cú>SERVER Message: </c> You have been given"+
        " a new Carpathian Sequencer Wand.");
        oItem = CreateItemOnObject("rodfastcast", oPC);
        DelayCommand(2.0, ActionDoCommand(ActionGiveItem(oItem, oPC)));

    }

}

void main()
{
    object oPC = GetPCSpeaker();
    Sequencer(oPC, "rodfastcast");

    if(HasItem(oPC, "wand_ilr") == FALSE)
    {
        CreateItemOnObject("wand_ilr", oPC);
        SendMessageToPC(oPC, "<cú>SERVER Message: </c> You have been given"+
        " a new IRL Wand.");
    }

    if(HasItem(oPC, "wand_bounty") == FALSE)
    {
        CreateItemOnObject("wand_bounty", oPC);
        SendMessageToPC(oPC, "<cú>SERVER Message: </c> You have been given"+
        " a new Bounty Wand.");
    }
    if (HasItem(oPC, "legendarylevel") == FALSE)
    {
        CreateItemOnObject("legendarylevel", oPC);
        SendMessageToPC(oPC, "<cú>SERVER Message: </c> You have been given"+
        " a new Legendary Level Checker.");
    }

    if(HasItem(oPC, "wand_pc_dislike") == FALSE)
    {
        CreateItemOnObject("wand_pc_dislike", oPC);
        SendMessageToPC(oPC, "<cú>SERVER Message: </c> You have been given"+
        " a new PC Dislike Wand.");
    }
}
