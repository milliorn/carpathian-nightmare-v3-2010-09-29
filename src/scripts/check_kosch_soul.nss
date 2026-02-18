void main()
{
    if(!GetLocalInt(OBJECT_SELF, "KOSCH_SOUL"))
    {
        {
            CreateItemOnObject("item005", OBJECT_SELF);
            SetLocalInt(OBJECT_SELF, "CARP_LIGHT", TRUE);
            DelayCommand(600.0, DeleteLocalInt(OBJECT_SELF, "KOSCH_SOUL"));

        }

    }
}



