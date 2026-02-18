#include "sfsubr_leto_inc"

void RangerClassChange(object oPC)
{
   int ACN_LetoScript = GetLocalInt(oPC, "ACN_LetoScript");
   string Script;
   if (!ACN_LetoScript)
   {
      SendMessageToPC(oPC, "Ranger Class Improvement Script Activated");
      FloatingTextStringOnCreature("Ranger Class Improvement Script Activated", oPC, FALSE);
      ExportSingleCharacter(oPC);
      Script += AddFeat(FEAT_EVASION);
      Script += AddFeat(FEAT_POINT_BLANK_SHOT);
      Script += AddFeat(FEAT_RAPID_SHOT);
      ApplyLetoScriptToPC(Script, oPC);
   }
}

void main()
{
    object oPC = GetPCLevellingUp();

    if (GetLevelByClass(CLASS_TYPE_RANGER, oPC) == 2)/* &&
       !GetHasFeat(FEAT_EVASION, oPC) &&
       !GetHasFeat(FEAT_POINT_BLANK_SHOT,oPC) &&
       !GetHasFeat(FEAT_RAPID_SHOT, oPC))*/
    {
        RangerClassChange(oPC);
        return;
    }
}
