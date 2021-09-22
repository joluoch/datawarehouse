from __future__ import print_function
from datetime import date, datetime, timedelta
import mysql.connector
from mysql.connector import errorcode
import pandas as pd



def DBConnect(dbName=None):
 
    conn = mysql.connector.connect(host='localhost', user='root',database=dbName, buffered=True)
    cur = conn.cursor()
    return conn, cur


def preprocess_df(df: pd.DataFrame) -> pd.DataFrame:

    
    
    try:
        df['timestamp'] = pd.to_datetime(df['timestamp']).dt.date
        
    except KeyError as e:
        print("Error:", e)

    return df

def insert_to_time_table(dbName: str, df: pd.DataFrame, table_name: str) -> None:
    print('=============inserting time data============================')

    conn, cur = DBConnect(dbName)

    df = preprocess_df(df)
    
    for _, row in df.iterrows():
        sqlQuery = f"""INSERT INTO {table_name} (date, dayofweek, hour, minute, seconds)
             VALUES( %s, %s, %s, %s, %s);"""
        data = (row[0], row[8], row[9], row[10], row[11])

        try:
            # Execute the SQL command
            cur.execute(sqlQuery, data)
            # Commit your changes in the database
            conn.commit()
            print("Data Inserted Successfully")
        except Exception as e:
            conn.rollback()
            print("Error: ", e)
    print('=============Time data insert complete===============================')
    return

def insert_to_flow_table(dbName: str, df: pd.DataFrame, table_name: str) -> None:
    print('=============inserting flow data============================')

    conn, cur = DBConnect(dbName)

    df = preprocess_df(df)
    
    for _, row in df.iterrows():
        sqlQuery = f"""INSERT INTO {table_name} (flow1, flow2, flow3, flowtotal)
             VALUES( %s, %s, %s, %s);"""
        data = (row[1], row[3], row[5], row[7])

        try:
            # Execute the SQL command
            cur.execute(sqlQuery, data)
            # Commit your changes in the database
            conn.commit()
            print("Data Inserted Successfully")
        except Exception as e:
            conn.rollback()
            print("Error: ", e)
    return
print('=============flow data insert complete===============================')

def insert_to_occupancy_table(dbName: str, df: pd.DataFrame, table_name: str) -> None:
    print('=============inserting occupancy data============================')

    conn, cur = DBConnect(dbName)

    df = preprocess_df(df)
    
    for _, row in df.iterrows():
        sqlQuery = f"""INSERT INTO {table_name} (occupancy1, occupancy2, occupancy3)
             VALUES( %s, %s, %s);"""
        data = (row[2], row[4], row[6])

        try:
            # Execute the SQL command
            cur.execute(sqlQuery, data)
            # Commit your changes in the database
            conn.commit()
            print("Data Inserted Successfully")
        except Exception as e:
            conn.rollback()
            print("Error: ", e)
    return
print('=============occupancy data insert complete===============================')
if __name__ == "__main__":
    df = pd.read_csv('../data/richards.csv')
    DBConnect('richards')
    insert_to_time_table(dbName='richards', df=df, table_name='time')
    insert_to_flow_table(dbName='richards', df=df, table_name='flow')
    insert_to_occupancy_table(dbName='richards', df=df, table_name='ocuppancy')
    