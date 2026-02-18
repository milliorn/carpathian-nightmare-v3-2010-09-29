//#include "sha_subr_consts"
// LetoScript Functions

void ApplyLetoScriptToPC(string Script, object oPC);

string ModifyFeat(int iFeat, int Remove);

// This function will delete oPC's Current character from the server vault
// object oPC      -  The PC to delete
void DeleteCharacter(object oPC);

// This function will give oPC the specified style wings
// object oPC      -  The defined player
// int nWingStyle  -  0 = Remove wings
//                    1 = Demon
//                    2 = Angel
//                    3 = Bat
//                    4 = RDD
//                    5 = Butterfly
//                    6 = Bird
void GiveWings(object oPC, int nWingStyle);

void DeleteCharacter(object oPC)
{
    object oMod = GetModule();
    string sPlayerName = GetPCPlayerName(oPC), sCharName = GetName(oPC);
    if (!GetIsPC(oPC)) return;
    ExportSingleCharacter(oPC);
    DelayCommand(0.5, BootPC(oPC));
    if (GetStringLength(sPlayerName) < 1) return;
    AssignCommand(oMod, DelayCommand(0.7, SetLocalString(oMod, "NWNX!DELETECHAR!DELETE", sPlayerName + "?" + sCharName)));
}

void GiveWings(object oPC, int nWingStyle)
{
    object oMod = GetModule();
    if (!GetIsPC(oPC)) return;
    string sPlayerName = GetPCPlayerName(oPC);
    ExportSingleCharacter(oPC);
    FloatingTextStringOnCreature("<cóó >Please relog after you are booted</c>", oPC);
    DelayCommand(5.0, BootPC(oPC));
    if (GetStringLength(sPlayerName) < 1) return;
    AssignCommand(oMod, DelayCommand(5.2, SetLocalString(oMod, "NWNX!WINGS!CHANGE", sPlayerName + "?" + IntToString(nWingStyle))));
}

void ApplyLetoScriptToPC(string Script, object oPC)
{
    string NWNPATH = "C:/NeverwinterNights/NWN/";
    string VaultPath = NWNPATH + "C:/NeverwinterNights/NWN/servervault/";// "C:/NeverwinterNights/NWN/servervault/";
    string Player = GetPCPlayerName(oPC);
    string BicPath = VaultPath + Player + "/";
    string BicFile;
        Script =
            "$RealFile = q<" + BicPath + "> + FindNewestBic q<" + BicPath + ">;" +
            "$EditFile = $RealFile + '.utc';" +
            "FileRename $RealFile, $EditFile;" +
            "%bic = $EditFile or die;" +
            Script +
            "%bic = '>';" +
            "close %bic;" +
            "FileRename $EditFile, $RealFile;";

    SetLocalString(oPC, "LetoScript", Script);
    DelayCommand(3.0, BootPC(oPC));
//    DelayCommand(3.0, ActivatePortal(oPC, LETO_PORTAL_IP_ADDRESS, "", "", TRUE) );
}

string ModifyFeat(int iFeat, int Remove)
{
    string sScript;
    if(Remove == 0)
    {
        sScript =  "add /FeatList/Feat, type => gffWord, value => " + IntToString(iFeat) + ";" + "add /LvlStatList/[0]/FeatList/Feat, type => gffWord, value => " + IntToString(iFeat) + ";";
    }
    else
    {
       sScript = "replace 'Feat', "+IntToString(iFeat)+", DeleteParent;";
    }
    return sScript;
}

string GetBicFileName(object oPC)
{
    string sChar, sBicName;
    string sPCName = GetStringLowerCase(GetName(oPC));
    int i, iNameLength = GetStringLength(sPCName);

    for(i=0; i < iNameLength; i++)
    {
        sChar = GetSubString(sPCName, i, 1);
        if (TestStringAgainstPattern("(*a|*n|*w|'|-|_)", sChar))
        {
            if (sChar != " ") sBicName += sChar;
        }
    }
    return GetStringLeft(sBicName, 16);
}
int HasDevCrit(object oPC)
{
    int nFeat = 495;
    while (nFeat < 532)
    {
        switch(GetHasFeat(nFeat, oPC))
        {
            case TRUE:
            {
                return TRUE;
                break;
            }
        }
        nFeat++;
    }
    if (GetHasFeat(955, oPC) ||
        GetHasFeat(996, oPC)) return TRUE;
    return FALSE;
}

//void main () {}
