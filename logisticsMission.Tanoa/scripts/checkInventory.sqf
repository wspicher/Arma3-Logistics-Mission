//This script allows the player to check the plane's inventory
//Written by Andrew Spicher 04/04/2020

//Hint formatted inventory string for player
_startStr = "Plane Cargo:<br/>";
_str = parseText format [_startStr + "<t color = '#34cceb'>Water Unit(s)</t>: " + str planeWater + "<br/><t color = '#34eb8f'>Food Unit(s)</t>: " + str planeFood + "<br/><t color = '#eba834'>Misc Unit(s)</t>: " + str planeMisc + "<br/><t color = '#eb5e34'>Weapon Unit(s)</t>: " + str planeGuns];
hint _str;
