//::///////////////////////////////////////////////
//:: ACN's Persistent Banking
//:: sfpb_check_gil
//:://////////////////////////////////////////////
/*
    Written By Milliorn
*/
//////////////////////////////////////////////////

int StartingConditional()
{
    // Anti exploit stuff
    if (GetLocalInt(OBJECT_SELF, "ANTI_CHEAT_GIL"))
    {
        DeleteLocalInt(OBJECT_SELF, "ANTI_CHEAT_GIL");
        return TRUE;
    }
    return FALSE;
}

