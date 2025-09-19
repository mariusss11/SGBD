
-- USE THE DATABASE
USE EcoCarRental;

INSERT INTO Customer
    (first_name, last_name, email, phone, driver_license)
VALUES
    ('Andrei', 'Popescu', 'andrei.popescu@gmail.com', '060123456', 'D1234572'),
    ('Mihai', 'Georgescu', 'mihai.georgescu@mail.ru', '060123458', 'D1234574'),
    ('Victor', 'Enache', 'victor.enache@yahoo.com', '060123464', 'D1234580'),
    ('Ioana', 'Ionescu', 'ioana.ionescu@gmail.com', '060123457', 'D1234573'),
    ('Adriana', 'Pop', 'adriana.pop@yahoo.com', '060123463', 'D1234579'),
    ('Radu', 'Marin', 'radu.marin@mail.ru', '060123460', 'D1234576'),
    ('Larisa', 'Radu', 'larisa.radu@gmail.com', '060123461', 'D1234577'),
    ('Elena', 'Dumitrescu', 'elena.dumitrescu@mail.ru', '060123459', 'D1234575'),
    ('Stefan', 'Iliescu', 'stefan.iliescu@gmail.com', '060123462', 'D1234578'),
    ('Carmen', 'Florescu', 'carmen.florescu@gmail.com', '060123465', 'D1234581');

INSERT INTO CarType
    (type_name)
VALUES
    ('EV'),
    ('Hybrid'),
    ('Plug-In Hybrid');

INSERT INTO Car
    (make, model, year, license_plate, status, price_per_day, type_id)
VALUES
    ('Toyota', 'Corolla', 2020, 'ABC123', 'available', 50.00, 1),
    ('Honda', 'Civic', 2019, 'DEF456', 'available', 55.00, 1),
    ('Ford', 'Escape', 2021, 'GHI789', 'available', 70.00, 2),
    ('Skoda', 'Octavia', 2021, 'STU901', 'available', 60.00, 1),
    ('Volkswagen', 'Tiguan', 2022, 'VWX234', 'available', 75.00, 3),
    ('Nissan', 'Leaf', 2021, 'EFG111', 'available', 65.00, 1),
    ('Hyundai', 'Ioniq', 2020, 'HIJ222', 'available', 60.00, 1),
    ('Toyota', 'Prius', 2022, 'KLM333', 'available', 70.00, 2),
    ('Mitsubishi', 'Outlander PHEV', 2021, 'NOP444', 'available', 80.00, 3),
    ('Kia', 'Niro', 2022, 'QRS555', 'available', 75.00, 2);


INSERT INTO Staff
    (first_name, last_name, role, email)
VALUES
    ('Cristina', 'Stan', 'Consultant', 'cristina.stan@mail.ru'),
    ('Simona', 'Petrescu', 'Consultant', 'simona.petrescu@mail.ru'),
    ('Vlad', 'Popa', 'Consultant', 'vlad.popa@gmail.com'),
    ('Alexandru', 'Matei', 'Consultant', 'alexandru.matei@mail.ru'),
    ('Gabriela', 'Nistor', 'Manager', 'gabriela.nistor@gmail.com');


INSERT INTO Rental
    (start_date, end_date, total_cost, customer_id, car_id, staff_id)
VALUES
    ('2025-09-01', '2025-09-05', 200.00, 1, 1, 1),
    ('2025-09-02', '2025-09-06', 220.00, 2, 2, 2),
    ('2025-09-03', '2025-09-07', 280.00, 3, 3, 3),
    ('2025-09-04', '2025-09-08', 480.00, 4, 4, 4),
    ('2025-09-05', '2025-09-09', 360.00, 5, 5, 5),
    ('2025-09-06', '2025-09-10', 260.00, 6, 6, 1),
    ('2025-09-07', '2025-09-11', 240.00, 7, 7, 2),
    ('2025-09-08', '2025-09-12', 280.00, 8, 8, 3),
    ('2025-09-09', '2025-09-13', 320.00, 9, 9, 4),
    ('2025-09-10', '2025-09-14', 300.00, 10, 10, 5);

INSERT INTO PaymentType
    (method_name)
VALUES
    ('maib'),
    ('micb'),
    ('mb'),
    ('cash'),
    ('PayPal');

SELECT *
FROM PaymentType;