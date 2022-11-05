//This script handles getting and opening packages
//Written by Andrew Spicher 04/04/2020

//Basically a shop script that is currently deployed with the cellphone 08/19/2020

//Parameters
_param = (_this select 3);

//Decide which delivery to send to player
switch (_param) do
{
    //Player orders rifle
    case 0:
    {
      //Check if player has enough money
      if (totalCash >= 1000) then
      {
        hint "Thank you. Your order will be delivered soon";
        phone_0 removeAction 0;
        totalCash = totalCash - 1000;
        sleep 10;
        //Create the package
        box = createVehicle["Land_PaperBox_01_small_closed_brown_F", getPos mailSpot, [], 0, "CAN_COLLIDE"];
        box setDir getDir mailSpot;
        box addAction["Open Package",{_rifle = createVehicle["Weapon_arifle_SPAR_01_blk_F", getPos box, [], 0, "CAN_COLLIDE"]; _sight = createVehicle["Item_optic_Aco", getPos box, [], 0, "CAN_COLLIDE"]; _rifle addMagazineCargo ["30Rnd_556x45_Stanag",3]; deleteVehicle box;}, nil, 1.5, false, true];
      } else
      {
        hint "You cannot afford this";
      };
    };//End case 0

    //Player orders body armor
    case 1:
    {
      //Check if player has enough money
      if (totalCash >= 500) then
      {
        hint "Thank you. Your order will be delivered soon";
        phone_0 removeAction 1;
        totalCash = totalCash - 500;
        sleep 10;
        //Create the package
        box1 = createVehicle["Land_PaperBox_01_small_closed_brown_F", getPos mailSpot, [], 0, "CAN_COLLIDE"];
        box1 setDir getDir mailSpot;
        box1 addAction["Open Package",{_vest = createVehicle["Vest_V_TacVest_blk", getPos box1, [], 0, "CAN_COLLIDE"]; deleteVehicle box1;}, nil, 1.5, false, true];
      } else
      {
        hint "You cannot afford this";
      };
    };//End case 1

    //Player orders backpack
    case 2:
    {
      //Check if player has enough money
      if (totalCash >= 200) then
      {
        hint "Thank you. Your order will be delivered soon";
        phone_0 removeAction 2;
        totalCash = totalCash - 200;
        sleep 10;
        //Create the package
        box2 = createVehicle["Land_PaperBox_01_small_closed_brown_F", getPos mailSpot, [], 0, "CAN_COLLIDE"];
        box2 setDir getDir mailSpot;
        box2 addAction["Open Package",{_pack = createVehicle["B_Kitbag_cbr", getPos box2, [], 0, "CAN_COLLIDE"]; deleteVehicle box2;}, nil, 1.5, false, true];
      } else
      {
        hint "You cannot afford this";
      };
    };//End case 2



};//End switch
