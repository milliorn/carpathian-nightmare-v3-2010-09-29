#include "trgs_i0_respawn"
void main()
{
    DoTreasureGeneration( GetLastOpenedBy(), OBJECT_SELF, LOW, GOLD|DISPOSABLES);
    IdentifyAll(OBJECT_SELF, OBJECT_SELF);
    DelayCommand(600.0, DestroyInventory());
}



