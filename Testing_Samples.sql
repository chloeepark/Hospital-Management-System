/*
New Patient Creating Screen Testing Samples
*/

-- Testing Sample 1 : Adding a New Patient to an Unoccupied Room
SET SERVEROUTPUT ON;

DECLARE
    result VARCHAR2(100);
BEGIN
    Add_New_Patient(
        p_id => 9012,
        p_first_name => 'Mark',
        p_last_name => 'Lee',
        p_gender => 'Male',
        p_date_of_birth => TO_DATE('1999-08-02', 'YYYY-MM-DD'),
        p_phone_number => '647-612-9981',
        p_address => '321 Yonge St',
        p_email => 'marklee@gmail.com',
        p_emergency_contact => 'Jane Kim',
        p_room_number => '112',
        p_result => result
    );
    DBMS_OUTPUT.PUT_LINE(result);
END;
/


-- Testing Sample 2 : Attempting to Add a Patient to an Occupied Room
DECLARE
    result VARCHAR2(100);
BEGIN
    Add_New_Patient(
        p_id => 9013,
        p_first_name => 'Yerin',
        p_last_name => 'Baek',
        p_gender => 'Female',
        p_date_of_birth => TO_DATE('1997-06-26', 'YYYY-MM-DD'),
        p_phone_number => '647-342-3212',
        p_address => '321 Main St',
        p_email => 'yerinbaek@gmail.com',
        p_emergency_contact => 'Lucy Park',
        p_room_number => '112',
        p_result => result
    );
    DBMS_OUTPUT.PUT_LINE(result);
END;
/

-- Testing Sample 3 : Handling an error
DECLARE
    result VARCHAR2(100);
BEGIN
    Add_New_Patient(
        p_id => 9013,
        p_first_name => 'Yerin',
        p_last_name => 'Baek',
        p_gender => 'Female',
        p_date_of_birth => TO_DATE('1997-06-26', 'YYYY-MM-DD'),
        p_phone_number => '647-342-3212',
        p_address => '321 Main St',
        p_email => 'yerinbaek@gmail.com',
        p_emergency_contact => 'Lucy Park',
        p_room_number => '113',
        p_result => result
    );
    DBMS_OUTPUT.PUT_LINE(result);
END;
/



/*
Patient Searching Screen Testing Samples
*/

-- Testing Sample 1  :A patient record for Alice Park with the birth date 1985-07-23 exists in the Patients table.

SET SERVEROUTPUT ON;

DECLARE
    cursor_output SYS_REFCURSOR;
    patient_record Patients%ROWTYPE;
    record_found BOOLEAN := FALSE;
BEGIN
    cursor_output := Get_Patient('Alice', 'Johnson', TO_DATE('1985-07-23', 'YYYY-MM-DD'));
    
    LOOP
        FETCH cursor_output INTO patient_record;
        EXIT WHEN cursor_output%NOTFOUND;
        
        record_found := TRUE;
        DBMS_OUTPUT.PUT_LINE('ID: ' || patient_record.id);
        DBMS_OUTPUT.PUT_LINE('First Name: ' || patient_record.first_name);
        DBMS_OUTPUT.PUT_LINE('Last Name: ' || patient_record.last_name);
        DBMS_OUTPUT.PUT_LINE('Gender: ' || patient_record.gender);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || patient_record.date_of_birth);
        DBMS_OUTPUT.PUT_LINE('Phone Number: ' || patient_record.phone_number);
        DBMS_OUTPUT.PUT_LINE('Address: ' || patient_record.address);
        DBMS_OUTPUT.PUT_LINE('Email: ' || patient_record.email);
        DBMS_OUTPUT.PUT_LINE('Emergency Contact: ' || patient_record.emergency_contact);
        DBMS_OUTPUT.PUT_LINE('Room Number: ' || patient_record.room_number);
    END LOOP;
    
    IF NOT record_found THEN
        DBMS_OUTPUT.PUT_LINE('No patient found with the given name and birth date.');
    END IF;
    
    CLOSE cursor_output;
END;
/



-- Testing Sample 2 : No patient record exists for "Alice Park" with the birth date

DECLARE
    cursor_output SYS_REFCURSOR;
    patient_record Patients%ROWTYPE;
    record_found BOOLEAN := FALSE;
