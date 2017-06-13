/*
Created by AOSOUL 2017/06/14
*/

qinuse = "no";
einuse = "no";
_qhand = "no";
_ehand = "no";

blinkerveh = [
"C_Offroad_01_F",
"B_MRAP_01_F",
"C_Van_01_transport_F",
"C_Van_01_box_F",
"C_Hatchback_01_F",
"I_MRAP_03_F",
"B_Truck_01_transport_F",
"B_Truck_01_covered_F",
"B_Truck_01_fuel_F",
"B_Truck_01_ammo_F",
"B_Truck_01_Repair_F",
"B_Truck_01_mover_F",
"B_Truck_01_box_F",
"C_SUV_01_F"
            ];

if (!isnil "keyp") then

{
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", keyp];
};

keybinds =
{
	switch (_this) do 
	{
			case 16:
			{
			if(vehicle player != player && (typeOf vehicle player) in blinkerveh) then {
			if(driver (vehicle player) == player) then {
			[vehicle player] call life_fnc_startIndicatorLeft;
		};
	};
};
					case 18:
					{
					if(vehicle player != player && (typeOf vehicle player) in blinkerveh) then {
					if(driver (vehicle player) == player) then {
					[vehicle player] call life_fnc_startIndicatorRight;
				
				};
			};
		};
	};
};

waituntil {!isnull (finddisplay 46)};
keyp = (findDisplay 46) displayAddEventHandler ["KeyDown", "_this select 1 call keybinds; false;"];