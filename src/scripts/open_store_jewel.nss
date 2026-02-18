#include "nw_i0_plot"
void main()
{
    object oStore = GetNearestObjectByTag("Shop_Jewelry_Wands_Staves_Rods");
    if (GetObjectType(oStore) == OBJECT_TYPE_STORE)
    {
        gplotAppraiseOpenStore(oStore, GetPCSpeaker());
    }
    else
    {
        ActionSpeakStringByStrRef(53090, TALKVOLUME_TALK);
    }
}