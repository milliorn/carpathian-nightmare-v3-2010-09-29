void main()
{
    object oPC = GetExitingObject();
    string sName = GetName(oPC);
    if (!GetIsPC(oPC) || GetIsDM(oPC)) return;
    SpeakString(sName + "<cÌwþ> has left the </c>Arena", TALKVOLUME_SHOUT);
    ExecuteScript("acn_body_bag", oPC);
}
