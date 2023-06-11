-- Create airports table
CREATE TABLE airports (
  id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  city VARCHAR2(50) NOT NULL,
  country VARCHAR2(50) NOT NULL,
  latitude NUMBER(8,5) NOT NULL,
  longitude NUMBER(8,5) NOT NULL,
  timezone VARCHAR2(50),
  rating NUMBER(3,1)
);

-- Create airlines table
CREATE TABLE airlines (
  id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR2(50) NOT NULL,
  headquarters VARCHAR2(50) NOT NULL,
  website VARCHAR2(50) NOT NULL,
  established DATE NOT NULL,
  rating NUMBER(3,1)
);

-- Create flights table
CREATE TABLE flights (
  id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  airline_id NUMBER NOT NULL,
  departure VARCHAR2(50) NOT NULL,
  arrival VARCHAR2(50) NOT NULL,
  origin NUMBER NOT NULL,
  destination NUMBER NOT NULL,
  distance NUMBER(10,2),
  duration_minutes NUMBER,
  price NUMBER(10,2),
  status VARCHAR2(50),
  CONSTRAINT fk_airlines FOREIGN KEY (airline_id) REFERENCES airlines(id),
  CONSTRAINT fk_origin FOREIGN KEY (origin) REFERENCES airports(id),
  CONSTRAINT fk_destination FOREIGN KEY (destination) REFERENCES airports(id)
);

-- Create passengers table
CREATE TABLE passengers (
  id NUMBER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  first_name VARCHAR2(50) NOT NULL,
  last_name VARCHAR2(50) NOT NULL,
  email VARCHAR2(50) NOT NULL,
  phone_number VARCHAR2(15) NOT NULL,
  gender VARCHAR2(10) NOT NULL,
  birthdate DATE NOT NULL
);

-- Create flight_delays table
CREATE TABLE flight_delays (
  flight_id NUMBER NOT NULL,
  delay_minutes NUMBER,
  delay_reason VARCHAR2(100),
  CONSTRAINT fk_flights FOREIGN KEY (flight_id) REFERENCES flights(id)
);

-- Insert data into airports table
INSERT INTO airports (name, city, country, latitude, longitude, timezone, rating) VALUES
  ('John F. Kennedy International Airport', 'New York', 'United States', 40.6413, -73.7781, 'America/New_York', 4.3);

INSERT INTO airports (name, city, country, latitude, longitude, timezone, rating) VALUES
  ('Los Angeles International Airport', 'Los Angeles', 'United States', 33.9416, -118.4085, 'America/Los_Angeles', 4.1);

INSERT INTO airports (name, city, country, latitude, longitude, timezone, rating) VALUES
  ('London Heathrow Airport', 'London', 'United Kingdom', 51.4700, -0.4543, 'Europe/London', 4.4);

INSERT INTO airports (name, city, country, latitude, longitude, timezone, rating) VALUES
  ('Paris-Charles de Gaulle Airport', 'Paris', 'France', 49.0097, 2.5479, 'Europe/Paris', 4.1);

INSERT INTO airports (name, city, country, latitude, longitude, timezone, rating) VALUES
  ('Dubai International Airport', 'Dubai', 'United Arab Emirates', 25.2528, 55.3644, 'Asia/Dubai', 4.4);

-- Insert data into airlines table
INSERT INTO airlines (name, headquarters, website, established, rating)
VALUES
  ('Delta Air Lines', 'Atlanta, Georgia, United States', 'https://www.delta.com/', TO_DATE('1924-05-30', 'YYYY-MM-DD'), 4.2);

INSERT INTO airlines (name, headquarters, website, established, rating)
VALUES
  ('United Airlines', 'Chicago, Illinois, United States', 'https://www.united.com/', TO_DATE('1926-04-06', 'YYYY-MM-DD'), 4.0);

INSERT INTO airlines (name, headquarters, website, established, rating)
VALUES
  ('American Airlines', 'Fort Worth, Texas, United States', 'https://www.aa.com/', TO_DATE('1930-04-15', 'YYYY-MM-DD'), 4.1);

INSERT INTO airlines (name, headquarters, website, established, rating)
VALUES
  ('British Airways', 'Harmondsworth, United Kingdom', 'https://www.britishairways.com/', TO_DATE('1974-04-01', 'YYYY-MM-DD'), 4.3);

INSERT INTO airlines (name, headquarters, website, established, rating)
VALUES
  ('Emirates', 'Dubai, United Arab Emirates', 'https://www.emirates.com/', TO_DATE('1985-03-25', 'YYYY-MM-DD'), 4.5);
-- Insert data into flights table
INSERT INTO flights (airline_id, departure, arrival, origin, destination, distance, duration_minutes, price, status)
VALUES (1, '2023-05-05 08:00:00', '2023-05-05 10:30:00', 1, 2, 3998.0, 150, 300.00, 'On time');

INSERT INTO flights (airline_id, departure, arrival, origin, destination, distance, duration_minutes, price, status)
VALUES (2, '2023-05-05 12:00:00', '2023-05-05 16:00:00', 3, 1, 5560.0, 240, 450.00, 'Delayed');

