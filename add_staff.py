
import sqlite3
import random

DATABASE = 'database.db'

def add_staff():
    conn = sqlite3.connect(DATABASE)
    cursor = conn.cursor()

    try:
        # Get all airplane IDs
        cursor.execute("SELECT Airplane_ID FROM Airplane")
        airplane_ids = [row[0] for row in cursor.fetchall()]

        # Generate a random number of staff members
        num_staff = random.randint(10, 20)
        
        indian_names = [
            "Aarav", "Vivaan", "Aditya", "Vihaan", "Arjun", "Sai", "Reyansh", "Ayaan", "Krishna", "Ishaan",
            "Ananya", "Diya", "Saanvi", "Aadhya", "Myra", "Aarohi", "Pari", "Anika", "Riya", "Siya"
        ]

        conn.execute('BEGIN TRANSACTION')

        for _ in range(num_staff):
            name = random.choice(indian_names)
            role = random.choice(['Pilot', 'Co-Pilot', 'Flight Attendant', 'Mechanic'])
            email = f"{name.lower()}@example.com"
            airplane_id = random.choice(airplane_ids) if airplane_ids else None
            hours = random.randint(20, 60)

            cursor.execute("INSERT INTO Staff (Name, Role, Email, Airplane_ID, Hours) VALUES (?, ?, ?, ?, ?)",
                           (name, role, email, airplane_id, hours))
            staff_id = cursor.lastrowid

            # Add phone numbers for the staff
            num_phone_numbers = random.randint(1, 3)
            for _ in range(num_phone_numbers):
                phone_number = f"987654321{random.randint(0, 9)}"
                cursor.execute("INSERT INTO Staff_Phone_Numbers (Staff_ID, Phone_Numbers) VALUES (?, ?)",
                               (staff_id, phone_number))

            # Add languages spoken by the staff
            num_languages = random.randint(1, 3)
            languages = random.sample(['English', 'Hindi', 'Marathi', 'Bengali', 'Tamil', 'Telugu'], num_languages)
            for language in languages:
                cursor.execute("INSERT INTO Languages_Spoken (Staff_ID, Languages_Spoken) VALUES (?, ?)",
                               (staff_id, language))

        conn.commit()
        print(f"Successfully added {num_staff} staff members.")

    except sqlite3.Error as e:
        conn.rollback()
        print(f"Database error: {e}")

    finally:
        conn.close()

if __name__ == '__main__':
    add_staff()
