# cars-ive-owned-api

Dave's Garage

This is a list of cars I have owned. (yes, i've owned enough cars to warrant a list)

Currently the list will hold just the following information:
  id
  Make
  Model
  Year
  If it is a currently owned vehicle
  If I would repurchase this vehicle

At a later time I will add manufacturer's model lists and a data about my future hopeful purchases.

Using the API
Getting All Previous Owned Cars
GET http:\\localhost:1337\cars
Getting A List of Cars By Manufacturer
GET http:\\localhost:1337\"manufacturer"
Getting A Car by Model
GET http:\\localhost:1337\"model - without spaces"
Getting A List of Cars Currently Owned
GET https:\\localhost:1337\currentlyowned
Getting A List of Cars I Would Buy Again
GET http:\\localhost:1337\repurchase
Adding A Vehicle To The List
POST http:\\localhost:1337 { "manufacturer": "manufacturer name", "model": "model name", "year": "year manufcatured", "currentVehicle": "yes or no", "repurchase": "yes or no" }
