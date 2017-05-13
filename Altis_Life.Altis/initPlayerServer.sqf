#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)
/*
    File: initPlayerServer.sqf
    Author:

    Description:
    Executed only on server when a player joins mission.
*/
if (LIFE_SETTINGS(getNumber,"player_deathLog") isEqualTo 0) exitWith {};

_this select 0 addMPEventHandler ["MPKilled", {_this call fn_whoDoneIt}];
["EastWind", 0] call BIS_fnc_setPPeffectTemplate;

//AOSoul Added

//견인 시스템
[] execVM "AOSoul\Tow.sqf";
///////////////////////////////////////