int StartingConditional()
{
object oPC = GetPCSpeaker();

if (GetLocalInt(oPC, "FORGE_CHECK") != 1) return TRUE;

return FALSE;
}

