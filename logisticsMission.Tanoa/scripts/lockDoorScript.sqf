//This srcipt locks the upstairs doors for the various blue xpo buildings in Tanoa
//Written by Andrew Spicher 08/19/2020

//Params
params ["_logic"];

//Get the nearest building to the logic
_building = nearestObject [getPos _logic, "Building"];

//Lock the upstairs door
_building setVariable ['bis_disabled_Door_5',1,true];