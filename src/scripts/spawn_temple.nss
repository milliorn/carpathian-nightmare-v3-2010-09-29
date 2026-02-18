void main()
{
    object oPC = GetEnteringObject(),
           oObject1 = GetWaypointByTag("NW_MERCHANT_ARMOR"),
           oObject2 = GetWaypointByTag("NW_MERCHANT_MISC"),
           oObject3 = GetWaypointByTag("NW_MERCHANT_POTIONS_SCROLLS"),
           oObject4 = GetWaypointByTag("NW_MERCHANT_RINGS_AMULETS"),
           oObject5 = GetWaypointByTag("NW_MERCHANT_WEAPON");

    AssignCommand(oPC, ClearAllActions(TRUE));

    if (!GetIsObjectValid(GetNearestObjectByTag("armorshop", oObject1)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "armorshop", GetLocation(oObject1));
    }
    if (!GetIsObjectValid(GetNearestObjectByTag("miscellaneousite", oObject2)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "miscellaneousite", GetLocation(oObject2));
    }
    if (!GetIsObjectValid(GetNearestObjectByTag("creature", oObject3)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "creature", GetLocation(oObject3));
    }
    if (!GetIsObjectValid(GetNearestObjectByTag("jewelryshop001", oObject4)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "jewelryshop001", GetLocation(oObject4));
    }
    if (!GetIsObjectValid(GetNearestObjectByTag("weaponshop", oObject5)))
    {
        CreateObject(OBJECT_TYPE_CREATURE, "weaponshop", GetLocation(oObject5));
    }
}
