#include "script_macros.hpp"
/*
    File: initPlayerLocal.sqf
    Author:

    Description:
    Starts the initialization of the player.
*/
if (!hasInterface && !isServer) exitWith {
    [] call compile preprocessFileLineNumbers "\life_hc\initHC.sqf";
}; //This is a headless client.

#define CONST(var1,var2) var1 = compileFinal (if (var2 isEqualType "") then {var2} else {str(var2)})
#define LIFE_SETTINGS(TYPE,SETTING) TYPE(missionConfigFile >> "Life_Settings" >> SETTING)

CONST(BIS_fnc_endMission,BIS_fnc_endMission);
//if (LIFE_SETTINGS(getNumber,"spyGlass_toggle") isEqualTo 1) then {[] execVM "SpyGlass\fn_initSpy.sqf";};

//AOSoul Added
//안전벨트
if (hasInterface) then {
    player addEventHandler ["GetOutMan", {
        life_seatbelt = false;
        [] call life_fnc_hudUpdate;
    }];
};

if (hasInterface) then {
    player addEventHandler ["GetInMan", {
        life_seatbelt = false;
        [] call life_fnc_hudUpdate;
    }];
};

//패스트 로프
#include "AOSoul\SHK_Fastrope.sqf";


//AFAR
sleep 2;
//Makes sure that both TFAR and ACRE2 are not running on the server, and that the AFAR lobby parameter is enabled
if((!isClass(configFile>>"CfgPatches">>"task_force_radio"))&& { (!isClass(configFile>>"CfgPatches">>"acre_main"))&&(AFAR==1)})then {
    #include "AOSoul\AFAR\f.sqf";
    call initAFAR;
};

////////////////////////////////////////////////////
[] execVM "core\init.sqf";
