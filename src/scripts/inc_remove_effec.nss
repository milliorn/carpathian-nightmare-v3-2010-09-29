void RemoveAllEffects(object oCreature);
void RemoveAllEffects(object oCreature)
{
    effect eCurrentEffect = GetFirstEffect(oCreature);
    while (GetIsEffectValid(eCurrentEffect))
    {
        RemoveEffect(oCreature,eCurrentEffect);
        eCurrentEffect = GetNextEffect(oCreature);
    }
//        RefreshEffects(oCreature);
}

/*
void main()
{

}
