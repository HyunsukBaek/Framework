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
[] execVM "Custom\statusbar_loop.sqf";  //Status Bar Loop
[] execVM "admintools\loop.sqf";	//Admin Helper
[] execVM "Custom\dlc_unlocker.sqf"; // dlc 없이도 차량/헬기/비행기/JET 탈수 있게 
StartProgress = true;
