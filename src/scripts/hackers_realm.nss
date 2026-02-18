void main()
{
    object oPC = GetEnteringObject();
    if (!GetIsPC(oPC) || GetIsDM(oPC)) return;
    PopUpDeathGUIPanel(oPC, FALSE, FALSE, 0, "<c > NOTIFY A DM FOR ASSISTANCE."+
                                             "IF NO DM IS ONLINE, CONTACT FORUMS PLEASE!");
    SetXP(oPC, 0);
}
