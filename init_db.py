
import sqlite3

# Connect to the database (this will create the file if it doesn't exist)
conn = sqlite3.connect('database.db')
cursor = conn.cursor()

# Read the SQL script
# with open('database.sql', 'r') as f:
#     sql_script = f.read()

# # Execute the script to create the tables
# cursor.executescript(sql_script)

# Read the SQL script to populate flights
with open('populate_flights.sql', 'r') as f:
    sql_script = f.read()

# Execute the script to populate the flights table
cursor.executescript(sql_script)

# Commit the changes and close the connection
conn.commit()
conn.close()

print("Database has been initialized and populated successfully.")
