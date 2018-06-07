/*
    File: fn_copLights.sqf
    Author: mindstorm, modified by Adanteh
    Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow
    
    Description:
    Adds the light effect to cop vehicles, specifically the offroad.
*/

params [
    ["_vehicle", objNull, [objNull]],
    ["_lightTime", 0.22, [0]]
];

if (isNil "_vehicle" || {isNull _vehicle || {!(_vehicle getVariable "lights")}}) exitWith {};
private _lightRed = [20, 0.1, 0.1];
private _lightBlue = [0.1, 0.1, 20];

private _lightLeft = "#lightpoint" createVehicleLocal getPos _vehicle;
sleep 0.2;
_lightLeft setLightColor _lightRed;
_lightLeft setLightBrightness 0.2;
_lightLeft setLightAmbient [0.1,0.1,1];

private _offset = switch (typeOf _vehicle) do {
    case "C_Offroad_01_F": {
        [-0.37, 0.0, 0.56];
    };
    case "B_MRAP_01_F": {
        [-0.37, -1.9, 0.7];
    };
    case "C_SUV_01_F": {
        [-0.37,-1.2,0.42];
    };
    case "C_Hatchback_01_sport_F": {
        [-0.35,-0.2,0.25];
    };
    case "B_Heli_Light_01_F": {
        [-0.37, 0.0, -0.80];
    };
    case "B_Heli_Transport_01_F": {
        [-0.5, 0.0, 0.81];
    };    
    case "B_MRAP_01_hmg_F": //hunter
    {
        [-0.37, -1.9, 0.12];
    };
    case "O_MRAP_02_F": //ifrit
    {
        [-0.37, -1.9, 0.5];
    };
    case "O_MRAP_02_hmg_F"://ifrit
    {
        [-0.37, -1.9, 0.12];
    };
    case "I_MRAP_03_F": //strider
    {
        [-0.37, -1.9, 0.2];
    };
    case "I_MRAP_03_hmg_F": //strider
    {
       [-0.37, -1.9, 0.2];
    };
    case "B_Heli_Light_01_armed_F": //huming
    {
        [-0.37, 0.0, 0.81];
    };
    case "O_Heli_Light_02_unarmed_F": //orca
    {
        [-0.5, 0.0, 0.81];
    };
    case "O_Heli_Light_02_v2_F": //orca
    {
        [-0.5, 0.0, 0.81];
    };
    case "I_Heli_light_03_F": //orca
    {
         [-0.5, 0.0, 0.81];
    };
    case "B_Heli_Attack_01_F": //blackfoot
    {
         [-0.5, 0.0, 0.81];
    };
    case "B_Heli_Transport_03_unarmed_F": // huron
    {
         [-0.5, 0.0, 0.81];
    };
    case "I_Heli_Transport_02_F": //mohawk
    {
         [-0.5, 0.0, 0.81];
    };
    case "O_Heli_Transport_04_F": //taru
    {
         [-0.5, 0.0, 0.81];
    };
    case "C_Boat_Civil_01_police_F":
    {
        [-0.6,-1,0.4];
    };    
    case "C_Boat_Civil_01_rescue_F":
    {
        [-0.6,-1,0.4];
    };    
    case "C_Boat_Transport_02_F":
    {
        [-0.5,-0.8,0.4];
    };    
    case "B_Boat_Armed_01_minigun_F":
    {
        [-1.4,1.5,-1.3];
    };    
    case "O_Boat_Armed_01_hmg_F":
    {
        [-1.4,1.5,-1.3];
    };    
    case "B_SDV_01_F":
    {
        [-0.6,1.5,-1.6];
    };    
    case "O_SDV_01_F":
    {
        [-0.6,1.5,-1.6];
    };    
    case "I_SDV_01_F":
    {
        [-0.6,1.5,-1.6];
    };
};

_lightRight lightAttachObject [_vehicle, _offset];

_lightLeft setLightAttenuation [0.181, 0, 1000, 130];
_lightLeft setLightIntensity 10;
_lightLeft setLightFlareSize 0.38;
_lightLeft setLightFlareMaxDistance 150;
_lightLeft setLightUseFlare true;

