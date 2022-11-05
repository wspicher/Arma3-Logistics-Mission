//This script will handle the transfer of inventory between various airports and the plane
//Written by Andrew Spicher 01/07/2020


//Control structure for loading items
switch (_this select 3) do
{
  //Loading water to plane
  case 0:
  {
    if (planeWater <  4) then
    {
        //Anims
        Player playMoveNow "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
        sleep 0.59;
        Player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";

        planeWater = planeWater + 1;
        hint "Water Cargo Loaded";
    } else
    {
        hint "Water cargo full";
  };//End case 0
};
  //Loading food to plane
  case 1:
  {
    if (planeFood < 4) then
    {
      //Anims
      Player playMoveNow "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
      sleep 0.59;
      Player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";

      planeFood = planeFood + 1;
      hint "Food Cargo Loaded";
    } else
    {
      hint "Food cargo full";
    };
  };//End case 1

  //Load misc items to plane
  case 2:
  {
    if (planeMisc < 4) then
    {
      //Anims
      Player playMoveNow "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
      sleep 0.59;
      Player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";

      planeMisc = planeMisc + 1;
      hint "Misc Cargo Loaded";
    } else
    {
      hint "Misc cargo full";
    };
  };//End case 2

  //Load misc items to plane
  case 3:
  {
    if (planeGuns < 4) then
    {
      //Anims
      Player playMoveNow "AmovPercMstpSnonWnonDnon_AinvPercMstpSnonWnonDnon_Putdown";
      sleep 0.59;
      Player playMoveNow "AinvPercMstpSnonWnonDnon_Putdown_AmovPercMstpSnonWnonDnon";

      planeGuns = planeGuns + 1;
      hint "Weapons Cargo Loaded";
    } else
    {
      hint "Weapons cargo full";
    };
  };//End case 3
};//End switch
