//Put this script OnClose
void main()
{

object oPC = GetLastClosedBy();

if (!GetIsPC(oPC)) return;

SetLocked(OBJECT_SELF, TRUE);

}


