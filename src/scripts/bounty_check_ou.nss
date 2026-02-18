void main()
{
   object oPC = GetPCSpeaker(),
          oPlayer = GetFirstPC(),
          oRecall;
   int iBounty;
   string sName = GetName(oPC);

   if (!GetLocalInt(OBJECT_SELF, "TIMER_" + sName))
   {
       SetLocalInt(OBJECT_SELF, "TIMER_" + sName, TRUE);
       DelayCommand(6.0, DeleteLocalInt(OBJECT_SELF, "TIMER_" + sName));
       SendMessageToPC(oPC, "<c þ >Bounties:");
       while (GetIsObjectValid(oPlayer))
       {
           oRecall = GetItemPossessedBy(oPlayer, "sf_recall");
           iBounty = GetLocalInt(oRecall, "BOUNTY");
           if (iBounty >= 1)
           {
               SendMessageToPC(oPC, "<c fþ>"+GetName(oPlayer)+"<c°°°> - <cfÌþ>"+IntToString(iBounty)+"<có  > PK's</c> <cóóó>" + GetName(GetArea(oPlayer)));
           }
           oPlayer = GetNextPC();
       }
   }
   else
   {
       FloatingTextStringOnCreature("<c ó >Anti Spamming Code - <cóóó>you may only use this once per 6 seconds", oPC);
   }
}
