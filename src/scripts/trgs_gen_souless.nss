#include "trgs_i0_respawn"
void main()
{
    if(!GetLocalInt(OBJECT_SELF, "TIMER"))
    {
        {
            DoTreasureGeneration( GetLastOpenedBy(), OBJECT_SELF, HIGH, GOLD|DISPOSABLES);
            IdentifyAll(OBJECT_SELF, OBJECT_SELF);
            SetLocalInt(OBJECT_SELF, "TIMER", TRUE);
            DelayCommand(600.0, DeleteLocalInt(OBJECT_SELF, "TIMER"));
            ExecuteScript("trgs_ranged_loot", OBJECT_SELF);
            DelayCommand(600.0, DestroyInventory());
        }

    }
}

