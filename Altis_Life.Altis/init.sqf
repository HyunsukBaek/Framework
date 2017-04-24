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

StartProgress = true;
