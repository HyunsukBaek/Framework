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

//Custom Script
[] execVM "Custom\statusbar_loop.sqf";//Status Bar Loop
[] execVM "admintools\loop.sqf";//Admin Helper
[] execVM "Custom\dlc_unlocker.sqf";// dlc 없이도 차량/헬기/비행기/JET 탈수 있게 

//by psycho
["%1 --- Executing TcB AIS init.sqf",diag_ticktime] call BIS_fnc_logFormat;
enableSaving [false,false];
enableTeamswitch false;// TcB AIS wont support teamswitch

// TcB AIS Wounding System --------------------------------------------------------------------------

TCB_AIS_PATH = "ais_injury\";
[] spawn {
    {   [_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")}forEach (if (isMultiplayer) then {playableUnits} else {switchableUnits}); // execute for every playable unit

    //{[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")} forEach (units group player);             // only own group - you cant help strange group members

    //{[_x] call compile preprocessFile (TCB_AIS_PATH+"init_ais.sqf")} forEach [p1,p2,p3,p4,p5];              // only some defined units
};

// --------------------------------------------------------------------------------------------------------------

StartProgress = true;
