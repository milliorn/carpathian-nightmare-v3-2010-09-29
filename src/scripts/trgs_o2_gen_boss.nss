#include "trgs_i0_respawn"
#include "inc_xmas"
void main()
{
    if(!GetLocalInt(OBJECT_SELF, "TIMER"))
    {
        {
            Xmas(OBJECT_SELF);
            DoTreasureGeneration( GetLastOpenedBy(), OBJECT_SELF, HIGH, GOLD|DISPOSABLES);
            IdentifyAll(OBJECT_SELF, OBJECT_SELF);
            SetLocalInt(OBJECT_SELF, "TIMER", TRUE);
            DelayCommand(600.0, DeleteLocalInt(OBJECT_SELF, "TIMER"));
            DelayCommand(600.0, DestroyInventory());
        }

    }
}

