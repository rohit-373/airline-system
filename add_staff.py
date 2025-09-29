
import sqlite3

DATABASE = 'database.db'

def add_staff_details():
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()

    # Clear existing data to prevent duplicates
    cursor.execute("DELETE FROM Staff;")
    cursor.execute("DELETE FROM Staff_Phone_Numbers;")
    cursor.execute("DELETE FROM Languages_Spoken;")

    with open('populate_staff_details.sql', 'r') as f:
        sql_script = f.read()

    cursor.executescript(sql_script)

    conn.commit()
    conn.close()
    print("Staff details added successfully.")

if __name__ == '__main__':
    add_staff_details()
