#include "..\..\script_macros.hpp"
/*
    File: fn_cellphone.sqf
    Author: Alan

    Description:
    Opens the cellphone menu?
*/
private ["_display","_units","_type","_selection"];

disableSerialization;
waitUntil {!isNull findDisplay 3000};
_display = findDisplay 3000;
_units = _display displayCtrl 3004;
_selection = 0;

ctrlSetText [3003, ""];
lbClear _units;

if((FETCH_CONST(life_coplevel) > 2 ) || (FETCH_CONST(life_adminlevel) > 0 ) || (FETCH_CONST(life_medicLevel) > 3) )  then {
	ctrlShow[3020,true];
    ctrlShow[3021,true];
} else{
    ctrlShow[3020,false];
    ctrlShow[3021,false];
};
{
    if (alive _x && !(_x isEqualTo player)) then {
        _type = switch (side _x) do {
            case west: {"Cop"};
            case civilian: {"Civ"};
            case independent: {"Med"};
        };
        _units lbAdd format ["%1 (%2)",_x getVariable ["realname",name _x],_type];
        _units lbSetData [(lbSize _units)-1,str(_x)];
        if (life_recentText != "") then {  
            if((_x getVariable ["realname",name _x]) == life_recentText) then {  
                _selection = ((lbSize _units)-1);  
            };  
        };
    };
} forEach playableUnits;

lbSetCurSel [3004,_selection];