INSERT INTO flights (airline_id, departure, arrival, origin, destination, distance, duration_minutes, price, status)
VALUES (3, '2023-05-05 09:30:00', '2023-05-05 11:30:00', 2, 4, 361.0, 120, 200.00, 'On time');

INSERT INTO flights (airline_id, departure, arrival, origin, destination, distance, duration_minutes, price, status)
VALUES (1, '2023-05-06 11:00:00', '2023-05-06 13:30:00', 1, 3, 3451.0, 150, 350.00, 'On time');

INSERT INTO flights (airline_id, departure, arrival, origin, destination, distance, duration_minutes, price, status)
VALUES (4, '2023-05-06 08:30:00', '2023-05-06 11:00:00', 4, 1, 3909.0, 150, 400.00, 'On time');

-- Insert data into passengers table
INSERT INTO passengers (first_name, last_name, email, phone_number, gender, birthdate)
VALUES ('John', 'Doe', 'johndoe@example.com', '+1-555-1234', 'Male', TO_DATE('1990-05-12', 'YYYY-MM-DD'));

INSERT INTO passengers (first_name, last_name, email, phone_number, gender, birthdate)
VALUES ('Jane', 'Doe', 'janedoe@example.com', '+1-555-5678', 'Female', TO_DATE('1995-08-27', 'YYYY-MM-DD'));

INSERT INTO passengers (first_name, last_name, email, phone_number, gender, birthdate)
VALUES ('Bob', 'Smith', 'bobsmith@example.com', '+1-555-2468', 'Male', TO_DATE('1975-03-22', 'YYYY-MM-DD'));

INSERT INTO passengers (first_name, last_name, email, phone_number, gender, birthdate)
VALUES ('Alice', 'Johnson', 'alicejohnson@example.com', '+1-555-1357', 'Female', TO_DATE('1984-11-14', 'YYYY-MM-DD'));

INSERT INTO passengers (first_name, last_name, email, phone_number, gender, birthdate)
VALUES ('Mike', 'Williams', 'mikewilliams@example.com', '+1-555-3698', 'Male', TO_DATE('1972-06-30', 'YYYY-MM-DD'));
-- Insert data into flight_delays table
INSERT INTO flight_delays (flight_id, delay_minutes, delay_reason)
VALUES (1, 30, 'Weather');

INSERT INTO flight_delays (flight_id, delay_minutes, delay_reason)
VALUES (2, 60, 'Technical issue');

INSERT INTO flight_delays (flight_id, delay_minutes, delay_reason)
VALUES (3, 0, NULL);

INSERT INTO flight_delays (flight_id, delay_minutes, delay_reason)
VALUES (4, 15, 'Air traffic control');

INSERT INTO flight_delays (flight_id, delay_minutes, delay_reason)
VALUES (5, 0, NULL);

CREATE OR REPLACE PACKAGE flight_management_pkg IS
  -- Procedure to update flight status
  PROCEDURE update_flight_status(p_flight_id IN NUMBER, p_status IN VARCHAR2);
  
  -- Function to calculate the average rating of airlines
  FUNCTION calculate_average_rating RETURN NUMBER;
  
  -- Procedure to handle flight delays
  PROCEDURE handle_flight_delay(p_flight_id IN NUMBER, p_delay_minutes IN NUMBER, p_delay_reason IN VARCHAR2);
END flight_management_pkg;
/

CREATE OR REPLACE PACKAGE BODY flight_management_pkg IS
  -- Procedure to update flight status
  PROCEDURE update_flight_status(p_flight_id IN NUMBER, p_status IN VARCHAR2) IS
  BEGIN
    UPDATE flights SET status = p_status WHERE id = p_flight_id;
    COMMIT;
  END;
  
  -- Function to calculate the average rating of airlines
  FUNCTION calculate_average_rating RETURN NUMBER IS
    l_avg_rating NUMBER;
  BEGIN
    SELECT AVG(rating) INTO l_avg_rating FROM airlines;
    RETURN l_avg_rating;
  END;
  
  -- Procedure to handle flight delays
  PROCEDURE handle_flight_delay(p_flight_id IN NUMBER, p_delay_minutes IN NUMBER, p_delay_reason IN VARCHAR2) IS
  BEGIN
    INSERT INTO flight_delays (flight_id, delay_minutes, delay_reason)
    VALUES (p_flight_id, p_delay_minutes, p_delay_reason);
    COMMIT;
  END;
  
END flight_management_pkg;
/

-- Trigger to update flight status when flight_delays table is modified
CREATE OR REPLACE TRIGGER flight_delay_trigger
AFTER INSERT OR UPDATE ON flight_delays
FOR EACH ROW
BEGIN
  IF :NEW.delay_minutes > 0 THEN
    UPDATE flights SET status = 'Delayed' WHERE id = :NEW.flight_id;
  END IF;
  COMMIT;
END;
  
-- Trigger to insert a default rating when a new airline is added
CREATE OR REPLACE TRIGGER airline_default_rating_trigger
BEFORE INSERT ON airlines
FOR EACH ROW
BEGIN
  :NEW.rating := 0; -- Default rating value
END;
