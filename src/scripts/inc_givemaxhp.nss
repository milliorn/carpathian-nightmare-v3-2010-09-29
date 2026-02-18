#include"aps_include"

const string NWN_VAULT_DIR  = "C:/NeverwinterNights/NWN/servervault/";
const string NWN_SOURCE_DIR = "C:/NeverwinterNights/NWN/source/";

const string WIN_NWN_VAULT_DIR  = "C:/NeverwinterNights/NWN/servervault/";
const string WIN_NWN_SOURCE_DIR = "C:/NeverwinterNights/NWN/source/";

string GetVaultDir() {
   if (GetLocalInt(GetModule(), "WINDOWS")) {
      return WIN_NWN_VAULT_DIR;
   }
   return NWN_VAULT_DIR;
}

string GetSourceDir() {
   if (GetLocalInt(GetModule(), "WINDOWS")) {
      return WIN_NWN_SOURCE_DIR;
   }
   return  NWN_SOURCE_DIR;

}

void MaxHitPointsPCEnter(object oPC) {
   SetLocalString(oPC, "MaxHitPointsName", GetPCPlayerName(oPC));
   DeleteLocalString(oPC, "MaxHitPointsScript");
   int iOld = GetPersistentInt(oPC, "MAXHPS", "pwdata");
   if (iOld > 0) {
      int iChange = GetMaxHitPoints(oPC) - iOld;
      object oPF;
      if (iChange) {
         oPF = GetObjectByTag("MAXHITPOINTS_PASS");
         SendMessageToPC(oPC, "You gained " + IntToString(iChange) + " hit points from the Max Hit Points script.");
      } else {
         oPF = GetObjectByTag("MAXHITPOINTS_FAIL");
         SendMessageToPC(oPC, "You failed to gain any hit points from the Max Hit Points script.");
      }
      if (oPF!=OBJECT_INVALID) DelayCommand(3.0f,AssignCommand(oPC, ActionExamine(oPF)));
      SetPersistentInt(oPC, "MAXHPS", -1, 1, "pwdata"); // FLAG IT DONE
      WriteTimestampedLogEntry("Leto Results <: "+IntToString(iChange));
   }
}

void MaxHitPointsPCExit(object oPC) {
   string sScript = GetLocalString(oPC, "MaxHitPointsScript");
   if (sScript != "") {
      string sPath = GetLocalString(oPC, "MaxHitPointsName");
      sPath = GetVaultDir()+"/"+sPath+"/";
      if (sPath == "") WriteTimestampedLogEntry("MaxHitPoints Bic Path is Null");
      sScript  = "%char = '"+sPath+"'+FindNewestBic('"+sPath+"'); " + sScript;
      sScript += "%char = '>'; ";
      sScript += "close %char; ";
      WriteTimestampedLogEntry("Leto Max HP Script >: "+sScript);
      SetLocalString(GetModule(), "NWNX!LETO!SCRIPT", sScript);
      string sScriptResult = GetLocalString(GetModule(), "NWNX!LETO!SCRIPT");
      WriteTimestampedLogEntry("Leto Results <: "+sScriptResult);
   }
   sScript = GetLocalString(oPC, "DELETECHAR");
   if (sScript!="") {
      WriteTimestampedLogEntry("Leto DeleteChar Script >: "+sScript);
      SetLocalString(GetModule(), "NWNX!LETO!SCRIPT", sScript);
      string sScriptResult = GetLocalString(GetModule(), "NWNX!LETO!SCRIPT");
//      WriteTimestampedLogEntry("Leto Results <: "+sScriptResult);
   }
}

void MaxHitPointsSetMax(object oPC) {
   int iOld = GetPersistentInt(oPC, "MAXHPS", "pwdata");
//   if (iOld >= 0){ // PC CAN RUN THIS SCRIPT
      ExportSingleCharacter(oPC);
      SetPersistentInt(oPC, "MAXHPS", GetMaxHitPoints(oPC), 1);
      string LS = "meta dir => '" + GetSourceDir() + "'; $RDD = 0; for(/LvlStatList) { $HD = lookup 'classes', /~/LvlStatClass, 'HitDie'; if(/~/LvlStatClass == 37) { $RDD++; $HD = $RDD < 4  ? $HD : $RDD < 6  ? 8 : $RDD < 11 ? 10 : 12; } /~/LvlStatHitDie = $HD; }";
      SetLocalString(oPC, "MaxHitPointsScript", LS);
      SpeakString("Ha! Prepare to be Leto'ed and thank Dragonsong!");
      DelayCommand(0.3, ApplyEffectToObject(DURATION_TYPE_TEMPORARY, EffectBeam(VFX_BEAM_LIGHTNING, OBJECT_SELF, BODY_NODE_HAND), oPC, 2.20));
      DelayCommand(2.5, AssignCommand(oPC, ActionPlayAnimation(ANIMATION_LOOPING_DEAD_BACK, 1.0, 9.0)));
      DelayCommand(2.6, PlayVoiceChat(VOICE_CHAT_CUSS, oPC));
      DelayCommand(2.7, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_IMP_LIGHTNING_M), oPC));
      DelayCommand(2.8, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_BONE_MEDIUM), oPC));
      DelayCommand(2.9, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_CHUNK_RED_LARGE), oPC));
      DelayCommand(3.0, ApplyEffectToObject(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_COM_BLOOD_CRT_RED), oPC));
      //DelayCommand(4.5, ActivatePortal(oPC, "216.161.26.219:5121", "", "", TRUE));
      DelayCommand(4.5, BootPC(oPC));
  }
/*   else if (iOld < 0) { // PC RAN IT TODAY
      SendMessageToPC(oPC, "You can only run this script once in a 24 hour period.");
   }
  else { // HP IS SET, JUST WAITING TO EXHALE (Should be hard to do)
      SendMessageToPC(oPC, "You are already scheduled to run this script. Please be patient.");
   }
}


*/
//void main () {}

/* IP'S
    MAIN    216.161.26.219:5121
    TEST    70.135.67.118:5121
