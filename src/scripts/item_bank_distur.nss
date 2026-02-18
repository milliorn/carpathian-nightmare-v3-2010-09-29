void main()
{
    object oPC = GetLastDisturbed(),
           oItem = GetInventoryDisturbItem();
    effect eVFX = EffectVisualEffect(VFX_DUR_BIGBYS_GRASPING_HAND);

    switch (GetInventoryDisturbType())
    {
       case INVENTORY_DISTURB_TYPE_ADDED:
       {
           ApplyEffectToObject(DURATION_TYPE_TEMPORARY, eVFX, OBJECT_SELF, 600.0);
           SetLocalObject(OBJECT_SELF, "LAST_USER", oPC);
           SetLocalString(OBJECT_SELF, "LAST_USER_NAME", GetPCPublicCDKey(oPC));
           //SendMessageToAllDMs(GetName(oPC) + " <cσσσ>ADDED</c> " + GetName(oItem) +
           //" <cσσσ>to </c> " + GetName(OBJECDeleteLocalStringT_SELF) + " <cσσσ>ID =</c> " +GetPCPublicCDKey(oPC));
           DelayCommand(600.0, DeleteLocalObject(OBJECT_SELF, "LAST_USER"));
           DelayCommand(600.0, DeleteLocalString(OBJECT_SELF, "LAST_USER_NAME"));
           break;
       }
       default:
       {
           DeleteLocalObject(OBJECT_SELF, "LAST_USER");
           DeleteLocalString(OBJECT_SELF, "LAST_USER_NAME");
           //SendMessageToAllDMs(GetName(oPC) + " <cσσσ>REMOVED</c> " + GetName(oItem) +
           //" <cσσσ>from </c> " + GetName(OBJECT_SELF) + " <cσσσ>ID =</c> " +GetPCPublicCDKey(oPC));
           break;
        }
    }
}
