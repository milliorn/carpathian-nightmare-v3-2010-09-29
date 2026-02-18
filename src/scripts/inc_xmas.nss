// Milliorn's Socket Generator
void Xmas(object oPC);
void Xmas(object oPC)
{
    // Vars
    object oPC = OBJECT_SELF,
           oChest = GetObjectByTag("BOSS_GENERATOR"),
           oItem, oCopy;
    int nCount = GetLocalInt(oChest, "itemcount"),
        nPick;
    int iRoll = d6(1);

    if(iRoll == 6)
    {
        return;
    }
    else if (!nCount)
        {
            oItem=GetFirstItemInInventory(oChest);
            do
            {
                nCount++;
                oItem=GetNextItemInInventory(oChest);
        }
            while (GetIsObjectValid(oItem));
            SetLocalInt(oChest, "itemcount", nCount);
        }

        nPick = Random(nCount);
        oItem = GetFirstItemInInventory(oChest);
        while (nPick)
        {
            nPick--;
            oItem=GetNextItemInInventory(oChest);
        }

        //Copy the item to the players inventory
        oCopy = CopyItem(oItem, oPC, TRUE);
        SetDroppableFlag(oCopy, TRUE);
}
//void main (){}
