// Scarface's Despawner

// Despawn delay for dead creatures
const float DEAD_DESPAWN_TIME_DELAY = 60.0;

// Despawn delay for creatures not in battle
const float NO_COMBAT_DESPAWN_TIME_DELAY = 120.0;

void Despawn(object oObject)
{
    SetIsDestroyable(TRUE, FALSE, TRUE);
    DestroyObject(oObject);
}
void CheckBattleStatus(object oObject)
{
    if (!GetIsObjectValid(oObject)) return;

    if (GetIsInCombat(oObject))
    {
        DelayCommand(NO_COMBAT_DESPAWN_TIME_DELAY, CheckBattleStatus(oObject));
    }
    else
    {
        if (GetIsDead(oObject))
        {
            DelayCommand(DEAD_DESPAWN_TIME_DELAY - 1, SetIsDestroyable(TRUE, FALSE, FALSE));
            DelayCommand(DEAD_DESPAWN_TIME_DELAY, Despawn(oObject));
        }
        else
        {
            SetIsDestroyable(TRUE, FALSE, FALSE);
            DelayCommand(1.0, Despawn(oObject));
        }
    }
}
void main()
{
/*    if (GetIsEncounterCreature())
    {
        DelayCommand(NO_COMBAT_DESPAWN_TIME_DELAY, CheckBattleStatus(OBJECT_SELF));
    }   */
}