BEGIN
    cursor_output := Get_Patient('Alice', 'Park', TO_DATE('1988-01-23', 'YYYY-MM-DD'));

    LOOP
        FETCH cursor_output INTO patient_record;
        EXIT WHEN cursor_output%NOTFOUND;

        record_found := TRUE;
        DBMS_OUTPUT.PUT_LINE('ID: ' || patient_record.id);
        DBMS_OUTPUT.PUT_LINE('First Name: ' || patient_record.first_name);
        DBMS_OUTPUT.PUT_LINE('Last Name: ' || patient_record.last_name);
        DBMS_OUTPUT.PUT_LINE('Gender: ' || patient_record.gender);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || patient_record.date_of_birth);
        DBMS_OUTPUT.PUT_LINE('Phone Number: ' || patient_record.phone_number);
        DBMS_OUTPUT.PUT_LINE('Address: ' || patient_record.address);
        DBMS_OUTPUT.PUT_LINE('Email: ' || patient_record.email);
        DBMS_OUTPUT.PUT_LINE('Emergency Contact: ' || patient_record.emergency_contact);
        DBMS_OUTPUT.PUT_LINE('Room Number: ' || patient_record.room_number);
    END LOOP;

    IF NOT record_found THEN
        DBMS_OUTPUT.PUT_LINE('No patient found with the given name and birth date.');
    END IF;

    CLOSE cursor_output;
END;
/






-- Testing Sample 3 : Multiple patients named "Charlie Brown" exist, but the procedure should only return the one with the exact birth date specified.

DECLARE
    cursor_output SYS_REFCURSOR;
    patient_record Patients%ROWTYPE;
    record_found BOOLEAN := FALSE;
BEGIN
    cursor_output := Get_Patient('Charlie', 'Brown', TO_DATE('1990-11-30', 'YYYY-MM-DD'));

    LOOP
        FETCH cursor_output INTO patient_record;
        EXIT WHEN cursor_output%NOTFOUND;

        record_found := TRUE;
        DBMS_OUTPUT.PUT_LINE('ID: ' || patient_record.id);
        DBMS_OUTPUT.PUT_LINE('First Name: ' || patient_record.first_name);
        DBMS_OUTPUT.PUT_LINE('Last Name: ' || patient_record.last_name);
        DBMS_OUTPUT.PUT_LINE('Gender: ' || patient_record.gender);
        DBMS_OUTPUT.PUT_LINE('Date of Birth: ' || patient_record.date_of_birth);
        DBMS_OUTPUT.PUT_LINE('Phone Number: ' || patient_record.phone_number);
        DBMS_OUTPUT.PUT_LINE('Address: ' || patient_record.address);
        DBMS_OUTPUT.PUT_LINE('Email: ' || patient_record.email);
        DBMS_OUTPUT.PUT_LINE('Emergency Contact: ' || patient_record.emergency_contact);
        DBMS_OUTPUT.PUT_LINE('Room Number: ' || patient_record.room_number);
    END LOOP;

    IF NOT record_found THEN
        DBMS_OUTPUT.PUT_LINE('No patient found with the given name and birth date.');
    END IF;

    CLOSE cursor_output;
END;
/

/*
Appointment Scheduling Screen Testing Samples
*/

-- Testing Sample 1 with scheduling successfully
DECLARE
    V_APPOINTMENT_ID APPOINTMENTS.ID%TYPE := 11;
    V_PATIENT_ID APPOINTMENTS.PATIENT_ID%TYPE := 9001;
    V_DOCTOR_ID APPOINTMENTS.DOCTOR_ID%TYPE := 1001;
    V_STATUS APPOINTMENTS.STATUS%TYPE := 'Scheduled';
    V_APPOINTMENT_DATETIME APPOINTMENTS.APPOINTMENT_DATETIME%TYPE := TO_TIMESTAMP('2024-07-15 15:00:00', 'YYYY-MM-DD HH24:MI:SS');
BEGIN
    INSERT INTO APPOINTMENTS(ID, PATIENT_ID, DOCTOR_ID, STATUS, APPOINTMENT_DATETIME)
        VALUES(V_APPOINTMENT_ID, V_PATIENT_ID, V_DOCTOR_ID, V_STATUS, V_APPOINTMENT_DATETIME);
    COMMIT;
END;


