

void main()
{
//VARIABLE DECLARATIONS----------------------------

    object oPC = GetLastUnlocked();
    object oItem = GetFirstItemInInventory(oPC);
    string sKey = GetTrapKeyTag(OBJECT_SELF);
    object oKey = GetObjectByTag(sKey);
    int iDoorDC = GetLockUnlockDC(OBJECT_SELF);
    int nKeyAssociated = TRUE;
    int iLockPick = GetLocalInt(oPC, "LOCKPICK");


//if oKey is OBJECT_INVALID then no key is associated with object

    if (oKey == OBJECT_INVALID)
        {
        nKeyAssociated = FALSE;
        }

//If a key is associated with the door, check oPC's inventory for the key
//If oPC has key, return from script

    while (oItem != OBJECT_INVALID && nKeyAssociated == TRUE)
    {
        if (oItem == oKey)
        {
            return;
        }
        oItem = GetNextItemInInventory(oPC);
    }


 if (!iLockPick)
    {
    int nExp = iDoorDC * 5 ;//5 exp per 1 DC, adjust to your liking.
    GiveXPToCreature(oPC,nExp);

    //Tell the PC
    string sExp = IntToString(nExp);
    SendMessageToPC(oPC, "<cЛ>Skill Use Bonus XP Award: </c>"+sExp+" Base XP. <cлн>Open Locks.");
    SetLocalInt(oPC, "LOCKPICK", TRUE);
    }

}

