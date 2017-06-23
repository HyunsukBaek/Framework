/*
    Made by AOSOUl
    20170622
*/
#include "..\..\script_macros.hpp"
private ["_vehicle"];
_vehicle = param [0,objNull,[objNull]];

if (isNull _vehicle) exitWith {};
if (isNil {_vehicle getVariable "Stop_P"}) exitWith {};

for "_i" from 0 to 1 step 0 do {
    if (!(_vehicle getVariable "Stop_P")) exitWith {};
    if (count crew _vehicle isEqualTo 0) then {_vehicle setVariable ["Stop_P",false,true]};
    if (!alive _vehicle) exitWith {};
    if (isNull _vehicle) exitWith {};
    _vehicle say3D "CopPrisonSong";//Class name specified in description.ext
    sleep 77;//Exactly matches the length of the audio file.
    if (!(_vehicle getVariable "Stop_P")) exitWith {};
};