-- Testing Sample 2 with scheduling failed since the duplicate schedule
DECLARE
    V_APPOINTMENT_ID APPOINTMENTS.ID%TYPE := 12;
    V_PATIENT_ID APPOINTMENTS.PATIENT_ID%TYPE := 9001;
    V_DOCTOR_ID APPOINTMENTS.DOCTOR_ID%TYPE := 1001;
    V_STATUS APPOINTMENTS.STATUS%TYPE := 'Scheduled';
    V_APPOINTMENT_DATETIME APPOINTMENTS.APPOINTMENT_DATETIME%TYPE := TO_TIMESTAMP('2024-07-15 10:00:00', 'YYYY-MM-DD HH24:MI:SS');
BEGIN
    INSERT INTO APPOINTMENTS(ID, PATIENT_ID, DOCTOR_ID, STATUS, APPOINTMENT_DATETIME)
        VALUES(V_APPOINTMENT_ID, V_PATIENT_ID, V_DOCTOR_ID, V_STATUS, V_APPOINTMENT_DATETIME);
    COMMIT;
END;



-- Testing Sample 3 with scheduling successfully with different patient and doctor
DECLARE
    V_APPOINTMENT_ID APPOINTMENTS.ID%TYPE := 12;
    V_PATIENT_ID APPOINTMENTS.PATIENT_ID%TYPE := 9006;
    V_DOCTOR_ID APPOINTMENTS.DOCTOR_ID%TYPE := 1006;
    V_STATUS APPOINTMENTS.STATUS%TYPE := 'Scheduled';
    V_APPOINTMENT_DATETIME APPOINTMENTS.APPOINTMENT_DATETIME%TYPE := TO_TIMESTAMP('2024-07-25 10:00:00', 'YYYY-MM-DD HH24:MI:SS');
BEGIN
    INSERT INTO APPOINTMENTS(ID, PATIENT_ID, DOCTOR_ID, STATUS, APPOINTMENT_DATETIME)
        VALUES(V_APPOINTMENT_ID, V_PATIENT_ID, V_DOCTOR_ID, V_STATUS, V_APPOINTMENT_DATETIME);
    COMMIT;
END;


/*
Payments Checking Screen Testing Samples
*/

-- Testing Sample 1
DECLARE
    PATIENT_ID NUMBER := 9001;
    COST_AMOUNT NUMBER;
    PAID_AMOUNT NUMBER;
    REMAIN_AMOUNT NUMBER;
BEGIN
    COST_AMOUNT := PAYMENT_HISTORY.TOTAL_COST(PATIENT_ID);
    PAID_AMOUNT := PAYMENT_HISTORY.TOTAL_PAID(PATIENT_ID);
    REMAIN_AMOUNT := COST_AMOUNT - PAID_AMOUNT;
    
    DBMS_OUTPUT.PUT_LINE('PATIENT ID: ' || PATIENT_ID);
    DBMS_OUTPUT.PUT_LINE('TOTAL COST: ' || COST_AMOUNT);
    DBMS_OUTPUT.PUT_LINE('TOTAL AMOUNT HAVE NOT PAID: ' || REMAIN_AMOUNT);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PAYMENT HISTORY:');
    
    PAYMENT_HISTORY.PAYMENT_INFO(PATIENT_ID);
END;



-- Testing Sample 2
DECLARE
    PATIENT_ID NUMBER := 9007;
    COST_AMOUNT NUMBER;
    PAID_AMOUNT NUMBER;
    REMAIN_AMOUNT NUMBER;
BEGIN
    COST_AMOUNT := PAYMENT_HISTORY.TOTAL_COST(PATIENT_ID);
    PAID_AMOUNT := PAYMENT_HISTORY.TOTAL_PAID(PATIENT_ID);
    REMAIN_AMOUNT := COST_AMOUNT - PAID_AMOUNT;
    
    DBMS_OUTPUT.PUT_LINE('PATIENT ID: ' || PATIENT_ID);
    DBMS_OUTPUT.PUT_LINE('TOTAL COST: ' || COST_AMOUNT);
    DBMS_OUTPUT.PUT_LINE('TOTAL AMOUNT HAVE NOT PAID: ' || REMAIN_AMOUNT);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PAYMENT HISTORY:');
    
    PAYMENT_HISTORY.PAYMENT_INFO(PATIENT_ID);
END;



-- Testing Sample 3
DECLARE
    PATIENT_ID NUMBER := 9010;
    COST_AMOUNT NUMBER;
    PAID_AMOUNT NUMBER;
    REMAIN_AMOUNT NUMBER;
