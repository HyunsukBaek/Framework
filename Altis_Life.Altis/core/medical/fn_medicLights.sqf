/*
    File: fn_medicLights.sqf
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

private _lightGreen = [0.1, 20, 0.1];
private _lightYellow = [20,20,0.1];

_lightLeft = "#lightpoint" createVehicleLocal getPos _vehicle;
sleep 0.2;
_lightLeft setLightColor _lightGreen;
_lightLeft setLightBrightness 0.2;
_lightLeft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do {
    case "C_Offroad_01_F": {
        _lightLeft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };
    case "C_SUV_01_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37,-1.2,0.43]];
    };
    case "C_Hatchback_01_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.35,-0.2,0.25]];
    };
    case "C_Hatchback_01_sport_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.35,-0.2,0.25]];
    };
    case "C_Van_01_box_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.35,-0.2,1]];
    };
    case "B_Heli_Light_01_F":
    {
        _lightLeft lightAttachObject [_vehicle,[-0.37, 0.0, -0.80]];
    };
    case "B_Heli_Transport_01_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "O_Heli_Light_02_unarmed_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "B_Heli_Transport_03_unarmed_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "I_Heli_Transport_02_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "I_MRAP_03_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, -1.9, 0.2]];
    };
    case "B_MRAP_01_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "B_Quadbike_01_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };
    case "C_Offroad_02_unarmed_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };
    case "I_Truck_02_medical_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "O_Truck_03_medical_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "I_Truck_02_box_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "O_Truck_03_repair_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_medical_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_Repair_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_mover_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "O_Heli_Transport_04_repair_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };
    case "O_Heli_Transport_04_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_fuel_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_covered_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_medevac_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };    
    case "C_Boat_Civil_01_rescue_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.5, 0.5, 0.3]];
    };    
    case "C_Boat_Transport_02_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-1.2, 0.5, -0.2]];
    };
    
    case "I_SDV_01_F":
    {
        _lightLeft lightAttachObject [_vehicle, [-0.7,1.3,-1.1]];
    };
};

_lightLeft setLightAttenuation [0.181, 0, 1000, 130];
_lightLeft setLightIntensity 10;
_lightLeft setLightFlareSize 0.38;
_lightLeft setLightFlareMaxDistance 150;
_lightLeft setLightUseFlare true;

_lightRight = "#lightpoint" createVehicleLocal getPos _vehicle;
sleep 0.2;
_lightRight setLightColor _lightYellow;
_lightRight setLightBrightness 0.2;
_lightRight setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do {
    case "C_Offroad_01_F": {
        _lightRight lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };
    case "C_SUV_01_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37,-1.2,0.43]];
    };
    case "C_Hatchback_01_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.35,-0.2,0.25]];
    };
    case "C_Hatchback_01_sport_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.35,-0.2,0.25]];
    };
    case "C_Van_01_box_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.35,-0.2,1]];
    };
    case "B_Heli_Light_01_F":
    {
        _lightRight lightAttachObject [_vehicle,[0.37, 0.0, -0.80]];
    };
    case "B_Heli_Transport_01_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };
    case "O_Heli_Light_02_unarmed_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };
    case "B_Heli_Transport_03_unarmed_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
     };
    case "I_Heli_Transport_02_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
     };
    case "O_Heli_Transport_04_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
     };
    case "I_MRAP_03_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, -1.9, 0.2]];
    };
    case "B_MRAP_01_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "B_Quadbike_01_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };
    case "C_Offroad_02_unarmed_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };
    case "I_Truck_02_medical_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "O_Truck_03_medical_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "I_Truck_02_box_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "O_Truck_03_repair_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_medical_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_Repair_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_mover_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "O_Heli_Transport_04_repair_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };
    case "O_Heli_Transport_04_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_fuel_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_covered_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_medevac_F":
    {
        _lightRight lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };    
    case "C_Boat_Civil_01_rescue_F":
    {
        _lightLeft lightAttachObject [_vehicle, [0.5, 0.5, 0.3]];
    };    
    case "C_Boat_Transport_02_F":
    {
        _lightLeft lightAttachObject [_vehicle, [1.2, 0.5, -0.2]];
    };    
    case "I_SDV_01_F":
    {
        _lightLeft lightAttachObject [_vehicle, [0.7,1.3,-1.1]];
    };
};

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
