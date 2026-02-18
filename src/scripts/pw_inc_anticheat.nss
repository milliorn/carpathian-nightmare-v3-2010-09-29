//::///////////////////////////////////////////////
//:: pw_inc_anticheat
//:: Written by EPOlson (eolson@cisco.com)
//:: Feb 2004   (for the pw scripts)
//:://////////////////////////////////////////////
const int MAX_FEATS = 1115;
// Local vars to store data (append player name and character name)
const string PC_INFO_HP = "Pc_Hp_";      // int
const string PC_INFO_FEATS = "Pc_Fea_";  // string
// store player info on exit (HPs, Spells, Feats)
// call upon exit (client exit or area exit)
void StorePlayerInfo(object oPC);
void StorePlayerInfo(object oPC)
{
    object oMod = GetModule();
    string sName = GetName(oPC);
    string sID = GetLocalString(oMod,/*PERSISTANT_PLAYER_NAME+*/sName)+sName;

    PrintString("PWH Info - StorePlayerInfo for "+sName+"{"+sID+"}");

    // Hit Points
    int nCHP=GetCurrentHitPoints(oPC);

    SetLocalInt(oMod,PC_INFO_HP+sID,nCHP);

    int nFeat;
    int nNumFeat;
    string sFeatList = " ";

    for(nFeat=0; nFeat<MAX_FEATS; nFeat++)
    {
        if (nNumFeat = GetHasFeat(nFeat,oPC))
        {
            sFeatList += IntToString(nFeat)+":"+IntToString(nNumFeat)+" ";
        }
    }

    SetLocalString(oMod,PC_INFO_FEATS+sID,sFeatList);
}
// restore player info from local vars (HPs, Spells, Feats)
// call during login
void LoadPlayerInfo(object oPC);
void LoadPlayerInfo(object oPC)
{
    if(!GetIsPC(oPC))return;

    object oMod = GetModule();
    string sID = GetPCPlayerName(oPC)+GetName(oPC);
    string sPC = GetName(oPC);

    SetLocalString(oMod, /*PERSISTANT_PLAYER_NAME+*/GetName(oPC), GetPCPlayerName(oPC));
    PrintString("PWH Info - LoadPlayerInfo for "+sPC+"{"+sID+"}");
    SendMessageToPC(oPC,"OOC: restoring previous HPs, spells, and feats");

    // HP
    int nHP = GetLocalInt(oMod,PC_INFO_HP+sID);

    if (nHP == 0) nHP = GetCurrentHitPoints(oPC); // give them one HP the first time
    ApplyEffectToObject(DURATION_TYPE_PERMANENT,
    EffectDamage(GetCurrentHitPoints(oPC)-nHP,DAMAGE_TYPE_MAGICAL,DAMAGE_POWER_PLUS_FIVE), oPC);

    // Feats
    string sOldFeatList = GetLocalString(oMod,PC_INFO_FEATS+sID);
    int nFeat;
    int nNumFeat;

    for(nFeat=0; nFeat<MAX_FEATS; nFeat++)
    {
        if (nNumFeat = GetHasFeat(nFeat,oPC))
        {
            string sLookfor = " "+IntToString(nFeat)+":";
            int nStart = FindSubString(sOldFeatList,sLookfor);

            if (nStart >= 0)
            {
                while (GetSubString(sOldFeatList,nStart,1) != ":") nStart++;

                int nEnd = nStart+1;

                while (GetSubString(sOldFeatList,nEnd,1) != " ") nEnd++;

                string sSub = GetSubString(sOldFeatList,nStart+1,nEnd-nStart);
                int nOldNumFeat= StringToInt( sSub);
                int nFeatDiff = nNumFeat - nOldNumFeat;
                int suse;

                for (suse=0;suse<nFeatDiff;suse++)
                {
                    DecrementRemainingFeatUses(oPC,nFeat);
                }
                // check to see if it worked
                int nNewNumFeat = GetHasFeat(nFeat,oPC);
                if (nNewNumFeat != nOldNumFeat)
                {
                    PrintString("PWH anticheat - could not restore feat #"+sLookfor+
                    " old:"+sSub+",new:"+IntToString(nNewNumFeat));
                }
            }

                else
                {
                    // wipe all uses
                    int suse;

                    for (suse=0;suse<nNumFeat;suse++)
                    {
                        DecrementRemainingFeatUses(oPC,nFeat);
                    }
                }
        }
    }
}

/*void main () {}
