int StartingConditional()
{
    object oPlayer = GetPCSpeaker();
    int nCheck = (!GetLocalInt(oPlayer, "FKY_CHAT_LANG1"));//if they can speak it return FALSE
    return nCheck;
}
