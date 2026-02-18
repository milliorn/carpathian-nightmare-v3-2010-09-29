#include "inc_remove_effec"
#include "inc_pm_nerf"
void main()
{
    object oPC = GetEnteringObject(),
           oObject1 = GetWaypointByTag("POST_omegasmith01"),
           oObject2 = GetWaypointByTag("POST_omegasmith02"),
           oObject4 = GetWaypointByTag("POST_omegasmith04");
    int iPMLevel = GetLevelByClass(CLASS_TYPE_PALEMASTER, oPC);

    AssignCommand(oPC, ClearAllActions(TRUE));
    RemoveAllEffects(oPC);

    //Palemaster Bone Skin Fix
    if (iPMLevel>=1)
        {DelayCommand(1.0,PaleMasterACNerf(oPC, iPMLevel));}

    if (!GetIsObjectValid(GetNearestObjectByTag("omegasmith02", oObject1)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "omegasmith02", GetLocation(oObject1));
    }
    if (!GetIsObjectValid(GetNearestObjectByTag("omegasmith03", oObject2)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "omegasmith03", GetLocation(oObject2));
    }


    if (!GetIsObjectValid(GetNearestObjectByTag("ilridentifier4", oObject4)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "ilridentifier", GetLocation(oObject4));
    }
}
