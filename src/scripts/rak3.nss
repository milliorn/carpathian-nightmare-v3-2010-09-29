
 #include "nw_i0_tool"
void main()
{
    if (GetLocalInt(OBJECT_SELF,"NW_L_AMION") == 0)
    {
     object oPC=GetLastUsedBy();
    if (!HasItem(oPC, "NW_IT_TORCH001")){
    SendMessageToPC(oPC, "You need a torch to light this brazier");
    return;
    }
        PlayAnimation(ANIMATION_PLACEABLE_ACTIVATE);
        DelayCommand(0.4,SetPlaceableIllumination(OBJECT_SELF, TRUE));
        SetLocalInt(OBJECT_SELF,"NW_L_AMION",1);
        DelayCommand(0.5,RecomputeStaticLighting(GetArea(OBJECT_SELF)));


        SetLocalInt(GetModule(), "rakshash3", 2);
    }
    else
    {
        PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE);
        DelayCommand(0.4,SetPlaceableIllumination(OBJECT_SELF, FALSE));
        SetLocalInt(OBJECT_SELF,"NW_L_AMION",0);
        DelayCommand(0.9,RecomputeStaticLighting(GetArea(OBJECT_SELF)));

        SetLocalInt(GetModule(), "rakshash3", 0);
    }
   int a = GetLocalInt(GetModule(), "rakshash");
     int b = GetLocalInt(GetModule(), "rakshash2");
      int c = GetLocalInt(GetModule(), "rakshash3");

      if (a==2 && b==2 && c==2){
       object door1 = GetObjectByTag("rakdoor1");
      object door2 = GetObjectByTag("rakdoor2");
      AssignCommand (door1,ActionOpenDoor(door1));
       AssignCommand (door2,ActionOpenDoor(door2));
       }

       DelayCommand(5.0,     PlayAnimation(ANIMATION_PLACEABLE_DEACTIVATE));
        DelayCommand(5.4,SetPlaceableIllumination(OBJECT_SELF, FALSE));
       DelayCommand(5.0, SetLocalInt(OBJECT_SELF,"NW_L_AMION",0));
        DelayCommand(5.9,RecomputeStaticLighting(GetArea(OBJECT_SELF)));

        DelayCommand(5.0, SetLocalInt(GetModule(), "rakshash", 0));
}
