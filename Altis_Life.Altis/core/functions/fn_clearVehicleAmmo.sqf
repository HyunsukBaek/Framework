#include "..\..\script_macros.hpp"
/*
    File: fn_clearVehicleAmmo.sqf
    Author: Bryan "Tonic" Boardwine

    Description:
    Clears the vehicle of ammo types that we don't want.

    Syntax: _vehicle removeMagazinesTurret [magazineName, turretPath]
    Documentation: https://community.bistudio.com/wiki/removeMagazinesTurret
*/
private ["_vehicle","_veh"];
_vehicle = [_this,0,objNull,[objNull]] call BIS_fnc_param;
if (isNull _vehicle) exitWith {};
_veh = typeOf _vehicle;

if (_veh isEqualTo "B_Boat_Armed_01_minigun_F") then {
    _vehicle removeMagazinesTurret ["200Rnd_40mm_G_belt",[0]];
};

if (_veh isEqualTo "B_APC_Wheeled_01_cannon_F") then {
    _vehicle removeMagazinesTurret ["60Rnd_40mm_GPR_Tracer_Red_shells",[0]];
    _vehicle removeMagazinesTurret ["40Rnd_40mm_APFSDS_Tracer_Red_shells",[0]];
};

if (_veh isEqualTo "O_Heli_Attack_02_black_F") then {
    _vehicle removeMagazinesTurret ["250Rnd_30mm_APDS_shells",[0]];
    _vehicle removeMagazinesTurret ["8Rnd_LG_scalpel",[0]];
    _vehicle removeMagazinesTurret ["38Rnd_80mm_rockets",[0]];
};

if (_veh isEqualTo "B_Heli_Transport_01_F") then {
    _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[1]];
    _vehicle removeMagazinesTurret ["2000Rnd_65x39_Belt_Tracer_Red",[2]];
};

//AOSoul Added
//카이만 800 -> 2500만원으로 올리고 삭제.
//if (_veh isEqualTo "O_Heli_Attack_02_F") then {
//    _vehicle setvehicleammo 0;
//};

//헬켓 무장 // 500 -> 900으로 올리고 삭제. (경찰헬기도 있기때문에 필요)
//if (_veh isEqualTo "I_Heli_light_03_F") then {
//    _vehicle setvehicleammo 0;
//};

//포니 200-> 1100만원으로 올리고 삭제
//if (_veh isEqualTo "B_Heli_Light_01_armed_F") then {
//    _vehicle setvehicleammo 0;
//};

////블랙풋 //클래스명 오류 수정 800->1500만원으로 올림(경찰only)
//if (_veh isEqualTo "B_Heli_Attack_01_F") then {
//    _vehicle setvehicleammo 0;
//};

//JET DLC 가격이 60000000~90000000 이여서 해제해도 될듯. 경찰에도 밸런스 맞게 추가해놨으니.
//if (_veh isEqualTo "O_Plane_Fighter_02_F") then {
//    _vehicle setvehicleammo 0;
//};
//
//if (_veh isEqualTo "O_Plane_Fighter_02_Stealth_F") then {
//    _vehicle setvehicleammo 0;
//};
//
//if (_veh isEqualTo "O_Plane_CAS_02_dynamicLoadout_F") then {
//    _vehicle setvehicleammo 0;
//};
//
//if (_veh isEqualTo "I_Plane_Fighter_04_F") then {
//    _vehicle setvehicleammo 0;
//};
//
//if (_veh isEqualTo "I_Plane_Fighter_03_dynamicLoadout_F") then {
//    _vehicle setvehicleammo 0;
//};
//
//if (_veh isEqualTo "B_Plane_CAS_01_dynamicLoadout_F") then {
//    _vehicle setvehicleammo 0;
//};
//
//if (_veh isEqualTo "B_Plane_Fighter_01_Stealth_F") then {
//    _vehicle setvehicleammo 0;
//};
//
//if (_veh isEqualTo "B_Plane_Fighter_01_F") then {
//    _vehicle setvehicleammo 0;
//};
//
////Xian
//if (_veh isEqualTo "O_T_VTOL_02_infantry_dynamicLoadout_F") then {
//    _vehicle setvehicleammo 0;
//};
//
//if (_veh isEqualTo "O_T_VTOL_02_vehicle_dynamicLoadout_F") then {
//    _vehicle setvehicleammo 0;
//};

clearWeaponCargoGlobal _vehicle;
clearMagazineCargoGlobal _vehicle;
clearItemCargoGlobal _vehicle;
clearBackpackCargoGlobal _vehicle;
