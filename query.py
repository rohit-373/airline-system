import sqlite3

conn = sqlite3.connect('database.db')
cursor = conn.cursor()

# Use PRAGMA to get table information
cursor.execute("select * from languages_spoken;")
conn.commit()
schema = cursor.fetchall()

print(*schema, sep='\n')
conn.close()