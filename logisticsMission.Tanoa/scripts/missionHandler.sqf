//Script by Andrew Spicher on 01/25/2020
//This script handles the delivery of various items and the finalization of player tasks

//Parameters
_missionParams = (_this select 3);

//Variables
_task = (_missionParams select 0);
_neededFood = (_missionParams select 1);
_neededWater = (_missionParams select 2);
_neededMisc = (_missionParams select 3);
_neededGuns = (_missionParams select 4);
_reward = (_missionParams select 5);
_airportLaptop = (_missionParams select 6);
_orderNumber = (_missionParams select 7);

//Check the plane for the required number of items and then clear it
//If the player does not meet the delivery requirements

//Check if the plane is close enough to the mission laptop
if (plane_1 distance _airportLaptop > 40) then
{
    ["taskFailed",["","Unable to Deliver Order:<br></br>Plane is too far away"]] call BIS_fnc_showNotification;
} else
{
  if(planeWater < _neededWater || planeFood < _neededFood || planeMisc < _neededMisc || planeGuns < _neededGuns) then
  {
    ["taskFailed",["","Unable to Deliver Order:<br></br>Missing Items"]] call BIS_fnc_showNotification;
  } //If the requirements are met
  else
  {
    //check and Empty plane
    if (planeWater > 0) then
    {
      planeWater = planeWater - _neededWater;
    };
    if (planeFood > 0) then
    {
      planeFood = planeFood - _neededFood;
    };
    if (planeMisc > 0) then
    {
      planeMisc = planeMisc - _neededMisc;
    };
    if (planeGuns > 1) then
    {
      planeGuns = planeGuns - _neededGuns;
    };

    //Give player reward
    totalCash = totalCash + _reward;

    //Complete/ delete task, remove action from laptop
    _task setTaskState "Succeeded";
    Player removeSimpleTask _task;
    ["taskSucceeded",["","Deliver Order: " + str _orderNumber + " Completed"]] call BIS_fnc_showNotification;
    _airportLaptop removeAction 0;

  };//End if
};//End position check if
