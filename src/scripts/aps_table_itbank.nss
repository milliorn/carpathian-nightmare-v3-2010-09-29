// Name     : Demo create table
// Purpose  : Create a table for persistent data
// Authors  : Ingmar Stieger
// Modified : January 30, 2003

// This file is licensed under the terms of the
// GNU GENERAL PUBLIC LICENSE (GPL) Version 2

#include "aps_include"

void main()
{
    object oPC = GetLastUsedBy();

    if (GetPCPublicCDKey(oPC) == "QG6CXEYC" ||
        GetPCPublicCDKey(oPC) == "Q76A43RL" ||
        GetPCPublicCDKey(oPC) == "QG6QREW7")
    {
        SQLExecDirect("DROP TABLE BANK_ITEM");
        SendMessageToPC(oPC, "Table 'BANK_ITEM' deleted.");


        // For Access

        SQLExecDirect("CREATE TABLE BANK_ITEM (" +
                        "player text(64)," +
                        "tag text(64)," +
                        "name text(64)," +
                        "val memo," +
                        "expire text(4)," +
                        "last date)");

        // Example for MySQL
        /*
        SQLExecDirect("CREATE TABLE pwdata (" +
                        "player VARCHAR(64) default NULL," +
                        "tag VARCHAR(64) default NULL," +
                        "name VARCHAR(64) default NULL," +
                        "val TEXT," +
                        "expire SMALLINT UNSIGNED default NULL," +
                        "last TIMESTAMP(14) NOT NULL," +
                        "KEY idx (player,tag,name)" +
                        ")" );
        */

        SendMessageToPC(GetLastUsedBy(), "Table 'BANK_ITEM' created.");
    }
}
