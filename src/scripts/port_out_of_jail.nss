//A wrapper to simplify checking for an item.
int HasItem(object oCreature, string s);

int HasItem(object oCreature, string s)
{
    return  GetIsObjectValid(GetItemPossessedBy(oCreature, s));
}

void main()
{
    object oPC = GetLastUsedBy();
    if (GetIsPC(oPC) && HasItem(oPC, "jail_token"))
    DestroyObject(GetItemPossessedBy(oPC, "jail_token"));
    ClearAllActions(TRUE);
    AssignCommand(oPC, JumpToLocation(GetLocation(GetWaypointByTag("NW_DEATH_TEMPLE"))));
}
