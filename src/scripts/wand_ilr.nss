//ACN Item Value Wand
#include "x2_inc_switches"
#include "acn_ilr"
void main()
{
    object  oPC   = GetItemActivator();
    object  oItem = GetItemActivatedTarget();
    int     nGold = GetGoldPieceValue(oItem);
    int nILR = GetILR_ByGoldValue(oItem);

        if (GetUserDefinedItemEventNumber() != X2_ITEM_EVENT_ACTIVATE) return;

        else if (GetObjectType(oItem) != OBJECT_TYPE_ITEM)
        {
            SendMessageToPC(oPC, "<cú>Must be an item to check Gold Piece Value!");
            FloatingTextStringOnCreature("<cú>Must be an item to check Gold Piece Value!", oPC);
            return;
        }

        else
        {
            SendMessageToPC(oPC, GetName(oItem) + "<cú> value is: <cfÌþ>"
            + IntToString(nGold) + " </c>gp & Level(<cfÌþ>" +IntToString(nILR)+ "</c>)");
        }
}

