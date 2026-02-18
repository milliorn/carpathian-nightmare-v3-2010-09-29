#include "nw_i0_plot"
void main()
{
    object oStore = GetNearestObjectByTag("draconian_mercha");
    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
    {
        OpenStore(oStore, GetPCSpeaker(), 100);
    }
    else
    {
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
    }
}
