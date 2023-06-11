# Flight Management Database Project

## 1. Problem Description

The flight management database project aims to create a database schema that can store information related to airports, airlines, flights, passengers, and flight delays. The purpose of this database is to facilitate the management and tracking of flights, passengers, and delays.

The database consists of five main tables:
- `airports`: Stores information about airports, including their name, city, country, latitude, longitude, timezone, and rating.
- `airlines`: Stores information about airlines, including their name, headquarters, website, establishment date, and rating.
- `flights`: Stores information about flights, including the airline, departure, arrival, origin airport, destination airport, distance, duration, price, and status.
- `passengers`: Stores information about passengers, including their first name, last name, email, phone number, gender, and birthdate.
- `flight_delays`: Stores information about flight delays, including the flight ID, delay minutes, and delay reason.

The database also includes several procedures, functions, and triggers to enhance its functionality, such as updating flight status, calculating average airline ratings, handling flight delays, and automating certain tasks.

## 2. Conceptual Model Diagram

The conceptual model diagram for the flight management database project is as follows:

![Diagram][(/diagram.png)](https://github.com/tayyipcanbay/Databases-and-Warehouses/blob/main/diagram.png)

## 3. Description of Tables

- `airports`: This table stores information about airports. It has columns such as `id`, `name`, `city`, `country`, `latitude`, `longitude`, `timezone`, and `rating`.

- `airlines`: This table stores information about airlines. It has columns such as `id`, `name`, `headquarters`, `website`, `established`, and `rating`.

- `flights`: This table stores information about flights. It has columns such as `id`, `airline_id`, `departure`, `arrival`, `origin`, `destination`, `distance`, `duration_minutes`, `price`, and `status`.

- `passengers`: This table stores information about passengers. It has columns such as `id`, `first_name`, `last_name`, `email`, `phone_number`, `gender`, and `birthdate`.

- `flight_delays`: This table stores information about flight delays. It has columns such as `flight_id`, `delay_minutes`, and `delay_reason`.

## 4. Optimization through Views, Indexes, and Synonyms

In this project, we can optimize the database performance by utilizing views, indexes, and synonyms. Here are some potential optimizations:

- Views: Views can be created to simplify complex queries or provide a predefined subset of data for specific purposes.

- Indexes: Indexes can be created on columns frequently used in search conditions to speed up query execution.

- Synonyms: Synonyms can be created to provide alternative names for database objects, making it easier to write and read SQL queries.

## 5. Description of Procedures, Functions, Packages, and Triggers

The flight management database project includes several procedures, functions, packages, and triggers to enhance functionality and automate certain tasks. Here's a description of these database objects:

- `flight_management_pkg`: This package contains subprograms such as `update_flight_status`, `calculate_average_rating`, and `handle_flight_delay`.

- `flight_delay_trigger`: This trigger is executed after the insertion or update of rows in the `flight_delays` table.

- `airline_default_rating_trigger`: This trigger is executed before the insertion of a row in the `airlines` table.
