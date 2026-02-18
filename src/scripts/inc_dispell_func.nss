int GetMax(int iNum1 = 0, int iNum2 = 0) {
   return (iNum1 > iNum2) ? iNum1 : iNum2;
}

int GetMin(int iNum1 = 0, int iNum2 = 0) {
   return (iNum1 < iNum2) ? iNum1 : iNum2;
}

float GetMaxf(float iNum1 = 0.0, float iNum2 = 0.0) {
   return (iNum1 > iNum2) ? iNum1 : iNum2;
}

float GetMinf(float iNum1 = 0.0, float iNum2 = 0.0) {
   return (iNum1 < iNum2) ? iNum1 : iNum2;
}

int RandomUpperHalf(int nIn) {
   if (nIn) nIn = nIn - Random(nIn/2);
   return nIn;
}

int GetHasSpellSchool(object oPC, int iSchool) {
   if (!GetLevelByClass(CLASS_TYPE_WIZARD, oPC)) return FALSE; // NO WIZ LEVELS
   int iHasSchool = GetLocalInt(oPC, "SPELL_SCHOOL");
   return (iHasSchool==iSchool);
}

int IsPure(object oPC) {
   if (GetCasterLevel(oPC)==GetHitDice(oPC)) return GetHitDice(oPC);
   return FALSE;
}

//void main() {}
