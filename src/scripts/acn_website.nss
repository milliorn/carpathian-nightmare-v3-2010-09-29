void main()
{
    object oPC = GetEnteringObject();
    if (!GetLocalInt(oPC, "WEBSITE")){
        DelayCommand(7.0, FloatingTextStringOnCreature("<c þ >Sign up on our Forums, it's FREE!!!</c>", oPC));
        DelayCommand(8.0, FloatingTextStringOnCreature("<c²á^>http://acnpoa.proboards.com</c>", oPC));
        SetLocalInt(oPC, "WEBSITE", TRUE);}
}
