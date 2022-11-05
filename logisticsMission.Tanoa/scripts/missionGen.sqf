//This script will handle the delivery of packages
//Written by Andrew Spicher 01/08/2020
//You can only have three delivery tasks at a time

//Generate mission function
genMission =
{
  //Params
  params["_neededWater", "_neededFood", "_neededMisc", "_neededGuns", "_reward"];

  //Variables
  _missionName = "";
  _missionDesc = "";
  _airportText = "";
  _airportLaptop = "";

  //Select a random airport for the mission
  _missionAirport = [0, 1, 2, 3] call BIS_fnc_selectRandom;

  //Find airport name from airport ID number
  switch (_missionAirport) do
  {
      //Aeroport de Tanoa
      case 0:
      {
        _airportText = "Aeroport de Tanoa";
        _airportLaptop = laptop_2;
        airport0Water = 0;
        airport0Food = 0;
        airport0Misc = 0;
        airport0Guns = 0;
      };//End case 0

      //Tuvanaka Airbase
      case 1:
      {
        _airportText = "Tuvanaka Airbase";
        _airportLaptop = laptop_3;
        airport1Water = 0;
        airport1Food = 0;
        airport1Misc = 0;
        airport1Guns = 0;
      };//End case 1

      //Saint-George Airstrip
      case 2:
      {
        _airportText = "Saint-George Airstrip";
        _airportLaptop = laptop_4;
        airport2Water = 0;
        airport2Food = 0;
        airport2Misc = 0;
        airport2Guns = 0;
      };//End case 2

      //Bala Airstrip
      case 3:
      {
        _airportText = "Bala Airstrip";
        _airportLaptop = laptop_5;
        airport3Water = 0;
        airport3Food = 0;
        airport3Misc = 0;
        airport3Guns = 0;
      };//End case 3
  };//End switch

  //Format text
  _missionName = "Delivery to " + _airportText;
  _missionDesc = "The facility at " + _airportText + " is requesting a shippment of:<br></br><t color = '#34cceb'>Water Unit(s)</t>: " + str _neededWater + "<br></br><t color = '#34eb8f'>Food Unit(s)</t>: " + str _neededFood + "<br></br><t color = '#eba834'>Misc Unit(s)</t>: " + str _neededMisc + "<br></br><t color = '#eb5e34'>Weapon Unit(s)</t>: " + str _neededGuns + "<br></br>Payment: $" + str _reward;

  //Check to make sure there are only 3 tasks active at once
  if (taskCounter < 3) then
  {
    //Create delivery task and store in index 0
    _task = Player createSimpleTask [""];
    _task setSimpleTaskDescription [_missionDesc, _missionName, ""];
    _task setTaskState "Created";
    _airportLaptop addAction["Deliver Order: " + str taskCounter, "scripts\missionHandler.sqf", [_task, _neededFood, _neededWater, _neededMisc, _neededGuns, _reward, _airportLaptop, taskCounter], 6, false, true];

    ["taskCreated",["",_missionName]] call BIS_fnc_showNotification;
    taskCounter = taskCounter + 1;
  } else
    {
      ["taskFailed",["","Only Three Orders Can be Active"]] call BIS_fnc_showNotification;
    };
};//End genMission function


//Reward calculator function, will return a 'clean' number
rewardCalculator =
{
  _temp = [600,1000] call BIS_fnc_randomInt;

  while {not (_temp mod 10 == 0)} do
  {
      _temp = [400,700] call BIS_fnc_randomInt;
  };
  _temp
};//End rewardCalculator


//Call genMission
[[1,4] call BIS_fnc_randomInt, [1,4] call BIS_fnc_randomInt, [1,4] call BIS_fnc_randomInt, [1,4] call BIS_fnc_randomInt, call rewardCalculator] spawn genMission;
