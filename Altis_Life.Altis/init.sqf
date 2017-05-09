/*
 File: init.sqf
 Author: 
 
 Description:
 
 */
StartProgress = false;

if (hasInterface) then {
    [] execVM "briefing.sqf"; //Load Briefing
};
[] execVM "KRON_Strings.sqf";

//AOSoul Added : Custom Script
[] execVM "AOSoul\statusbar_loop.sqf";//Status Bar Loop
[] execVM "AOSoul\admintools\loop.sqf";//Admin Helper
[] execVM "AOSoul\dlc_unlocker.sqf";// dlc 없이도 차량/헬기/비행기/JET 탈수 있게 
[] execVM "AOSoul\teargas.sqf"; //TearGas
[] execVM "AOSoul\DynWeather.sqf"; // 날씨 
[] execVM "AOSoul\CL.sqf"; //돔 네온
[] execVM "AOSoul\CL2.sqf";
[] execVM "AOSoul\safezone.sqf";//세이프존 
setTerrainGrid 49;
//setViewDistance 1200;
//setObjectViewDistance [1000,50];

//AOSoul Added : sitdown
MAC_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;
    _object switchMove _anim;
};

//AOSoul Added : 상처시스템 
["%1 --- Executing TcB AIS init.sqf",diag_ticktime] call BIS_fnc_logFormat;
enableSaving [false,false];
enableTeamswitch false;// TcB AIS wont support teamswitch
TCB_AIS_PATH = "AOSoul\ais_injury\";
[] spawn {
    {   [_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")}forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits}); // execute for every playable unit

};

//Tow Config
SA_MAX_TOWED_CARGO = 1;
SA_TOW_SUPPORTED_VEHICLES_OVERRIDE = [ "Ship","Car" ];
SA_TOW_RULES_OVERRIDE = [
                        ["Car", "CAN_TOW", "Car"],
                        ["Car", "CAN_TOW", "Air"],
                        ["Car", "CAN_TOW", "Ship"],
                        ["Ship", "CAN_TOW", "Ship"]
                        ];
SA_TOW_LOCKED_VEHICLES_ENABLED = false;
// --------------------------------------------------------------------------------------------------------------
StartProgress = true;
