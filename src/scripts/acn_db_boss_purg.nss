#include "aps_include"
void main()
{
        SQLExecDirect("DROP TABLE BOSS");
        SQLExecDirect("CREATE TABLE BOSS (" +
                        "player text(64)," +
                        "tag text(64)," +
                        "name text(64)," +
                        "val memo," +
                        "expire text(4)," +
                        "last date)");
}
