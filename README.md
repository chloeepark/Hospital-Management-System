# 🏥 Hospital Management System

## Project Overview
The **Hospital Management System (HMS)** streamlines hospital processes such as patient records, appointment scheduling, treatment management, medication handling, billing, and inventory tracking. This system aims to enhance hospital efficiency and improve patient care.

## Technologies Used
- **Database**: Oracle SQL
- **Languages**: SQL, PL/SQL
- **Tools**: Oracle SQL Developer (or preferred IDE)

## Features
- **Patient Management**: Add, update, and view patient records.
- **Appointment Management**: Schedule, reschedule, and cancel appointments.
- **Treatment & Medication**: Track treatments and manage medication inventory.
- **Billing**: Generate bills and track payments.
- **Inventory Management**: Track medicine stock levels.
- **Reporting**: Generate various hospital reports (patients, appointments, billing, inventory).

## Group Members
- **Yanyun Feng** 
- **Eunseo Park**
- **Adilet Masalbekov**

## Database Design
### Key Tables:
1. **Doctors**: Stores doctor details (name, department, specialty).
2. **Appointments**: Manages doctor-patient appointments.
3. **Insurance**: Tracks patient insurance details.
4. **Inventory**: Manages medicine stock levels.
5. **Treatments**: Records treatments for patients.
6. **Medications**: Tracks prescribed medications.
7. **Payments**: Tracks payments for treatments.
8. **Patients**: Stores patient details (name, contact, insurance).

## Mockups
- **New Patient Creation Screen**: Input new patient info.
- **Patient Search**: Find patient records.
- **Appointment Scheduling**: Schedule appointments with doctors.
- **Payment History**: View payment status and history.
- **Inventory Management**: Check and update inventory.

## ER Diagram
> Include ERD image or link to the file showing table relationships.

## File Structure
```bash
📁 sql/
├── create_tables.sql
├── insert_sample_data.sql
├── procedures.sql
├── triggers.sql
├── erd.png
```

## Notes
This project is backend-focused, designed for educational purposes to demonstrate SQL database design, triggers, stored procedures, and team collaboration.
