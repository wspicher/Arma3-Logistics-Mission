//This will control the servicing of the plane
//Written by Andrew Spicher 01/07/2020

//Check the distance, fuel, instances, and player money
if (plane_1 distance2D fuelPhone <= 50 && pCounter == 0 && totalCash >= 100) then
{
    //Anims
    Player playMoveNow "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
    sleep 0.59;
    Player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";

    pCounter = 1;
    hint "Service vehicle imminent";
    sleep 2;
    fuelPhone say3D ["phone", 5];
    fuel_1 engineOn true;
    fuel_1 commandMove getPos plane_1;

    //Remove cash from player
    totalCash = totalCash - 100;
    sleep 18;

    hint "Service complete";
    plane_1 setFuel 1;
    plane_1 setDamage 0;
    fuel_1 commandMove getPos fuel_idle;
    sleep 25;
    fuel_1 engineOn false;
    truck_1 setPos getPos fuel_idle;
    truck_1 setDir getDir fuel_idle;
    pCounter = 0;
}
else
{
  //Display different error message depending on issue
  //Player lacks funds
  if (totalCash < 100) then
  {
      hint "Insufficient funds";
  } else
  {
    //Plane too far from airport
    if (plane_1 distance2D fuelPhone > 50) then
    {
      hint "Aircraft is too far away";
    } else
    {
      //Aircraft service already taking place
      hint "Aircraft service already in progress";
    };
  };

};
