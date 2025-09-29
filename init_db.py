
import sqlite3
import os

db_file = 'database.db'

# Connect to the database
conn = sqlite3.connect(db_file)
cursor = conn.cursor()

# Get a list of all tables
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables = cursor.fetchall()

# Drop each table
for table_name in tables:
    # sqlite_sequence is an internal table used by AUTOINCREMENT, don't drop it manually
    if table_name[0] != 'sqlite_sequence':
        try:
            cursor.execute(f"DROP TABLE IF EXISTS {table_name[0]}")
            print(f"Dropped table {table_name[0]}")
        except sqlite3.Error as e:
            print(f"Error dropping table {table_name[0]}: {e}")

# Commit the table drops
conn.commit()

# --- Execute SQL scripts ---
scripts_to_run = ['database.sql', 'populate_all.sql']

for script_name in scripts_to_run:
    try:
        with open(script_name, 'r') as f:
            sql_script = f.read()
        cursor.executescript(sql_script)
        print(f"Successfully executed {script_name}")
    except IOError:
        print(f"Warning: {script_name} not found, skipping.")
    except sqlite3.Error as e:
        print(f"Error executing {script_name}: {e}")
        # Stop execution if a script fails
        conn.close()
        exit(1)

# Commit the changes and close the connection
conn.commit()
conn.close()

print("Database has been completely reset and repopulated successfully.")
