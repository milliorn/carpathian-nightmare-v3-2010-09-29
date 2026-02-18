void main()
{
    if(!GetLocalInt(OBJECT_SELF, "CARP_LIGHT"))
    {
        {
            CreateItemOnObject("carpathianstone1", OBJECT_SELF);
            SetLocalInt(OBJECT_SELF, "CARP_LIGHT", TRUE);
            DelayCommand(600.0, DeleteLocalInt(OBJECT_SELF, "CARP_LIGHT"));
        }

    }
}
