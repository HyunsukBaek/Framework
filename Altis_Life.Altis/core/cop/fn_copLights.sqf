/*
    File: fn_copLights.sqf
    Author: mindstorm, modified by Adanteh
    Link: http://forums.bistudio.com/showthread.php?157474-Offroad-Police-sirens-lights-and-underglow

    Description:
    Adds the light effect to cop vehicles, specifically the offroad.
*/
Private ["_vehicle","_lightRed","_lightBlue","_lightleft","_lightright","_leftRed"];
_vehicle = _this select 0;

if (isNil "_vehicle" || isNull _vehicle || !(_vehicle getVariable "lights")) exitWith {};
_lightRed = [20, 0.1, 0.1];
_lightBlue = [0.1, 0.1, 20];

_lightleft = "#lightpoint" createVehicle getPos _vehicle;
sleep 0.2;
_lightleft setLightColor _lightRed;
_lightleft setLightBrightness 0.2;
_lightleft setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
    case "C_Offroad_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, 0.0, 0.56]];
    };

    case "B_MRAP_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.7]];
    };

    case "B_MRAP_01_hmg_F": //hunter
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.12]];
    };

    case "O_MRAP_02_F": //ifrit
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.5]];
    };

    case "O_MRAP_02_hmg_F"://ifrit
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.12]];
    };

    case "I_MRAP_03_F": //strider
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.2]];
    };

    case "I_MRAP_03_hmg_F": //strider
    {
        _lightleft lightAttachObject [_vehicle, [-0.37, -1.9, 0.2]];
    };

    case "C_SUV_01_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.37,-1.2,0.42]];
    };

    case "C_Hatchback_01_sport_F":
    {
        _lightleft lightAttachObject [_vehicle, [-0.35,-0.2,0.25]];
    };

    case "B_Heli_Light_01_F": //huming
    {
        _lightleft lightAttachObject [_vehicle,[-0.37, 0.0, -0.80]];
    };

    case "B_Heli_Light_01_armed_F": //huming
    {
        _lightleft lightAttachObject [_vehicle,[-0.37, 0.0, 0.81]];
    };

    case "B_Heli_Transport_01_F": //ghost hawk
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };

    case "O_Heli_Light_02_unarmed_F": //orca
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };

    case "O_Heli_Light_02_v2_F": //orca
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };

    case "I_Heli_light_03_F": //orca
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };

    case "B_Heli_Attack_01_F": //blackfoot
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };

    case "B_Heli_Transport_03_unarmed_F": // huron
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };

    case "I_Heli_Transport_02_F": //mohawk
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };

    case "O_Heli_Transport_04_F": //taru
    {
        _lightleft lightAttachObject [_vehicle, [-0.5, 0.0, 0.81]];
    };
    
    ////////Boat
    case "C_Boat_Civil_01_police_F":
    {
        _lightright lightAttachObject [_vehicle, [-0.6,-1,0.4]];
    };
    
    case "C_Boat_Civil_01_rescue_F":
    {
        _lightright lightAttachObject [_vehicle, [-0.6,-1,0.4]];
    };
    
    case "C_Boat_Transport_02_F":
    {
        _lightright lightAttachObject [_vehicle, [-0.5,-0.8,0.4]];
    };
    
    case "B_Boat_Armed_01_minigun_F":
    {
        _lightright lightAttachObject [_vehicle, [-1.4,1.5,-1.3]];
    };
    
    case "O_Boat_Armed_01_hmg_F":
    {
        _lightright lightAttachObject [_vehicle, [-1.4,1.5,-1.3]];
    };
    
    case "B_SDV_01_F":
    {
        _lightright lightAttachObject [_vehicle, [-0.6,1.5,-1.6]];
    };
    
    case "O_SDV_01_F":
    {
        _lightright lightAttachObject [_vehicle, [-0.6,1.5,-1.6]];
    };
    
    case "I_SDV_01_F":
    {
        _lightright lightAttachObject [_vehicle, [-0.6,1.5,-1.6]];
    };
};

_lightleft setLightAttenuation [0.181, 0, 1000, 130];
_lightleft setLightIntensity 10;
_lightleft setLightFlareSize 0.38;
_lightleft setLightFlareMaxDistance 150;
_lightleft setLightUseFlare true;

_lightright = "#lightpoint" createVehicle getPos _vehicle;
sleep 0.2;
_lightright setLightColor _lightBlue;
_lightright setLightBrightness 0.2;
_lightright setLightAmbient [0.1,0.1,1];

switch (typeOf _vehicle) do
{
    case "C_Offroad_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, 0.0, 0.56]];
    };

    case "B_MRAP_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.7]];
    };

    case "B_MRAP_01_hmg_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.12]];
    };

   case "O_MRAP_02_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.5]];
    };

    case "O_MRAP_02_hmg_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.12]];
    };

    case "I_MRAP_03_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.2]];
    };

    case "I_MRAP_03_hmg_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37, -1.9, 0.2]];
    };

    case "C_SUV_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.37,-1.2,0.42]];
    };

    case "C_Hatchback_01_sport_F":
    {
        _lightright lightAttachObject [_vehicle, [0.35,-0.2,0.25]];
    };

    case "B_Heli_Light_01_F":
    {
        _lightright lightAttachObject [_vehicle,[0.37, 0.0, -0.80]];
    };

    case "B_Heli_Light_01_armed_F": //huming
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

    case "O_Heli_Light_02_v2_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };

    case "I_Heli_light_03_F": //hellcat
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };

    case "B_Heli_Attack_01_F": //blackfoot
    {
        _lightright lightAttachObject [_vehicle, [0.5, 0.0, 0.81]];
    };

    case "B_Heli_Transport_03_unarmed_F": // huron
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
    
    ////////Boat
    case "C_Boat_Civil_01_police_F":
    {
        _lightright lightAttachObject [_vehicle, [0.6,-1,0.4]];
    };
    
    case "C_Boat_Civil_01_rescue_F":
    {
        _lightright lightAttachObject [_vehicle, [0.6,-1,0.4]];
    };
    
    case "C_Boat_Transport_02_F":
    {
        _lightright lightAttachObject [_vehicle, [0.5,-0.8,0.4]];
    };
    
    case "B_Boat_Armed_01_minigun_F":
    {
        _lightright lightAttachObject [_vehicle, [1.4,1.5,-1.3]];
    };
    
    case "O_Boat_Armed_01_hmg_F":
    {
        _lightright lightAttachObject [_vehicle, [1.4,1.5,-1.3]];
    };
    
    case "B_SDV_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.6,1.5,-1.6]];
    };
    
    case "O_SDV_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.6,1.5,-1.6]];
    };
    
    case "I_SDV_01_F":
    {
        _lightright lightAttachObject [_vehicle, [0.6,1.5,-1.6]];
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