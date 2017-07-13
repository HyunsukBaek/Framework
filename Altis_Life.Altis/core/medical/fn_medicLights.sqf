/*
    File: fn_medicLights.sqf
    Author: mindstorm, modified by Adanteh
    Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow

    Description:
    Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightRed","_lightBlue","_lightGreen","_lightleft","_lightright","_leftRed"];
_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};
_lightRed = [20, 0.1, 0.1];
_lightGreen = [0.1, 20, 0.1];
_lightBlue = [0.1, 0.1, 20];
_lightYellow = [20,20,0.1];

_lightleft = "#lightpoint" createVehicle getPos _vehicle;
sleep 0.2;
//_lightleft setLightColor _lightGreen;
//AOSOUL Added
_lightleft setLightColor _lightGreen;
/////////////////////////////////////
_lightleft setLightBrightness 0.2;
_lightleft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
    case "C_Offroad_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };

    case "C_SUV_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37,-1.2,0.43]];
    };

    case "C_Hatchback_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.35,-0.2,0.25]];
    };

    case "C_Hatchback_01_sport_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.35,-0.2,0.25]];
    };

    case "C_Van_01_box_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.35,-0.2,1]];
    };

    case "B_Heli_Light_01_F":
    {
        _lightleft lightAttachObject [_vehicle,[-0.37, 0.0, -0.80]];
    };

    case "B_Heli_Transport_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
     };

    case "O_Heli_Light_02_unarmed_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
     };

    case "B_Heli_Transport_03_unarmed_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
     };

    case "I_Heli_Transport_02_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
     };

    case "O_Heli_Transport_04_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
     };

    case "I_MRAP_03_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.2]];
    };

    case "B_MRAP_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };

    //AOSOUL Added
    case "B_Quadbike_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };

    case "C_Offroad_02_unarmed_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };

    case "I_Truck_02_medical_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "O_Truck_03_medical_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "I_Truck_02_box_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "O_Truck_03_repair_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_medical_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_Repair_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_mover_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };
    case "O_Heli_Transport_04_repair_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };
    case "O_Heli_Transport_04_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_fuel_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_covered_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_medevac_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    
    case "C_Boat_Civil_01_rescue_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.5, 0.3]];
    };
    
    case "C_Boat_Transport_02_F":
    {
        _lightleft lightAttachObject [_vehicle, [-1.2, 0.5, -0.2]];
    };
    
    case "I_SDV_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.7,1.3,-1.1]];
    };
    ////////////////////////////////////////////////////////
    default 
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };
};

_lightleft setLightAttenuation [0.181, 0, 1000, 130];
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicle getPos _vehicle;
sleep 0.2;
//_lightright setLightColor _lightGreen;
//AOSOUL Added
_lightright setLightColor _lightYellow;
/////////////////////////////////////
_lightright setLightBrightness 0.2;
_lightright setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
    case "C_Offroad_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };

    case "C_SUV_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37,-1.2,0.43]];
    };

    case "C_Hatchback_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.35,-0.2,0.25]];
    };

    case "C_Hatchback_01_sport_F":
    {
        _lightright lightAttachObject [_vehicle, [0.35,-0.2,0.25]];
    };

    case "C_Van_01_box_F":
    {
        _lightright lightAttachObject [_vehicle, [0.35,-0.2,1]];
    };

    case "B_Heli_Light_01_F":
    {
        _lightright lightAttachObject [_vehicle,[0.37, 0.0, -0.80]];
    };

    case "B_Heli_Transport_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };

    case "O_Heli_Light_02_unarmed_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };

    case "B_Heli_Transport_03_unarmed_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
     };

    case "I_Heli_Transport_02_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
     };

    case "O_Heli_Transport_04_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
     };

    case "I_MRAP_03_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.2]];
    };

    case "B_MRAP_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };

    //AOSOUL Added
    case "B_Quadbike_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };

    case "C_Offroad_02_unarmed_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };

    case "I_Truck_02_medical_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "O_Truck_03_medical_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "I_Truck_02_box_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "O_Truck_03_repair_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_medical_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_Repair_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "B_Truck_01_mover_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };
    case "O_Heli_Transport_04_repair_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };
    case "O_Heli_Transport_04_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_fuel_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_covered_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };
    case "O_Heli_Transport_04_medevac_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };
    
    case "C_Boat_Civil_01_rescue_F":
    {
        _lightleft lightAttachObject [_vehicle, [0.5, 0.5, 0.3]];
    };
    
    case "C_Boat_Transport_02_F":
    {
        _lightleft lightAttachObject [_vehicle, [1.2, 0.5, -0.2]];
    };
    
    case "I_SDV_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [0.7,1.3,-1.1]];
    };
    //////////////////////////////////////////////////
    default 
    {
        _lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };
};

_lightright setLightAttenuation [0.181, 0, 1000, 130];
_lightright setLightIntensity 10;
_lightright setLightFlareSize 0.38;
_lightright setLightFlareMaxDistance 150;
_lightright setLightUseFlare true;

//ARE YOU ALL HAPPY?!?!?!?!?!?!?!?!?%#?@WGD?TGD?BN?ZDHBFD?GA
_lightleft setLightDayLight true;
_lightright setLightDayLight true;

_leftRed = true;
while{ (alive _vehicle)} do
{
    if (!(_vehicle getVariable "lights")) exitWith {};
    if (_leftRed) then
    {
        _leftRed = false;
        _lightright setLightBrightness 0.0;
        sleep 0.05;
        _lightleft setLightBrightness 6;
    }
    else
    {
        _leftRed = true;
        _lightleft setLightBrightness 0.0;
        sleep 0.05;
        _lightright setLightBrightness 6;
    };
    sleep (_this select 1);
};
deleteVehicle _lightleft;
deleteVehicle _lightright;