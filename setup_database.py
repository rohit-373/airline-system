
import sqlite3

# Read the SQL script
with open('database.sql', 'r') as f:
    sql_script = f.read()

# Connect to the database (this will create the file if it doesn't exist)
conn = sqlite3.connect('database.db')

# Create a cursor object
cursor = conn.cursor()

# Execute the script
cursor.executescript(sql_script)

# Commit the changes
conn.commit()

# Verify that the tables were created
cursor.execute("SELECT name FROM sqlite_master WHERE type='table';")
tables = cursor.fetchall()

print("Tables created successfully:")
for table in tables:
    print(table[0])

# Close the connection
conn.close()
