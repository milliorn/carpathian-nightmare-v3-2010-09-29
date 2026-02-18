void main()
{
object oPC = GetEnteringObject();
if (GetIsPC(oPC) && !GetIsDM(oPC)){
object door1 = GetObjectByTag("rakdoor1");
      object door2 = GetObjectByTag("rakdoor2");
      AssignCommand (door1,ActionOpenDoor(door1));
       AssignCommand (door2,ActionOpenDoor(door2));
       }
}
