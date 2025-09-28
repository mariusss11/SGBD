
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
    ('Carmen', 'Florescu', 'carmen.florescu@gmail.com', '060123465', 'D1234581'),
    ('Elena', 'Popa', 'elena.popa@example.com', '060123458', 'D9876541'),
    ('Victor', 'Rusu', 'victor.rusu@example.com', '060123459', 'D9876542'),
    ('Maria', 'Ciobanu', 'maria.ciobanu@example.com', '060123460', 'D9876543'),
    ('Ion', 'Gheorghe', 'ion.gheorghe@example.com', '060123461', 'D9876544'),
    ('Ana', 'Lupu', 'ana.lupu@example.com', '060123462', 'D9876545'),
    ('Cristian', 'Dumitru', 'cristian.dumitru@example.com', '060123463', 'D9876546'),
    ('Raluca', 'Marin', 'raluca.marin@example.com', '060123464', 'D9876547'),
    ('Daniel', 'Iliescu', 'daniel.iliescu@example.com', '060123465', 'D9876548'),
    ('Gabriela', 'Matei', 'gabriela.matei@example.com', '060123466', 'D9876549'),
    ('Andrei', 'Voicu', 'andrei.voicu@example.com', '060123467', 'D9876550');


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
    ('Kia', 'Niro', 2022, 'QRS555', 'available', 75.00, 2),
    ('Ford', 'Focus', 2021, 'FOC101', 'available', 60.00, 1),
    ('Volkswagen', 'Golf', 2022, 'GLF202', 'available', 70.00, 1),
    ('BMW', '3 Series', 2021, 'BMW303', 'available', 120.00, 2),
    ('Audi', 'A4', 2020, 'AUD404', 'available', 110.00, 2),
    ('Mercedes', 'C-Class', 2022, 'MER505', 'available', 130.00, 2),
    ('Kia', 'Sportage', 2021, 'KIA606', 'available', 80.00, 3),
    ('Hyundai', 'Tucson', 2020, 'HYN707', 'available', 75.00, 3),
    ('Skoda', 'Octavia', 2019, 'SKD808', 'available', 65.00, 1);



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
    ('2025-09-10', '2025-09-14', 300.00, 10, 10, 5),
    ('2025-09-15', '2025-09-19', 200.00, 1, 5, 2),
    ('2025-09-16', '2025-09-20', 240.00, 2, 6, 3),
    ('2025-09-17', '2025-09-21', 280.00, 3, 7, 4),
    ('2025-09-18', '2025-09-22', 320.00, 4, 8, 5),
    ('2025-09-19', '2025-09-23', 260.00, 5, 9, 1),
    ('2025-09-20', '2025-09-24', 300.00, 6, 10, 2),
    ('2025-09-21', '2025-09-25', 220.00, 7, 1, 3),
    ('2025-09-22', '2025-09-26', 360.00, 8, 2, 4),
    ('2025-09-23', '2025-09-27', 400.00, 9, 3, 5),
    ('2025-09-24', '2025-09-28', 280.00, 10, 4, 1),
    ('2025-09-15', '2025-09-18', 180.00, 1, 11, 2),
    ('2025-09-16', '2025-09-20', 280.00, 2, 12, 3),
    ('2025-09-10', '2025-09-12', 240.00, 3, 13, 4),
    ('2025-09-05', '2025-09-10', 550.00, 4, 14, 5),
    ('2025-09-12', '2025-09-15', 390.00, 5, 15, 1),
    ('2025-09-08', '2025-09-14', 480.00, 6, 16, 2),
    ('2025-09-18', '2025-09-20', 150.00, 7, 17, 3),
    ('2025-09-01', '2025-09-08', 455.00, 8, 18, 4);



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