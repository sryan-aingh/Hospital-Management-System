from flask import Flask, render_template, request, redirect
import mysql.connector
import random
from datetime import datetime

app = Flask(__name__)

db = mysql.connector.connect(
    host="localhost",
    user="root",
    password="12345678",   # <-- change this
    database="hospital"
)

@app.route('/')
def home():
    return render_template('index.html')

@app.route('/book', methods=['GET', 'POST'])
def book():
    cursor=db.cursor()
    cursor.execute("SELECT staff_id, first_name, last_name FROM Staff WHERE role='Doctor'")
    
    doctors = cursor.fetchall()
    
    if request.method == 'POST':
        name = request.form['name']
        age = request.form['age']
        phone = request.form['phone']
        staff_id = request.form['staff_id']
        date = request.form['date']
        time = request.form['time']

        # 🔢 Generate random request_id (8-10 chars)
        request_id = datetime.now().strftime("%d%m%y%H%M%S")    

        cursor.execute("""
            INSERT INTO appointment_requests
            (request_id, patient_name, patient_age, patient_contact, staff_id, requested_date, status, time)
            VALUES (%s, %s, %s, %s, %s, %s, 'Pending', %s)
        """, (request_id, name, age, phone, staff_id, date, time))

        db.commit()

        return f"Appointment Request Submitted! ID: {request_id}"

    return render_template('book.html',doctors=doctors)

@app.route('/admin', methods=['GET', 'POST'])
def admin():
    if request.method == 'POST':
        username = request.form['username']
        password = request.form['password']

        cursor = db.cursor()
        cursor.execute("""
            SELECT * FROM Admin 
            WHERE username=%s AND password=%s
        """, (username, password))

        admin = cursor.fetchone()

        if admin:
            return redirect('/dashboard')
        else:
            return "Invalid Credentials"

    return render_template('admin_login.html')

@app.route('/dashboard')
def dashboard():
    cursor = db.cursor()

    cursor.execute("""
        SELECT ar.request_id, ar.patient_name, ar.requested_date, ar.time,
               s.first_name, s.last_name
        FROM appointment_requests ar
        JOIN Staff s ON ar.staff_id = s.staff_id
        WHERE ar.status = 'Pending'
    """)

    requests = cursor.fetchall()

    cursor.execute("SELECT staff_id, first_name, last_name, role, specialization FROM Staff")
    staff = cursor.fetchall()

    return render_template('dashboard.html', requests=requests, staff=staff)

@app.route('/approve/<request_id>')
def approve(request_id):
    cursor = db.cursor()

    # 1️⃣ Get request data
    cursor.execute("""
        SELECT request_id, staff_id, patient_name, requested_date, time
        FROM appointment_requests
        WHERE request_id = %s
    """, (request_id,))

    data = cursor.fetchone()

    # 2️⃣ Insert into appointments
    cursor.execute("""
        INSERT INTO appointments
        (appointment_id, request_id, staff_id, patient_name, appointment_date, time, attendance_status)
        VALUES (%s, %s, %s, %s, %s, %s, 'Not Attended')
    """, (
        request_id,   # using same id for simplicity
        data[0],
        data[1],
        data[2],
        data[3],
        data[4]
    ))

    # 3️⃣ Update request status
    cursor.execute("""
        UPDATE appointment_requests
        SET status = 'Approved'
        WHERE request_id = %s
    """, (request_id,))

    db.commit()

    return redirect('/dashboard')
@app.route('/reject/<request_id>')
def reject(request_id):
    cursor = db.cursor()

    cursor.execute("""
        UPDATE appointment_requests
        SET status = 'Rejected'
        WHERE request_id = %s
    """, (request_id,))

    db.commit()

    return redirect('/dashboard')

    
    
@app.route('/status', methods=['GET', 'POST'])
def check_status():
    data = None
    approved_data = None

    if request.method == 'POST':
        request_id = request.form['request_id']
        cursor = db.cursor()

        # 🔹 Get request details + doctor name
        cursor.execute("""
            SELECT ar.patient_name, ar.requested_date, ar.time, ar.status,
                   s.first_name, s.last_name
            FROM appointment_requests ar
            JOIN Staff s ON ar.staff_id = s.staff_id
            WHERE ar.request_id = %s
        """, (request_id,))

        data = cursor.fetchone()

        # 🔹 If approved, fetch final appointment
        if data and data[3] == 'Approved':
            cursor.execute("""
                SELECT appointment_date, time
                FROM appointments
                WHERE request_id = %s
            """, (request_id,))

            approved_data = cursor.fetchone()

    return render_template('status.html', data=data, approved_data=approved_data)




if __name__ == '__main__':
    app.run(debug=True)