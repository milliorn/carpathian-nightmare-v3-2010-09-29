//////////////////////////////////////
///// Created by: bushido/////////////
//////////////////////////////////////
//////////////////////////////////////
// AdjustPlayerStats()////////////////
// Developed by: Wouter Dhondt////////
// Slightly modified by: bushido//////
//////////////////////////////////////
// Adjust Player Stats function///////
// Edited For Database By Knowj///////
// Made for Persistancy //////////////
// without Database by Milliorn//////
//////////////////////////////////////
void AdjustPlayerStats()
{
    object oDied = GetLastPlayerDied(),
           oKiller = GetLastHostileActor(oDied),
           oRecall = GetItemPossessedBy(oDied, "sf_recall"),
           oRecall2 = GetItemPossessedBy(oKiller, "sf_recall");
    string sArea = GetTag(GetArea(oDied));

    if (sArea == "Arena")return;

    // Check if oDead is a player
    if (!GetIsPC(oDied)) return;

    // Check if oKiller is a player possessed familiar
    if (GetIsPossessedFamiliar(oKiller))
    {
        oKiller = GetMaster(oKiller);
    }
    // Check if oKiller is a player or
    else if (!GetIsPC(oKiller)) return;

 if  (!GetIsDM(oKiller) || !GetIsDM(oDied))
 {
    // Increment or set the death variable
    int iDied = GetLocalInt(oRecall, "ACN_DEATH");
    ++iDied;
    SetLocalInt(oRecall, "ACN_DEATH", iDied);
    // Is this object a PC?
    if (GetIsPC(oKiller) == TRUE)
    {
        // Increment or set the killer var
        int iKilled = GetLocalInt(oRecall2, "ACN_KILL");
        ++iKilled;
        SetLocalInt(oRecall2, "ACN_KILL", iKilled);
    }
  }
}

