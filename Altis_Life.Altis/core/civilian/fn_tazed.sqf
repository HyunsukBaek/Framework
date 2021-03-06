#include "..\..\script_macros.hpp"
/*
 File: fn_tazed.sqf
 Author: Bryan "Tonic" Boardwine
 Editor: Repentz to improve the function

 Description:
 Starts the tazed animation and broadcasts out what it needs to.
 */
private["_unit","_shooter","_curWep","_curMags","_attach"];
_unit = param [0,Objnull,[Objnull]];
_shooter = param [1,Objnull,[Objnull]];
if(isNull _unit OR isNull _shooter) exitWith {player allowDamage true; life_istazed = false;};
if(player getVariable["restrained",false]) exitWith {};
_time = time;
if(_shooter isKindOf "Man" && alive player) then {
    if(!life_istazed) then {
        player action ["DropWeapon", "GroundWeaponHolder" createVehicle position player, currentWeapon player];
        life_istazed = true;
        "DynamicBlur" ppEffectEnable true;
        "DynamicBlur" ppEffectAdjust [20];
        "DynamicBlur" ppEffectCommit 1;
        player allowDamage false;
        if(isNull objectParent player) then {
            for [ {_x=1}, {_x<=10}, {_x=_x+1}] do {call SOCK_fnc_tazeRagdoll; sleep 0.1; if(animationState player == "unconscious") exitWith {}};
        };
        if (!(count _curMags isEqualTo 0)) then {
            {player addMagazine _x;} forEach _curMags;
        };
        [_unit,"tazerSound",100,1] remoteExecCall ["life_fnc_say3D",RCLIENT];

        _obj = "Land_ClutterCutter_small_F" createVehicle ASLTOATL(visiblePositionASL player);
        _obj setPosATL ASLTOATL(visiblePositionASL player);

        [player,"AinjPfalMstpSnonWnonDf_carried_fallwc"] remoteExecCall ["life_fnc_animSync",RCLIENT];
        [0,"STR_NOTF_Tazed",true,[profileName, _shooter getVariable ["realname",name _shooter]]] remoteExecCall ["life_fnc_broadcast",RCLIENT];
        _unit attachTo [_obj,[0,0,0]];
        disableUserInput true;
        player setDamage 0;
        waitUntil {animationState player != "unconscious"};
        _anim = if(isNull objectParent player) then {"Incapacitated"} else {"kia_driver_mid01"};
        [player,_anim] remoteExec ["life_client_fnc_animSync",0];
        waitUntil {time - _time >= 15};
        player allowDamage true;
        if(!(player getVariable["Escorting",false])) then {
            detach player;
        };
        "DynamicBlur" ppEffectEnable false;
        life_istazed = false;
        disableUserInput false;
        player playMoveNow "amovppnemstpsraswrfldnon";
        player setFatigue 1; // 피로도 소모로 도망 못가게 만들기
        player setdamage 0.6;//달리지 못하게 다리 절게 만들기
    };
} else {
    _unit allowDamage true;
    life_iztazed = false;
};