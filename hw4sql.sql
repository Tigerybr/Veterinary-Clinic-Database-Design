/*POPULATE*/

INSERT INTO owners (OwnerID, OwnerName, OwnerPhone) VALUES
(1, 'Musab Berry', 7115252924),
(2, 'Raheem Grimes', 0536567128),
(3, 'Benny Walter', 7181448131),
(4, 'Storm Pace', 1468837342),
(5, 'Nasir Mac', 9569168210);

INSERT INTO pets
(PetID, OwnerID, PetName, PetBreed, ColorMarkings, DateOfBirth, Gender, NeuteredSpayed, Owners_OwnerID) VALUES
(1, 1, 'Hanako', 'Shiba Inu', 'Orange', '2019-01-02', 'M', 'T', 1),
(2, 2, 'Catch', 'German Shepherd', 'Black, orange', '2019-03-04', 'M', 'F', 2),
(3, 3, 'Pancho', 'Siberian Husky', 'Black, white', '2019-05-06', 'F', 'T', 3),
(4, 4, 'Paquitta', 'Labrador Retriever', 'Yello, orange', '2019-07-08', 'F', 'F', 4),
(5, 5, 'Eliza', 'Samoyed', 'White', '2019-09-10', 'F', 'T', 5);

INSERT INTO classes (ClassID, ClassName, ClassDescription) VALUES
(1, 'Basic Skills', 'Geared toward puppies and rescue dogs with little to no training. These sessions include basic commands 
(sit, stay, come) as well as on-leash training.'),
(2, 'Walk-Train-Play', 'Provides leash training as well as socialization time with other dogs.'),
(3, 'Off Leash Operation', 'Designed for those who want voice and sight compliance for trail walks and large outdoor areas. 
This training consists of classroom and trail sessions to practice skills learned. Need prior basic skills training.');

INSERT INTO trainers (TrainerID, TrainerName) VALUES
(1, 'Shey Ellerbruch'),
(2, 'Marie Ellerbruch');

INSERT INTO trainingevents
(ClassTime, ClassID, PetID, TrainerID, Classes_ClassID, Pets_PetID, Trainers_TrainerID, Pets_Owners_OwnerID) VALUES
('2020-03-01 09:00:00', 1, 5, 2, 1, 5, 2, 5),
('2020-03-01 10:00:00', 1, 4, 1, 1, 4, 1, 4),
('2020-03-01 09:00:00', 1, 3, 2, 1, 3, 2, 3),
('2020-03-01 10:00:00', 1, 2, 1, 1, 2, 1, 2),
('2020-03-02 11:00:00', 2, 4, 2, 2, 4, 2, 4),
('2020-03-03 15:00:00', 2, 3, 1, 2, 3, 1, 3),
('2020-03-04 15:00:00', 2, 2, 2, 2, 2, 2, 2),
('2020-03-05 11:00:00', 2, 1, 1, 2, 1, 1, 1),
('2020-03-01 10:00:00', 3, 1, 2, 3, 1, 2, 1),
('2020-03-08 09:00:00', 3, 1, 1, 3, 1, 1, 1);

/*A list of Owners and Pets showing the owner name, pet name, breed, gender, date of birth*/

SELECT OwnerName, PetName, PetBreed, Gender, DateOfBirth FROM
owners INNER JOIN pets ON owners.OwnerID = pets.OwnerID;

/*A list of Upcomming Training Events showing the date, time, trainer, event type, owner, pet*/

SELECT ClassTime, TrainerName, ClassName, PetName, OwnerName FROM
(SELECT ClassTime, TrainerName, ClassName, PetID FROM
(SELECT ClassTime, TrainerName, ClassID, PetID FROM
(SELECT ClassTime, ClassID, PetID, TrainerID FROM trainingevents) AS tem1, trainers
WHERE tem1.TrainerID = trainers.TrainerID) AS tem2, classes
WHERE tem2.ClassID = classes.ClassID) AS tem3, pets, owners
WHERE tem3.PetID = pets.PetID and pets.OwnerID = owners.OwnerID;