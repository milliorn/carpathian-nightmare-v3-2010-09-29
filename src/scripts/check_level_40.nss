#include "hgll_const_inc"
int StartingConditional()
{
object oPC = GetPCSpeaker();

  if (GetLootable(oPC) <= 41) return FALSE;

return TRUE;
}
