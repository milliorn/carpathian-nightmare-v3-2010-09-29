void main()
{
    object oPC = GetEnteringObject();
    if (GetIsPC(oPC)) ExploreAreaForPlayer(GetArea(oPC), oPC);
    if (!GetIsEncounterCreature(oPC)) return;
    AssignCommand(oPC,  SetIsDestroyable(TRUE));
    DestroyObject(oPC);
}
