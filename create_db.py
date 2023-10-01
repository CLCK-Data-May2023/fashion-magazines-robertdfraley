import sqlite3
from sqlite3 import Error
from sqlite3 import OperationalError
import os

def create_connection(path_to_db_file: str) -> sqlite3.Connection:
    """ create a database connection to the SQLite database
        specified by db_file
    :param db_file: database file
    :return: Connection object or None
    """
    conn = None
    try:
        conn = sqlite3.connect(path_to_db_file)
        return conn
    except Error as e:
        print(e)

    return conn


def execute_sql(conn: sqlite3.Connection, sql_file: str) -> None:
    """ create a table from the create_table_sql statement
    :param conn: Connection object
    :param sql_file: one or more sql commands
    :return:
    """

    sqlCommands = sql_file.split(';')

    for command in sqlCommands:
        try:
            conn.execute(command)
            conn.commit()
        except OperationalError as msg:
            print("Command skipped: ", msg)
    
    return None


def get_sql(file_path: str) -> str:
    """retrieve the SQL commands from a text file
    @param: file_path - the path to the text file
    @return: str - a string containing the contents of the file"""
    fd = open(file_path, 'r')
    sql = fd.read()
    fd.close()
    return sql


def validate_db(conn: sqlite3.Connection) -> None:
    """validate that the databse was set up correctly
    @param conn: a connection to the database"""
    try:
        result = conn.execute("select * from customers;")
        rows = result.fetchall()
        if len(rows) != 10:
            print('data did not load')
        else:
            print('setup complete')
    except Error as e:
        print(e)


def main() -> None:
    database = "db/fashion_magazines.db"
    create_db_script = "sql/create_db.sql"

    if os.path.exists(database):
        os.remove(database)

    if os.path.exists(database):
        os.remove(database)

    conn = create_connection(database)

    if conn is not None:
        execute_sql(conn, get_sql(create_db_script))
        validate_db(conn)
    conn.close()

    return None


if __name__ == "__main__":
    main()