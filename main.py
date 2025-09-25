
import os
from flask import Flask, render_template, request, redirect, url_for, g
import sqlite3
import random 

app = Flask(__name__)

DATABASE = 'database.db'

def get_db():
    db = getattr(g, '_database', None)
    if db is None:
        db = g._database = sqlite3.connect(DATABASE)
        db.row_factory = sqlite3.Row
    return db

@app.teardown_appcontext
def close_connection(exception):
    db = getattr(g, '_database', None)
    if db is not None:
        db.close()

@app.route('/')
def index():
    return render_template('index.html')

@app.route('/book_flight')
def book_flight():
    db = get_db()
    cursor = db.execute("SELECT DISTINCT Start_Location FROM Journey UNION SELECT DISTINCT Destination_Location FROM Journey")
    locations = sorted([row[0] for row in cursor.fetchall()])
    return render_template('booking.html', locations=locations)

@app.route('/staff')
def staff():
    return render_template('staff.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        first_name = request.form['first_name']
        middle_name = request.form.get('middle_name')
        last_name = request.form['last_name']
        gender = request.form['gender']
        dob = request.form['dob']
        email = request.form['email']
        phone_numbers = request.form.getlist('phone_numbers[]')

        db = get_db()
        try:
            cursor = db.execute("INSERT INTO Passenger (First_Name, Middle_Name, Last_Name, Gender, Date_of_Birth, Email) VALUES (?, ?, ?, ?, ?, ?)",
                                (first_name, middle_name, last_name, gender, dob, email))
            passenger_id = cursor.lastrowid
            for phone in phone_numbers:
                if phone:
                    db.execute("INSERT INTO Passenger_Phone_Numbers (Passenger_ID, Phone_Numbers) VALUES (?, ?)",
                               (passenger_id, phone))
            db.commit()
            return f"""Registration successful!<br>
                       Passenger ID: {passenger_id}<br>
                       Name: {first_name} {last_name}<br>
                       <a href='/register'>Register another passenger</a>"""
        except sqlite3.Error as e:
            db.rollback()
            return f"Database error: {e}", 500
    return render_template('register.html')

@app.route('/flights', methods=['POST'])
def flights():
    start_location = request.form['start_location']
    destination_location = request.form['destination_location']
    booking_date = request.form['booking_date']

    db = get_db()
    cursor = db.execute("""
        SELECT j.Flight_ID, j.Flight_Number, a.Airline_Name, a.Departure_Time, a.Arrival_Time
        FROM Journey j
        JOIN Airplane a ON j.Airplane_ID = a.Airplane_ID
        WHERE j.Start_Location = ? AND j.Destination_Location = ?
    """, (start_location, destination_location))
    flights_data = cursor.fetchall()

    return render_template('available_flights.html', flights=flights_data, booking_date=booking_date)

@app.route('/passenger_details', methods=['POST'])
def passenger_details():
    flight_id = request.form['flight_id']
    booking_date = request.form['booking_date']

    db = get_db()
    cursor = db.execute("""
        SELECT j.Flight_ID, j.Flight_Number, a.Airline_Name, a.Departure_Time, a.Arrival_Time
        FROM Journey j
        JOIN Airplane a ON j.Airplane_ID = a.Airplane_ID
        WHERE j.Flight_ID = ?
    """, (flight_id,))
    flight_data = cursor.fetchone()

    # Get occupied seats for the current flight and date
    occupied_seats_cursor = db.execute("SELECT Seat_Number FROM Ticket WHERE Flight_ID = ? AND Booking_Date = ?", (flight_id, booking_date,))
    occupied_seats = [row[0] for row in occupied_seats_cursor.fetchall()]

    flight = {
        'flight_id': flight_data['Flight_ID'],
        'flight_number': flight_data['Flight_Number'],
        'airline_name': flight_data['Airline_Name'],
        'departure_time': flight_data['Departure_Time'],
        'arrival_time': flight_data['Arrival_Time'],
        'price_economy': 50*89,
        'price_business': 100*89,
        'price_first': 150*89,
        'occupied_seats': occupied_seats
    }

    return render_template('passenger_details.html', flight=flight, booking_date=booking_date)

@app.route('/payment', methods=['POST'])
def payment():
    # Passenger details
    first_name = request.form['first_name']
    middle_name = request.form.get('middle_name')
    last_name = request.form['last_name']
    gender = request.form['gender']
    dob = request.form['dob']
    email = request.form['email']
    phone_numbers = request.form.getlist('phone_numbers[]')

    # Flight details
    flight_id = request.form['flight_id']
    seat_number = request.form['seat_number']
    selected_class = request.form['class']
    booking_date = request.form['booking_date']
    prices = {'Economy': 50*89, 'Business': 100*89, 'First': 150*89}
    price = prices[selected_class]

    db = get_db()
    try:
        # Register passenger
        cursor = db.execute("INSERT INTO Passenger (First_Name, Middle_Name, Last_Name, Gender, Date_of_Birth, Email) VALUES (?, ?, ?, ?, ?, ?)",
                            (first_name, middle_name, last_name, gender, dob, email))
        passenger_id = cursor.lastrowid

        # Add phone numbers
        for phone in phone_numbers:
            if phone:
                db.execute("INSERT INTO Passenger_Phone_Numbers (Passenger_ID, Phone_Numbers) VALUES (?, ?)",
                           (passenger_id, phone))
        
        db.commit()

        payment_details = {
            'flight_id': flight_id,
            'seat_number': seat_number,
            'class': selected_class,
            'price': price,
            'booking_date': booking_date,
            'passenger_id': passenger_id
        }

        return render_template('payment.html', **payment_details)

    except sqlite3.Error as e:
        db.rollback()
        return f"Database error: {e}", 500

@app.route('/confirmation', methods=['POST'])
def confirmation():
    flight_id = request.form['flight_id']
    seat_number = request.form['seat_number']
    selected_class = request.form['class']
    price = request.form['price']
    payment_.method = request.form['payment_method']
    payment_status = request.form['payment_status']
    booking_date = request.form['booking_date']
    passenger_id = request.form['passenger_id']

    db = get_db()
    try:
        cursor = db.execute("SELECT MAX(Ticket_ID) FROM Ticket")
        last_ticket_id = cursor.fetchone()[0]
        new_ticket_id = (last_ticket_id or 0) + 1

        db.execute("""
            INSERT INTO Ticket (Ticket_ID, Booking_Date, Seat_Number, Class, Price, Payment_Status, Passenger_ID, Flight_ID, Status)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
        """, (new_ticket_id, booking_date, seat_number, selected_class, price, payment_status, passenger_id, flight_id, 'Confirmed'))
        db.commit()

        ticket = {
            'flight_id': flight_id,
            'seat_number': seat_number,
            'class': selected_class,
            'price': price,
            'booking_date': booking_date,
            'payment_status': payment_status,
        }
        return render_template('confirmation.html', ticket=ticket)
    except sqlite3.Error as e:
        db.rollback()
        return f"Database error: {e}", 500

@app.route('/register_staff', methods=['GET', 'POST'])
def register_staff():
    db = get_db()
    if request.method == 'POST':
        try:
            name = request.form['name']
            role = request.form['role']
            email = request.form['email']
            cursor = db.execute("SELECT Airplane_ID FROM Airplane;")
            airplane_ids = [row[0] for row in cursor.fetchall()]
            airplane_id = random.choice(airplane_ids)
            hours = random.randint(20, 60)
            phone_numbers = request.form.getlist('phone_numbers[]')
            languages = request.form.getlist('languages[]')

            cursor = db.execute("INSERT INTO Staff (Name, Role, Email, Airplane_ID, Hours) VALUES (?, ?, ?, ?, ?)",
                               (name, role, email, airplane_id, hours))
            staff_id = cursor.lastrowid

            for phone in phone_numbers:
                if phone.strip():
                    db.execute("INSERT INTO Staff_Phone_Numbers (Staff_ID, Phone_Numbers) VALUES (?, ?)",
                               (staff_id, phone.strip()))

            for lang in languages:
                if lang.strip():
                    db.execute("INSERT INTO Languages_Spoken (Staff_ID, Languages_Spoken) VALUES (?, ?)",
                               (staff_id, lang.strip()))

            db.commit()
            return f"""Staff registration successful!<br>
                       Staff ID: {staff_id}<br>
                       Name: {name}<br>
                       <a href='/register_staff'>Register another staff member</a>"""
        except sqlite3.Error as e:
            db.rollback()
            return f"Database error: {e}", 500
    else:
        cursor = db.execute("SELECT Airplane_ID FROM Airplane")
        airplanes = cursor.fetchall()
        return render_template('register_staff.html', airplanes=airplanes)

@app.route('/view_staff')
def view_staff():
    db = get_db()
    cursor = db.execute("SELECT * FROM Staff")
    staff = cursor.fetchall()
    return render_template('view_staff.html', staff=staff)

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 8080))
    app.run(host='0.0.0.0', port=port, debug=True, use_reloader=False)
