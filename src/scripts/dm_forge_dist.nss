void main()

{
    object oPC = GetLastDisturbed(),
           oItem = GetInventoryDisturbItem();

    if (GetItemPossessedBy(oItem, "sf_socket_item")!= OBJECT_INVALID)
    {
       SetLocalInt(oPC, "NO_SOCKET", 1);
    }


    switch (GetInventoryDisturbType())
    {

       case INVENTORY_DISTURB_TYPE_ADDED:
       {
           SetLocalObject(OBJECT_SELF, "LAST_USER", oPC);
           //SendMessageToAllDMs(GetName(oPC) + " <cσσσ>ADDED</c> " + GetName(oItem) +
           //" <cσσσ>to </c> " + GetTag(OBJECT_SELF) + " <cσσσ>CD KEY =</c> " +GetPCPublicCDKey(oPC));
           SetLocalInt(oPC, "FORGE_CHECK", 1);
           break;
       }
       default:
       {
           DeleteLocalObject(OBJECT_SELF, "LAST_USER");
           //SendMessageToAllDMs(GetName(oPC) + " <cσσσ>REMOVED</c> " + GetName(oItem) +
           //" <cσσσ>from </c> " + GetTag(OBJECT_SELF) + " <cσσσ>CD KEY =</c> " +GetPCPublicCDKey(oPC));
           DeleteLocalInt(oPC, "FORGE_CHECK");
           break;


        }
    }
}
