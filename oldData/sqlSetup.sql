
CREATE DATABASE carsIveOwned;

CREATE USER 'cars'@'localhost' IDENTIFIED BY 'My0ldC4r$';

GRANT ALL ON carsIveOwned.* TO 'cars'@'localhost';

USE carsIveOwned;

CREATE TABLE manufacturers
(
  id INT
  auto_increment,
  name VARCHAR
  (255),
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON
  UPDATE CURRENT_TIMESTAMP,
  deletedAt DATETIME,
  PRIMARY KEY
  (id)
);


  CREATE TABLE vehicleModels
  (
    id INT
    auto_increment,
  name VARCHAR
    (255) NOT NULL,
  manufacturerID INT,
  createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
  updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON
    UPDATE CURRENT_TIMESTAMP,
  deletedAt DATETIME,
  PRIMARY KEY
    (id),
  FOREIGN KEY
    (manufacturerId) REFERENCES manufacturers
    (id)
);

    CREATE TABLE myCars
    (
      id INT
      auto_increment,
year DECIMAL
      (4,0),
currentVehicle ENUM
      ('yes', 'no'),
repurchase ENUM
      ('yes', 'no'),
createdAt DATETIME DEFAULT CURRENT_TIMESTAMP,
updatedAt DATETIME DEFAULT CURRENT_TIMESTAMP ON
      UPDATE CURRENT_TIMESTAMP,
deletedAt DATETIME,
PRIMARY KEY
      (id)
);

      CREATE TABLE myCars2Vehicles
      (
        vehicleModelsId INT,
        myCarsId INT,
        FOREIGN KEY (vehicleModelsId) REFERENCES vehicleModels (id),
        FOREIGN KEY (myCarsId) REFERENCES myCars (id)
      );


      INSERT INTO manufacturers
        (name)
      VALUES
        ("Alfa Romeo");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Audi");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("BMW");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Cadillac");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Chevrolet");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Chrysler");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Dodge");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Fiat");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Ford");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Honda");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Jeep");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Lexus");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Mazda");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Mercedes-Benz");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Mitsubishi");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Nissan");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Plymouth");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Saab");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Suzuki");
      INSERT INTO manufacturers
        (name)
      VALUES
        ("Volkswagen");


      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Spider", 1);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("A4", 2);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("320i", 3);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Catera", 4);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Escalade", 4);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Caprice", 5);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("300C", 6);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("GrandCaravan", 7);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("124Spider", 8);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("X1/9", 8);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Expedition", 9);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Explorer", 9);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Flex", 9);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Prelude", 10);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Cherokee", 11);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Wrangler", 11);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("RX300", 12);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("5", 13);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("RX-7", 13);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("320", 14);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Eclipse", 15);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("OutlanderSport", 15);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Pathfinder", 16);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Pulsar", 16);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Valiant", 17);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("9-3", 18);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Samurai", 19);
      INSERT INTO vehicleModels
        (name, manufacturerId)
      VALUES
        ("Routan", 20);


      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1976, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2005, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1996, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1991, "no", "no");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2007, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1980, "no", "no");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2012, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2008, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1973, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1981, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2003, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1998, "no", "no");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2009, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1984, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1987, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1985, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2003, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2008, "no", "no");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1985, "no", "no");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2003, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1995, "no", "no");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2015, "yes", "no");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2007, "yes", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1985, "no", "no");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1973, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2005, "no", "yes");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (1985, "no", "no");
      INSERT INTO myCars
        (year, currentVehicle, repurchase)
      VALUES
        (2011, "no", "yes");

      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (1, 1);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (2, 2);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (3, 3);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (4, 4);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (5, 5);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (6, 6);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (7, 7);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (8, 8);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (9, 9);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (10, 10);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (11, 11);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (12, 12);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (13, 13);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (14, 14);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (15, 15);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (16, 16);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (17, 17);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (18, 18);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (19, 19);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (20, 20);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (21, 21);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (22, 22);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (23, 23);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (24, 24);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (25, 25);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (26, 26);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (27, 27);
      INSERT INTO myCars2Vehicles
        (myCarsId, vehicleModelsId)
      VALUES
        (28, 28);
