from __future__ import print_function

import mysql.connector
from mysql.connector import errorcode

dbName = 'richards'

TABLES = {}

TABLES['time'] = (
    "CREATE TABLE IF NOT EXISTS `richards`.`time` ("
    "  `idtime` INT NOT NULL,"
    "  `idflow` INT NOT NULL,"
    "  `date` INT NOT NULL,"
    "  `dayofweek` INT NOT NULL,"
    "   `hour` INT NOT NULL,"
    "   `minute` INT NOT NULL,"
    "   `seconds` INT NOT NULL,"
    "   PRIMARY KEY (`idtime`)"
") ENGINE=InnoDB;")
    

TABLES['flow'] = (
    "CREATE TABLE IF NOT EXISTS `richards`.`flow` ("
    "   `flowid` INT NOT NULL,"
    "   `idtime` INT NOT NULL,"
    "   `flow1` INT NOT NULL,"
    "   `flow2` INT NOT NULL,"
    "   `flow3` INT NOT NULL,"
    "   `flowtotal` INT NOT NULL,"
    "   PRIMARY KEY (`flowid`),"
    "   INDEX `timeflow_idx` (`idtime` ASC) VISIBLE,"
    "   CONSTRAINT `timeflow`"
            "FOREIGN KEY (`idtime`)"
            "REFERENCES `richards`.`time` (`idtime`)"    
") ENGINE=InnoDB;")



TABLES['occupancy'] = (
    "CREATE TABLE IF NOT EXISTS `richards`.`ocuppancy` ("
        "`idocuppancy` INT NOT NULL,"
        "`idtime` INT NOT NULL,"
        "`ocuppancy1` INT NOT NULL,"
        "`ocuppancy2` INT NOT NULL,"
    "PRIMARY KEY (`idocuppancy`),"
    "INDEX `ocuptime_idx` (`idtime` ASC) VISIBLE,"
    "CONSTRAINT `ocuptime`"
        "FOREIGN KEY (`idtime`)"
        "REFERENCES `richards`.`time` (`idtime`)"
")ENGINE=InnoDB;")
  


 
conn = mysql.connector.connect(host='localhost', user='root')
cur = conn.cursor()
    

"""cnx = mysql.connector.connect(user='root')
cursor = cnx.cursor()"""

def create_database(cur):
    try:
        cur.execute(
            "CREATE DATABASE {} DEFAULT CHARACTER SET 'utf8'".format(dbName))
    except mysql.connector.Error as err:
        print("Failed creating database: {}".format(err))
        exit(1)

try:
    cur.execute("USE {}".format(dbName))
except mysql.connector.Error as err:
    print("Database {} does not exists.".format(dbName))
    if err.errno == errorcode.ER_BAD_DB_ERROR:
        create_database(cur)
        print("Database {} created successfully.".format(dbName))
        conn.database = dbName
    else:
        print(err)
        exit(1)

for table_name in TABLES:
    table_description = TABLES[table_name]
    try:
        print("Creating table {}: ".format(table_name), end='')
        cur.execute(table_description)
    except mysql.connector.Error as err:
        if err.errno == errorcode.ER_TABLE_EXISTS_ERROR:
            print("already exists.")
        else:
            print(err.msg)
    else:
        print("OK")

cur.close()
conn.close()


    



    
