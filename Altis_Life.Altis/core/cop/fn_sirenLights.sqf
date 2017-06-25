#include "..\..\script_macros.hpp"
/*
    File: fn_sirenLights.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Lets play a game! Can you guess what it does? I have faith in you, if you can't
    then you have failed me and therefor I lose all faith in humanity.. No pressure.
*/
private ["_vehicle"];
_vehicle = param [0,objNull,[objNull]];
if (isNull _vehicle) exitWith {}; //Bad entry!
if (!(typeOf _vehicle in ["C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","B_MRAP_01_F","B_Truck_01_Repair_F","I_Truck_02_covered_F","B_Truck_01_ammo_F","I_MRAP_03_F","B_MRAP_01_hmg_F","O_MRAP_02_hmg_F","I_MRAP_03_hmg_F","B_Heli_Light_01_F","B_Heli_Transport_03_unarmed_F","B_Heli_Transport_01_F","O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F","O_Heli_Transport_04_F","I_Heli_light_03_F","O_Heli_Light_02_v2_F","B_Heli_Light_01_armed_F","B_Heli_Attack_01_F","O_Heli_Attack_02_black_F","B_Boat_Transport_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","C_Boat_Transport_02_F","B_Boat_Armed_01_minigun_F","O_Boat_Armed_01_hmg_F","B_SDV_01_F","O_SDV_01_F","I_SDV_01_F"])) exitWith {}; //Last chance check to prevent something from defying humanity and creating a monster.

_trueorfalse = _vehicle getVariable ["lights",false];

if (_trueorfalse) then {
    _vehicle setVariable ["lights",false,true];
} else {
    _vehicle setVariable ["lights",true,true];
    [_vehicle,0.22] remoteExec ["life_fnc_copLights",RCLIENT];
};