BEGIN
    COST_AMOUNT := PAYMENT_HISTORY.TOTAL_COST(PATIENT_ID);
    PAID_AMOUNT := PAYMENT_HISTORY.TOTAL_PAID(PATIENT_ID);
    REMAIN_AMOUNT := COST_AMOUNT - PAID_AMOUNT;
    
    DBMS_OUTPUT.PUT_LINE('PATIENT ID: ' || PATIENT_ID);
    DBMS_OUTPUT.PUT_LINE('TOTAL COST: ' || COST_AMOUNT);
    DBMS_OUTPUT.PUT_LINE('TOTAL AMOUNT HAVE NOT PAID: ' || REMAIN_AMOUNT);
    DBMS_OUTPUT.PUT_LINE('----------------------------------------------');
    DBMS_OUTPUT.PUT_LINE('PAYMENT HISTORY:');
    
    PAYMENT_HISTORY.PAYMENT_INFO(PATIENT_ID);
END;



/*
Inventory Checking Screen Testing Samples
*/

-- Testing Sample 1
DECLARE
    medicine_name INVENTORY.MEDICINE_NAME%TYPE := 'Amoxicillin';
BEGIN
    CheckInventory(medicine_name);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No inventory data available for the medicine: ' || medicine_name);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;


-- Testing Sample 2
DECLARE
    v_medicine_name INVENTORY.MEDICINE_NAME%TYPE;
    v_stock INVENTORY.STOCK%TYPE;
BEGIN
    -- Query to find the medicine with the highest stock
    SELECT medicine_name, stock
    INTO v_medicine_name, v_stock
    FROM Inventory
    WHERE stock = (SELECT MAX(stock) FROM Inventory);
    -- Output the medicine with the highest stock
    DBMS_OUTPUT.PUT_LINE('Medicine with the highest stock: ' || v_medicine_name);
    DBMS_OUTPUT.PUT_LINE('Stock available: ' || v_stock);
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No inventory records found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;


-- Testing Sample 3
DECLARE
    v_medicine_name INVENTORY.MEDICINE_NAME%TYPE;
    v_stock INVENTORY.STOCK%TYPE;
    v_expiration_date INVENTORY.EXPIRATION_DATE%TYPE;
    v_manufacturer INVENTORY.MANUFACTURER%TYPE;
    v_soonest_expiry_date DATE;
BEGIN
    -- Find the soonest expiry date
    SELECT MIN(expiration_date)
    INTO v_soonest_expiry_date
    FROM Inventory;

    DBMS_OUTPUT.PUT_LINE('Medicine list with the soonest expiry date:');
    DBMS_OUTPUT.PUT_LINE('');
    FOR medicine_rec IN (
        SELECT medicine_name, stock, expiration_date, manufacturer
        FROM Inventory
        WHERE expiration_date = v_soonest_expiry_date
    ) LOOP
        -- Output the medicine details
        DBMS_OUTPUT.PUT_LINE('Medicine Name: ' || medicine_rec.medicine_name);
        DBMS_OUTPUT.PUT_LINE('Stock: ' || medicine_rec.stock);
        DBMS_OUTPUT.PUT_LINE('Expiration Date: ' || TO_CHAR(medicine_rec.expiration_date, 'YYYY-MM-DD'));
        DBMS_OUTPUT.PUT_LINE('Manufacturer: ' || medicine_rec.manufacturer);
        DBMS_OUTPUT.PUT_LINE('------------------------------------------');
    END LOOP;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No medicines found with expiry dates.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;



/*
Inventory updating Screen Testing Samples
*/

-- Testing Sample 1
DECLARE
    v_medicine_name VARCHAR2(50) := 'Ibuprofen';
    v_initial_stock NUMBER;
    v_new_stock NUMBER;
BEGIN
    -- Fetch the initial stock for the medicine
    SELECT stock INTO v_initial_stock FROM Inventory WHERE medicine_name = v_medicine_name;

    -- Insert a new medication record to trigger stock update
    INSERT INTO Medications (IDMEDICATION, MEDICINE_NAME, DOSAGE, MEDICATION_DATE, IDDOCTOR, IDPATIENT, AMOUNT)
    VALUES (IDMEDICATION_SEQ.NEXTVAL, v_medicine_name, 500, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 1001, 9001, 5);

    -- Fetch the new stock for the medicine
    SELECT stock INTO v_new_stock FROM Inventory WHERE medicine_name = v_medicine_name;

    -- Display the stock change and medicine name
    DBMS_OUTPUT.PUT_LINE('Medicine Name: ' || v_medicine_name);
    DBMS_OUTPUT.PUT_LINE('Initial Stock: ' || v_initial_stock);
    DBMS_OUTPUT.PUT_LINE('Stock after Insert: ' || v_new_stock);

    -- Check if stock has decreased by the amount of the new medication
    IF v_new_stock = v_initial_stock - 5 THEN
        DBMS_OUTPUT.PUT_LINE('Stock has been successfully updated.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Stock has failed to update.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No inventory record found for medicine: ' || v_medicine_name);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;


