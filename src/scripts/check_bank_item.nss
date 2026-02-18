void main(){}/*
{
    object oPC = GetLastDisturbed(),
           oItem = GetInventoryDisturbItem();

    switch (GetInventoryDisturbType())
    {

        case INVENTORY_DISTURB_TYPE_ADDED:
        {
            FloatingTextStringOnCreature(GetName(oPC) + " ADDED "
            + GetName(oItem) +" to Persistant Chest " + GetName(OBJECT_SELF) +
            " CD KEY = "+GetPCPublicCDKey(oPC), oPC, TRUE);
           break;
        }
        default:
        {
            FloatingTextStringOnCreature(GetName(oPC) + " ADDED "
            + GetName(oItem) +" to Persistant Chest " + GetName(OBJECT_SELF) +
            " CD KEY = "+GetPCPublicCDKey(oPC), oPC, TRUE);
            break;
        }
    }
}