private _lightRight = "#lightpoint" createVehicleLocal getPos _vehicle;
sleep 0.2;
_lightRight setLightColor _lightBlue;
_lightRight setLightBrightness 0.2;
_lightRight setLightAmbient [0.1,0.1,1];

_offset = switch (typeOf _vehicle) do {
    case "C_Offroad_01_F": {
        [0.37, 0.0, 0.56];
    };
    case "B_MRAP_01_F": {
        [0.37, -1.9, 0.7];
    };
    case "C_SUV_01_F": {
        [0.37,-1.2,0.42];
    };
    case "C_Hatchback_01_sport_F": {
        [0.35,-0.2,0.25];
    };
    case "B_Heli_Light_01_F": {
        [0.37, 0.0, -0.80];
    };
    case "B_Heli_Transport_01_F": {
        [0.5, 0.0, 0.81];
    };
    case "B_MRAP_01_hmg_F":
    {
        [0.37, -1.9, 0.12];
    };
    case "O_MRAP_02_F":
    {
        [0.37, -1.9, 0.5];
    };
    case "O_MRAP_02_hmg_F":
    {
        [0.37, -1.9, 0.12];
    };
    case "I_MRAP_03_F":
    {
        [0.37, -1.9, 0.2];
    };
    case "I_MRAP_03_hmg_F":
    {
        [0.37, -1.9, 0.2];
    };
    case "B_Heli_Light_01_armed_F": //huming
    {
        [0.37, 0.0, -0.80];
    };
    case "O_Heli_Light_02_unarmed_F":
    {
        [0.5, 0.0, 0.81];
    };
    case "O_Heli_Light_02_v2_F":
    {
        [0.5, 0.0, 0.81];
    };
    case "I_Heli_light_03_F": //hellcat
    {
        [0.5, 0.0, 0.81];
    };
    case "B_Heli_Attack_01_F": //blackfoot
    {
        [0.5, 0.0, 0.81];
    };
    case "B_Heli_Transport_03_unarmed_F": // huron
    {
        [0.5, 0.0, 0.81];
    };
    case "I_Heli_Transport_02_F":
    {
        [0.5, 0.0, 0.81];
    };
    case "O_Heli_Transport_04_F":
    {
        [0.5, 0.0, 0.81];
    };    
    ////////Boat
    case "C_Boat_Civil_01_police_F":
    {
        [0.6,-1,0.4];
    };    
    case "C_Boat_Civil_01_rescue_F":
    {
        [0.6,-1,0.4];
    };    
    case "C_Boat_Transport_02_F":
    {
        [0.5,-0.8,0.4];
    };    
    case "B_Boat_Armed_01_minigun_F":
    {
        [1.4,1.5,-1.3];
    };    
    case "O_Boat_Armed_01_hmg_F":
    {
        [1.4,1.5,-1.3];
    };    
    case "B_SDV_01_F":
    {
        [0.6,1.5,-1.6];
    };    
    case "O_SDV_01_F":
    {
        [0.6,1.5,-1.6];
    };    
    case "I_SDV_01_F":
    {
        [0.6,1.5,-1.6]];
    };
};

_lightRight lightAttachObject [_vehicle, _offset];

_lightRight setLightAttenuation [0.181, 0, 1000, 130];
_lightRight setLightIntensity 10;
_lightRight setLightFlareSize 0.38;
_lightRight setLightFlareMaxDistance 150;
_lightRight setLightUseFlare true;

_lightLeft setLightDayLight true;
_lightRight setLightDayLight true;

private _leftRed = true;
while {alive _vehicle} do {  
    if !(_vehicle getVariable "lights") exitWith {};
    if (_leftRed) then {
        _lightRight setLightBrightness 0.0;
        sleep 0.05;
        _lightLeft setLightBrightness 6;
    } else {
        _lightLeft setLightBrightness 0.0;
        sleep 0.05;
        _lightRight setLightBrightness 6;
    };
    _leftRed = !_leftRed;
    sleep _lightTime;  
};

deleteVehicle _lightLeft;
deleteVehicle _lightRight;