-- Testing Sample 2
DECLARE
    v_initial_stock INVENTORY.STOCK%TYPE;
    v_new_stock INVENTORY.STOCK%TYPE;
    v_medicine_name INVENTORY.MEDICINE_NAME%TYPE := 'Omeprazole';
BEGIN
    -- Retrieve the initial stock before insertion
    SELECT stock INTO v_initial_stock FROM Inventory WHERE medicine_name = v_medicine_name;

    -- Display the initial stock
    DBMS_OUTPUT.PUT_LINE('Medicine Name: ' || v_medicine_name);
    DBMS_OUTPUT.PUT_LINE('Initial Stock: ' || v_initial_stock);

    -- Insert a new medication record that triggers the UpdateInventoryAfterInsert trigger
    INSERT INTO Medications(IDMEDICATION, MEDICINE_NAME, DOSAGE, MEDICATION_DATE, IDDOCTOR, IDPATIENT, AMOUNT)
    VALUES(IDMEDICATION_SEQ.NEXTVAL, v_medicine_name, 20, TO_DATE('2024-08-15', 'YYYY-MM-DD'), 1004, 9005, 10);

    -- Retrieve the new stock after insertion
    SELECT stock INTO v_new_stock FROM Inventory WHERE medicine_name = v_medicine_name;

    -- Display the new stock
    DBMS_OUTPUT.PUT_LINE('New Stock after Insertion: ' || v_new_stock);

    -- Verify if the stock has been updated correctly
    IF v_new_stock = v_initial_stock - 10 THEN
        DBMS_OUTPUT.PUT_LINE('Medication successfully inserted, and inventory updated.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Stock update error.');
    END IF;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No inventory found for the medicine: ' || v_medicine_name);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;
-- Testing Sample 3
DECLARE
    v_medicine_name INVENTORY.MEDICINE_NAME%TYPE := 'Acetaminophen';
    v_stock INVENTORY.STOCK%TYPE := 50;
    v_new_stock INVENTORY.STOCK%TYPE;
BEGIN
    -- Add a new medication to the inventory
    INSERT INTO Inventory (id, medicine_name, stock, expiration_date, manufacturer) 
    VALUES (11, v_medicine_name, v_stock, TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'PainRelief Pharma');

    DBMS_OUTPUT.PUT_LINE('New medication added to inventory: ' || v_medicine_name);

    -- Retrieve the stock before insertion
    SELECT stock INTO v_new_stock FROM Inventory WHERE medicine_name = v_medicine_name;

    -- Display the stock before insertion
    DBMS_OUTPUT.PUT_LINE('Initial Stock: ' || v_new_stock);

    -- Insert a new medication record that triggers the UpdateInventoryAfterInsert trigger
    INSERT INTO Medications(IDMEDICATION, MEDICINE_NAME, DOSAGE, MEDICATION_DATE, IDDOCTOR, IDPATIENT, AMOUNT)
    VALUES(IDMEDICATION_SEQ.NEXTVAL, v_medicine_name, 500, TO_DATE('2024-08-20', 'YYYY-MM-DD'), 1007, 9008, 5);

    -- Retrieve the new stock after insertion
    SELECT stock INTO v_new_stock FROM Inventory WHERE medicine_name = v_medicine_name;

    -- Display the new stock
    DBMS_OUTPUT.PUT_LINE('New Stock after Insertion: ' || v_new_stock);

    -- Verify if the stock has been updated correctly
    IF v_new_stock = v_stock - 5 THEN
        DBMS_OUTPUT.PUT_LINE('Medication successfully inserted, and inventory updated.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Stock update error.');
    END IF;
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('Duplicate inventory entry for the medication: ' || v_medicine_name);
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No inventory found for the medicine: ' || v_medicine_name);
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An unexpected error occurred: ' || SQLERRM);
END;



