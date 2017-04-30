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
[] execVM "admintools\loop.sqf";//Admin Helper
[] execVM "AOSoul\dlc_unlocker.sqf";// dlc 없이도 차량/헬기/비행기/JET 탈수 있게 

//AOSoul Added : 상처시스템 
["%1 --- Executing TcB AIS init.sqf",diag_ticktime] call BIS_fnc_logFormat;
enableSaving [false,false];
enableTeamswitch false;// TcB AIS wont support teamswitch
TCB_AIS_PATH = "AOSoul\ais_injury\";
[] spawn {
    {   [_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")}forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits}); // execute for every playable unit

};

//AOSoul Added : sitdown
AOSoul_fnc_switchMove = {
    private["_object","_anim"];
    _object = _this select 0;
    _anim = _this select 1;
    _object switchMove _anim;
};
// --------------------------------------------------------------------------------------------------------------

StartProgress = true;
