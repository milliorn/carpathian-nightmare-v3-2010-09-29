void main()
{

object oPC = GetLastUsedBy();

if (!GetIsPC(oPC)) return;

object oTarget = OBJECT_SELF,
oDestination = GetWaypointByTag("POST_TunnelsoftheSoulessEntr");
int nInt = GetObjectType(oTarget);
location lTarget= GetLocation(oDestination);
ApplyEffectAtLocation(DURATION_TYPE_INSTANT, EffectVisualEffect(VFX_FNF_LOS_EVIL_30), GetLocation(oTarget));

if (GetAreaFromLocation(lTarget)==OBJECT_INVALID) return;

AssignCommand(oPC, ClearAllActions());
AssignCommand(oPC, ActionJumpToLocation(lTarget));

}

