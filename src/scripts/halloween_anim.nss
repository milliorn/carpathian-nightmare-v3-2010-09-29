//:://///////////////////////////////
//:: Stay Sitting During Conversation
//:: AT_NPC_STAYSAT
//:://///////////////////////////////
/*
    Forces a NPC to remain seated
    During a conversation.
    Place in the Action Taken Tab
    of the FIRST NODE of the NPC
    Conversation.
    If NPC has many Optional Nodes
    this script should be in each
    FIRST Node of the optional
    branches
*/
//:://///////////////////////////////
void main()
{
    object oChair = GetObjectByTag("deaths_throne");
    if(!GetIsObjectValid(GetSittingCreature(oChair)))
        {
            ActionSit(oChair);
        }
}

