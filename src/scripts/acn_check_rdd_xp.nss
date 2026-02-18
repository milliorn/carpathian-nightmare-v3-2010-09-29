int StartingConditional()
{
object oPC = GetPCSpeaker();

if ((GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC)==0)&&
    (GetLevelByClass(CLASS_TYPE_DRAGONDISCIPLE, oPC)==0))
return FALSE;

return TRUE;
}

