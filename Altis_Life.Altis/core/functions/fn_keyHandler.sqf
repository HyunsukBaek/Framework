#include "..\..\script_macros.hpp"
/*
 *    File: fn_keyHandler.sqf
 *    Author: Bryan "Tonic" Boardwine
 *
 *    Description:
 *    Main key handler for event 'keyDown'.
 */
private ["_handled","_shift","_alt","_code","_ctrl","_alt","_ctrlKey","_veh","_locked","_interactionKey","_mapKey","_interruptionKeys"];
_ctrl = _this select 0;
_code = _this select 1;
_shift = _this select 2;
_ctrlKey = _this select 3;
_alt = _this select 4;
_speed = speed cursorObject;
_handled = false;

_interactionKey = if (count (actionKeys "User10") isEqualTo 0) then {219} else {(actionKeys "User10") select 0};
_mapKey = (actionKeys "ShowMap" select 0);
//hint str _code;
_interruptionKeys = [17,30,31,32];//A,S,W,D

//Vault handling...
if ((_code in (actionKeys "GetOver") || _code in (actionKeys "salute") || _code in (actionKeys "Throw") || _code in (actionKeys "GetIn") || _code in (actionKeys "GetOut") || _code in (actionKeys "Fire") || _code in (actionKeys "ReloadMagazine") || _code in [16,18]) && ((player getVariable ["restrained",false]) || (player getVariable ["playerSurrender",false]) || life_isknocked || life_istazed)) exitWith {
    true;
};

//AOSoul Added sitdown
if(life_sitting) then {
    if (_code in (actionKeys "MoveForward")) then {
        [] execVM "AOSoul\Chair\standup.sqf";
        _handled = true;
    };
};

if (life_action_inUse) exitWith {
    if (!life_interrupted && _code in _interruptionKeys) then {life_interrupted = true;};
    _handled;
};

//Hotfix for Interaction key not being able to be bound on some operation systems.
if (!(count (actionKeys "User10") isEqualTo 0) && {(inputAction "User10" > 0)}) exitWith {
    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    if (!life_action_inUse) then {
        [] spawn {
        private "_handle";
            _handle = [] spawn life_fnc_actionKeyHandler;
            waitUntil {scriptDone _handle};
            life_action_inUse = false;
        };
    };
    true;
};

if (life_container_active) then {
    switch (_code) do {
        //space key
        case 57: {
            [] spawn life_fnc_placestorage;
        };
    };
    true;
};

switch (_code) do {
    // -- Disable commander/tactical view
    if (LIFE_SETTINGS(getNumber,"disableCommanderView") isEqualTo 1) then {
    private _CommandMode = actionKeys "tacticalView";

        if (_code in _CommandMode) then {
            hint localize "STR_NOTF_CommanderView";
            _handled = true;
        };
    };

    //Space key for Jumping
    case 57: {
        if (isNil "jumpActionTime") then {jumpActionTime = 0;};
        if (_shift && {!(animationState player isEqualTo "AovrPercMrunSrasWrflDf")}&& {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {speed player > 2}&& {!life_is_arrested}&& {((velocity player) select 2) < 2.5}&& {time - jumpActionTime > 1.5}) then {
            jumpActionTime = time; //Update the time.
            [player] remoteExec ["life_fnc_jumpFnc",RANY];//Global execution
            _handled = true;
        };
    };

    //Surrender (Shift + B)
    case 48: {
        if (_shift) then {
            if (player getVariable ["playerSurrender",false]) then {
                player setVariable ["playerSurrender",false,true];
            } else {
                [] spawn life_fnc_surrender;
            };
            _handled = true;
        };
    };

    //Map Key
    case _mapKey: {
        switch (playerSide) do {
            case west: {if (!visibleMap) then {[] spawn life_fnc_copMarkers;}};
            case independent: {if (!visibleMap) then {[] spawn life_fnc_medicMarkers;}};
            case civilian: {if (!visibleMap) then {[] spawn life_fnc_civMarkers;}};
        };
    };

    //Holster / recall weapon. (Shift + H)
    case 35: {
        if (_shift && !_ctrlKey && !(currentWeapon player isEqualTo "")) then {
            life_curWep_h = currentWeapon player;
            player action ["SwitchWeapon", player, player, 100];
            player switchCamera cameraView;
        };

        if (!_shift && _ctrlKey && !isNil "life_curWep_h" && {!(life_curWep_h isEqualTo "")}) then {
            if (life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
                player selectWeapon life_curWep_h;
            };
        };
    };

    //Interaction key (default is Left Windows, can be mapped via Controls -> Custom -> User Action 10)
    case _interactionKey: {
        if (!life_action_inUse) then {
            [] spawn {
            private "_handle";
                _handle = [] spawn life_fnc_actionKeyHandler;
                waitUntil {scriptDone _handle};
                life_action_inUse = false;
            };
        };
    };

    //Restraining (Shift + R)
    case 19: {
        if (_shift) then {_handled = true;};
        if (_shift && playerSide isEqualTo west && {!isNull cursorObject}&& {cursorObject isKindOf "Man"}&& {(isPlayer cursorObject)}&& {(side cursorObject in [civilian,independent])}&& {alive cursorObject}&& {cursorObject distance player < 3.5}&& {!(cursorObject getVariable "Escorting")}&& {!(cursorObject getVariable "restrained")}&& {speed cursorObject < 1}) then {
            [] call life_fnc_restrainAction;
        };
    };

    //Knock out, this is experimental and yeah... (Shift + G)
    case 34: {
        if (_shift) then {_handled = true;};
        if (_shift && playerSide isEqualTo civilian && !isNull cursorObject && cursorObject isKindOf "Man" && isPlayer cursorObject && alive cursorObject && cursorObject distance player < 4 && speed cursorObject < 1) then {
            if ((animationState cursorObject) != "Incapacitated" && (currentWeapon player == primaryWeapon player || currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable ["restrained",false]) && !life_istazed && !life_isknocked) then {
                [cursorObject] spawn life_fnc_knockoutAction;
            };
        };
    };

    //T Key (Trunk)
    case 20: {
        if (!_alt && !_ctrlKey && !dialog && {!life_action_inUse}) then {
            if (!(isNull objectParent player) && alive vehicle player) then {
                if ((vehicle player) in life_vehicles) then {
                    [vehicle player] spawn life_fnc_openInventory;
                };
            } else {
            private "_list";
                _list = ((ASLtoATL (getPosASL player)) nearEntities [["Box_IND_Grenades_F","B_supplyCrate_F"], 2.5]) select 0;
                if (!(isNil "_list")) then {
                    _house = nearestObject [(ASLtoATL (getPosASL _list)), "House"];
                    if (_house getVariable ["locked", false]) then {
                        hint localize "STR_House_ContainerDeny";
                    } else {
                        [_list] spawn life_fnc_openInventory;
                    };
                } else {
                    _list = ["landVehicle","Air","Ship"];
                    if (KINDOF_ARRAY(cursorObject,_list) && {player distance cursorObject < 7}&& {isNull objectParent player}&& {alive cursorObject}&& {!life_action_inUse}) then {
                        if (cursorObject in life_vehicles || {locked cursorObject isEqualTo 0}) then {
                            [cursorObject] spawn life_fnc_openInventory;
                        };
                    };
                };
            };
        };
    };

    //L Key?
    case 38: {
        //If cop run checks for turning lights on.
        if (_shift && playerSide in [west,independent]) then {
            if (!(isNull objectParent player) && (typeOf vehicle player) in ["C_Offroad_01_F","C_SUV_01_F","C_Hatchback_01_sport_F","C_Offroad_02_unarmed_F","I_MRAP_03_F","I_MRAP_03_hmg_F","B_MRAP_01_F","B_MRAP_01_hmg_F","I_Truck_02_covered_F","I_Truck_02_ammo_F","O_Truck_03_ammo_F","B_Truck_01_ammo_F","B_Heli_Light_01_F","O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F","I_Heli_light_03_unarmed_F","O_Heli_Transport_04_F","O_Heli_Transport_04_covered_F","B_Heli_Transport_03_unarmed_F","B_Heli_Light_01_armed_F","I_Heli_light_03_F","B_Heli_Attack_01_F","B_Heli_Transport_01_F","B_Heli_Transport_03_F","B_Plane_CAS_01_dynamicLoadout_F","B_Plane_Fighter_01_Stealth_F","B_Plane_Fighter_01_F","B_Boat_Transport_01_F","C_Boat_Civil_01_police_F","C_Boat_Civil_01_rescue_F","C_Boat_Transport_02_F","B_Boat_Armed_01_minigun_F","O_Boat_Armed_01_hmg_F","B_SDV_01_F","O_SDV_01_F","I_SDV_01_F","B_Quadbike_01_F","I_Truck_02_medical_F","O_Truck_03_medical_F","I_Truck_02_box_F","O_Truck_03_repair_F","B_Truck_01_medical_F","B_Truck_01_Repair_F","B_Truck_01_mover_F","O_Heli_Transport_04_repair_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F"]) then {
                if (!isNil {vehicle player getVariable "lights"}) then {
                    if (playerSide isEqualTo west) then {
                        [vehicle player] call life_fnc_sirenLights;
                    } else {
                        [vehicle player] call life_fnc_medicSirenLights;
                    };
                    _handled = true;
                };
            };
        };

        if (!_alt && !_ctrlKey) then {[] call life_fnc_radar;};
    };

    //Y Player Menu
    case 21: {
        if (!_alt && !_ctrlKey && !dialog && !(player getVariable ["restrained",false]) && {!life_action_inUse}) then {
            [] call life_fnc_p_openMenu;
        };
    };

    //F Key
    case 33: {
        //Original Source
        if (!_shift && !_ctrlKey && !_alt) then {
            if (playerSide in [west,independent] && {vehicle player != player}&& {!life_siren_active}&& {((driver vehicle player) == player)}) then {
                [] spawn {
                    life_siren_active = true;
                    sleep 4.7;
                    life_siren_active = false;
                };

                _veh = vehicle player;
                if (isNil {_veh getVariable "siren"}) then {_veh setVariable ["siren",false,true];};
                if ((_veh getVariable "siren")) then {
                    titleText [localize "STR_MISC_SirensOFF","PLAIN"];
                    _veh setVariable ["siren",false,true];
                } else {
                    titleText [localize "STR_MISC_SirensON","PLAIN"];
                    _veh setVariable ["siren",true,true];
                    if (playerSide isEqualTo west) then {
                        [_veh] remoteExec ["life_fnc_copSiren",RCLIENT];
                    } else {
                        [_veh] remoteExec ["life_fnc_medicSiren",RCLIENT];
                    };
                };
            };
        };
        
        //AOSOUL Added
        //Shift + F Stop Vehicle Male
        if (_shift) then {
            if (playerSide in [west] && {vehicle player != player}&& {!life_CopWarningActive_male}&& {((driver vehicle player) == player)}) then {
                [] spawn {
                    life_CopWarningActive_male = true;
                    sleep 2;
                    life_CopWarningActive_male = false;
                };

                _veh = vehicle player;
                if (isNil {_veh getVariable "Stop_M"}) then {_veh setVariable ["Stop_M",false,true];};
                if ((_veh getVariable "Stop_M")) then {
                    titleText [localize "STR_AOSOUL_CopWarning_Male_Off","PLAIN"];
                    _veh setVariable ["Stop_M",false,true];
                } else {
                    titleText [localize "STR_AOSOUL_CopWarning_Male_On","PLAIN"];
                    _veh setVariable ["Stop_M",true,true];
                    if (playerSide isEqualTo west) then {
                        [_veh] remoteExec ["life_fnc_CopCustomSirenM",RCLIENT];
                    };
                };
            };
        };
        //Shift + F Stop Vehicle Female
        if (_ctrlKey) then {
            if (playerSide in [west] && {vehicle player != player}&& {!life_CopWarningActive_female}&& {((driver vehicle player) == player)}) then {
                [] spawn {
                    life_CopWarningActive_female = true;
                    sleep 2;
                    life_CopWarningActive_female = false;
                };

                _veh = vehicle player;
                if (isNil {_veh getVariable "Stop_F"}) then {_veh setVariable ["Stop_F",false,true];};
                if ((_veh getVariable "Stop_F")) then {
                    titleText [localize "STR_AOSOUL_CopWarning_Female_Off","PLAIN"];
                    _veh setVariable ["Stop_F",false,true];
                } else {
                    titleText [localize "STR_AOSOUL_CopWarning_Female_On","PLAIN"];
                    _veh setVariable ["Stop_F",true,true];
                    if (playerSide isEqualTo west) then {
                        [_veh] remoteExec ["life_fnc_CopCustomSirenF",RCLIENT];
                    };
                };
            };
        };
    };

    //O Key
    case 24: {
        if (_shift) then {
            if !(soundVolume isEqualTo 1) then {
                1 fadeSound 1;
                systemChat localize "STR_MISC_soundnormal";
            } else {
                1 fadeSound 0.1;
                systemChat localize "STR_MISC_soundfade";
            };
        };
    };

    //U Key
    case 22: {
        if (!_alt && !_ctrlKey) then {
            if (isNull objectParent player) then {
                _veh = cursorObject;
            } else {
                _veh = vehicle player;
            };

            if (_veh isKindOf "House_F" && {playerSide isEqualTo civilian}) then {
                if (_veh in life_vehicles && {player distance _veh < 20}) then {
                    _door = [_veh] call life_fnc_nearestDoor;
                    if (_door isEqualTo 0) exitWith {hint localize "STR_House_Door_NotNear"};
                    _locked = _veh getVariable [format ["bis_disabled_Door_%1",_door],0];

                    if (_locked isEqualTo 0) then {
                        _veh setVariable [format ["bis_disabled_Door_%1",_door],1,true];
                        _veh animateSource [format ["Door_%1_source", _door], 0];
                        systemChat localize "STR_House_Door_Lock";
                    } else {
                        _veh setVariable [format ["bis_disabled_Door_%1",_door],0,true];
                        _veh animateSource [format ["Door_%1_source", _door], 1];
                        systemChat localize "STR_House_Door_Unlock";
                    };
                };
            } else {
                _locked = locked _veh;
                if (_veh in life_vehicles && {player distance _veh < 20}) then {
                    if (_locked isEqualTo 2) then {
                        if (local _veh) then {
                            _veh lock 0;

                            // BI
                            _veh animateDoor ["door_back_R",1];
                            _veh animateDoor ["door_back_L",1];
                            _veh animateDoor ['door_R',1];
                            _veh animateDoor ['door_L',1];
                            _veh animateDoor ['Door_L_source',1];
                            _veh animateDoor ['Door_rear',1];
                            _veh animateDoor ['Door_rear_source',1];
                            _veh animateDoor ['Door_1_source',1];
                            _veh animateDoor ['Door_2_source',1];
                            _veh animateDoor ['Door_3_source',1];
                            _veh animateDoor ['Door_LM',1];
                            _veh animateDoor ['Door_RM',1];
                            _veh animateDoor ['Door_LF',1];
                            _veh animateDoor ['Door_RF',1];
                            _veh animateDoor ['Door_LB',1];
                            _veh animateDoor ['Door_RB',1];
                            _veh animateDoor ['DoorL_Front_Open',1];
                            _veh animateDoor ['DoorR_Front_Open',1];
                            _veh animateDoor ['DoorL_Back_Open',1];
                            _veh animateDoor ['DoorR_Back_Open ',1];
                        } else {
                            [_veh,0] remoteExecCall ["life_fnc_lockVehicle",_veh];

                            _veh animateDoor ["door_back_R",1];
                            _veh animateDoor ["door_back_L",1];
                            _veh animateDoor ['door_R',1];
                            _veh animateDoor ['door_L',1];
                            _veh animateDoor ['Door_L_source',1];
                            _veh animateDoor ['Door_rear',1];
                            _veh animateDoor ['Door_rear_source',1];
                            _veh animateDoor ['Door_1_source',1];
                            _veh animateDoor ['Door_2_source',1];
                            _veh animateDoor ['Door_3_source',1];
                            _veh animateDoor ['Door_LM',1];
                            _veh animateDoor ['Door_RM',1];
                            _veh animateDoor ['Door_LF',1];
                            _veh animateDoor ['Door_RF',1];
                            _veh animateDoor ['Door_LB',1];
                            _veh animateDoor ['Door_RB',1];
                            _veh animateDoor ['DoorL_Front_Open',1];
                            _veh animateDoor ['DoorR_Front_Open',1];
                            _veh animateDoor ['DoorL_Back_Open',1];
                            _veh animateDoor ['DoorR_Back_Open ',1];
                        };
                        systemChat localize "STR_MISC_VehUnlock";
                        [_veh,"unlockCarSound"] remoteExec ["life_fnc_say3D",RANY];
                    } else {
                        if (local _veh) then {
                            _veh lock 2;

                            _veh animateDoor ["door_back_R",0];
                            _veh animateDoor ["door_back_L",0];
                            _veh animateDoor ['door_R',0];
                            _veh animateDoor ['door_L',0];
                            _veh animateDoor ['Door_L_source',0];
                            _veh animateDoor ['Door_rear',0];
                            _veh animateDoor ['Door_rear_source',0];
                            _veh animateDoor ['Door_1_source',0];
                            _veh animateDoor ['Door_2_source',0];
                            _veh animateDoor ['Door_3_source',0];
                            _veh animateDoor ['Door_LM',0];
                            _veh animateDoor ['Door_RM',0];
                            _veh animateDoor ['Door_LF',0];
                            _veh animateDoor ['Door_RF',0];
                            _veh animateDoor ['Door_LB',0];
                            _veh animateDoor ['Door_RB',0];
                            _veh animateDoor ['DoorL_Front_Open',0];
                            _veh animateDoor ['DoorR_Front_Open',0];
                            _veh animateDoor ['DoorL_Back_Open',0];
                            _veh animateDoor ['DoorR_Back_Open ',0];
                        } else {
                            [_veh,2] remoteExecCall ["life_fnc_lockVehicle",_veh];

                            _veh animateDoor ["door_back_R",0];
                            _veh animateDoor ["door_back_L",0];
                            _veh animateDoor ['door_R',0];
                            _veh animateDoor ['door_L',0];
                            _veh animateDoor ['Door_L_source',0];
                            _veh animateDoor ['Door_rear',0];
                            _veh animateDoor ['Door_rear_source',0];
                            _veh animateDoor ['Door_1_source',0];
                            _veh animateDoor ['Door_2_source',0];
                            _veh animateDoor ['Door_3_source',0];
                            _veh animateDoor ['Door_LM',0];
                            _veh animateDoor ['Door_RM',0];
                            _veh animateDoor ['Door_LF',0];
                            _veh animateDoor ['Door_RF',0];
                            _veh animateDoor ['Door_LB',0];
                            _veh animateDoor ['Door_RB',0];
                            _veh animateDoor ['DoorL_Front_Open',0];
                            _veh animateDoor ['DoorR_Front_Open',0];
                            _veh animateDoor ['DoorL_Back_Open',0];
                            _veh animateDoor ['DoorR_Back_Open ',0];
                        };
                        systemChat localize "STR_MISC_VehLock";
                        [_veh,"lockCarSound"] remoteExec ["life_fnc_say3D",RANY];
                    };
                };
            };
        };
    };

    //AOSoul 
    //Admin Menu Shift + `
    case 41:
    {
        //Admin Menu
        if (_shift) then
        {
            if(!_alt && !_ctrlKey && !dialog) then
            {
                //createDialog "life_admin_menu";
                closeDialog 0;
                [] spawn life_fnc_openMenu;
            };
        };
        
        //Cop Prison Song
        if (_ctrlKey) then {
            if ((time - life_action_delay) < 0.1) exitWith {hint localize "STR_NOTF_ActionDelay";};
            life_action_delay = time;
            if (FETCH_CONST(life_coplevel) < 3 && {FETCH_CONST(life_adminlevel) < 1}) exitWith {hint localize "STR_AOSOUL_LowLevel";};
            if (playerSide in [west] && {!life_CopPrisonSong}) then {
                [] spawn {
                    life_CopPrisonSong = true;
                    sleep 77;
                    life_CopPrisonSong = false;
                };
                closeDialog 0;
                [player,"CopPrisonSong"] remoteExec ["life_fnc_say3D",RANY];
            };
        };
    };

    //Mobile open Shift + 1, Cop Hands Up M/F (Ctrl + 1 , Alt + 1)
    case 2:
    {
        //Open Mobile
        if (_shift) then
        {
            if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
            if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
            if(!_alt && !_ctrlKey && !dialog) then
            {
                createDialog "Life_cell_phone";
            };
        };
        //Cop Hands Up Male
        if (_ctrlKey) then {
            if ((time - life_action_delay) < 0.1) exitWith {hint localize "STR_NOTF_ActionDelay";};
            life_action_delay = time;
            if (playerSide in [west] && {!life_AOSOUL_Delay}) then {
                [] spawn {
                    life_AOSOUL_Delay = true;
                    sleep 3;
                    life_AOSOUL_Delay = false;
                };
                [player,"CopHandsUpMale"] remoteExec ["life_fnc_say3D",RANY];
            };
        };
        //Cop Hands Up Female
        if (_alt) then {
            if ((time - life_action_delay) < 0.1) exitWith {hint localize "STR_NOTF_ActionDelay";};
            life_action_delay = time;
            if (playerSide in [west] && {!life_AOSOUL_Delay}) then {
                [] spawn {
                    life_AOSOUL_Delay = true;
                    sleep 3;
                    life_AOSOUL_Delay = false;
                };
                [player,"CopHandsUpFemale"] remoteExec ["life_fnc_say3D",RANY];
            };
        };
    };

    //손인사 높게 Shift + 2, Cop Surrender M/F (Ctrl + 2, Alt + 2)
    case 3:
    {
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            //cutText [format["태권도!!!!!"], "PLAIN DOWN"];
            player playAction "gestureHi";
        };
        
        //Cop Surrender Male
        if (_ctrlKey) then {
            if ((time - life_action_delay) < 0.1) exitWith {hint localize "STR_NOTF_ActionDelay";};
            life_action_delay = time;
            if (playerSide in [west] && {!life_AOSOUL_Delay}) then {
                [] spawn {
                    life_AOSOUL_Delay = true;
                    sleep 3;
                    life_AOSOUL_Delay = false;
                };
                [player,"CopSurrenderMale"] remoteExec ["life_fnc_say3D",RANY];
            };
        };
        //Cop Surrender Female
        if (_alt) then {
            if ((time - life_action_delay) < 0.1) exitWith {hint localize "STR_NOTF_ActionDelay";};
            life_action_delay = time;
            if (playerSide in [west] && {!life_AOSOUL_Delay}) then {
                [] spawn {
                    life_AOSOUL_Delay = true;
                    sleep 3;
                    life_AOSOUL_Delay = false;
                };
                [player,"CopSurrenderFemale"] remoteExec ["life_fnc_say3D",RANY];
            };
        };
    };

    //손인사 낮게 Shift + 3, Cop Miranda M/F (Ctrl + 3, Alt + 3)
    case 4:
    {
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            //cutText [format["태권도!!!!!"], "PLAIN DOWN"];
            player playAction "gestureHiC";
        };
        
        //Cop Miranda Male
        if (_ctrlKey) then {
            if ((time - life_action_delay) < 0.1) exitWith {hint localize "STR_NOTF_ActionDelay";};
            life_action_delay = time;
            if (playerSide in [west] && {!life_AOSOUL_Delay}) then {
                [] spawn {
                    life_AOSOUL_Delay = true;
                    sleep 3;
                    life_AOSOUL_Delay = false;
                };
                [player,"CopMirandaMale"] remoteExec ["life_fnc_say3D",RANY];
            };
        };
        //Cop Miranda Female
        if (_alt) then {
            if ((time - life_action_delay) < 0.1) exitWith {hint localize "STR_NOTF_ActionDelay";};
            life_action_delay = time;
            if (playerSide in [west] && {!life_AOSOUL_Delay}) then {
                [] spawn {
                    life_AOSOUL_Delay = true;
                    sleep 3;
                    life_AOSOUL_Delay = false;
                };
                [player,"CopMirandaFemale"] remoteExec ["life_fnc_say3D",RANY];
            };
        };
    };

    //노노 사인 Shift + 4, Cop Thanks (Ctrl + 4), Cop Save (Alt + 4)
    case 5:
    {
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            //cutText [format["태권도!!!!!"], "PLAIN DOWN"];
            player playAction "gestureHiB";
        };
        
        //Cop Thanks
        if (_ctrlKey) then {
            if ((time - life_action_delay) < 0.1) exitWith {hint localize "STR_NOTF_ActionDelay";};
            life_action_delay = time;
            if (playerSide in [west] && {!life_AOSOUL_Delay}) then {
                [] spawn {
                    life_AOSOUL_Delay = true;
                    sleep 3;
                    life_AOSOUL_Delay = false;
                };
                [player,"CopThanks"] remoteExec ["life_fnc_say3D",RANY];
            };
        };
        
        //Cop Save
        if (_alt) then {
            if ((time - life_action_delay) < 0.1) exitWith {hint localize "STR_NOTF_ActionDelay";};
            life_action_delay = time;
            if (playerSide in [west] && {!life_AOSOUL_Delay}) then {
                [] spawn {
                    life_AOSOUL_Delay = true;
                    sleep 3;
                    life_AOSOUL_Delay = false;
                };
                [player,"CopSave"] remoteExec ["life_fnc_say3D",RANY];
            };
        };
    };

    //한번 끄덕이기 Shift + 5
    case 6:
    {
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            //cutText [format["태권도!!!!!"], "PLAIN DOWN"];
            player playAction "gestureNod";
        };
    };

    //무술 Shifh + 6
    case 7:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            //cutText [format ["태권도!!!!!"], "PLAIN DOWN"];
            player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
        };
    };

    //앉았다 느리게 일어나기 Shifh + 7
    case 8:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            //cutText [format ["쪼그려뛰기 천천히!!!"], "PLAIN DOWN"];
            player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";
        };
    };

    //앉았다 일어나기 Shifh + 8
    case 9:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            //cutText [format ["쪼그려뛰기 빠르게!!!"], "PLAIN DOWN"];
            player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
        };
    };

    //팔굽혀펴기 Shifh + 9
    case 10:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            //cutText [format ["팔굽혀펴기!!!"], "PLAIN DOWN"];
            player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
        };
    };

    // 모션 복구 Shift + Num0
    case 82:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"AmovPercMstpSnonWnonDnon",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "AmovPercMstpSnonWnonDnon";
            player playMoveNow "AmovPercMstpSnonWnonDnon";
        };
    };

    // 쉬야 Shift + Num1
    case 79:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"Acts_AidlPercMstpSlowWrflDnon_pissing",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "Acts_AidlPercMstpSlowWrflDnon_pissing";
            player playMoveNow "Acts_AidlPercMstpSlowWrflDnon_pissing";
            [] call life_fnc_Pee;
        };
    };

    // 뒤로 물러나 총쏘기 Shift + Num2
    case 80:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"Acts_ViperMeeting_A_End",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "Acts_ViperMeeting_A_End";
            player playMoveNow "Acts_ViperMeeting_A_End";
        };
    };

    // 다리 찢기 Shift + Num3
    case 81:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"Acts_EpicSplit",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "Acts_EpicSplit";
            player playMoveNow "Acts_EpicSplit";
        };
    };

    // 주저 앉기 Shift + Num4
    case 75:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"passenger_flatground_2_Idle_Unarmed",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "passenger_flatground_2_Idle_Unarmed";
            player playMoveNow "passenger_flatground_2_Idle_Unarmed";
        };
    };

    // 양반다리 앉기 Shift + Num5
    case 76:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"passenger_flatground_3_Idle_Unarmed",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "passenger_flatground_3_Idle_Unarmed";
            player playMoveNow "passenger_flatground_3_Idle_Unarmed";
        };
    };

    // 조신하게 앉기 Shift + Num6
    case 77:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"passenger_flatground_4_Idle_Unarmed",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "passenger_flatground_4_Idle_Unarmed";
            player playMoveNow "passenger_flatground_4_Idle_Unarmed";
        };
    };

    // 누워있다 일어나기 Shift + Num7
    case 71:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"Acts_UnconsciousStandUp_part1",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "Acts_UnconsciousStandUp_part1";
            player playMoveNow "Acts_UnconsciousStandUp_part1";
        };
    };

    // 뒷짐지고 체조 Shift + Num8
    case 72:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"Acts_AidlPercMstpSnonWnonDnon_warmup_3_loop",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "Acts_AidlPercMstpSnonWnonDnon_warmup_3_loop";
            player playMoveNow "Acts_AidlPercMstpSnonWnonDnon_warmup_3_loop";
        };
    };

    // 일어선체 체조Shift + Num9
    case 73:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"Acts_AidlPercMstpSnonWnonDnon_warmup_7_loop",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "Acts_AidlPercMstpSnonWnonDnon_warmup_7_loop";
            player playMoveNow "Acts_AidlPercMstpSnonWnonDnon_warmup_7_loop";
        };
    };

    // 불량하게 앉기 Shift + Num*
    case 55:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"Acts_AidlPercMstpSnonWnonDnon_warmup_4_loop",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "Acts_AidlPercMstpSnonWnonDnon_warmup_4_loop";
            player playMoveNow "Acts_AidlPercMstpSnonWnonDnon_warmup_4_loop";
        };
    };

    // 포박당해 앉기 Shift + Num-
    case 74:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"Acts_AidlPsitMstpSsurWnonDnon02",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "Acts_AidlPsitMstpSsurWnonDnon02";
            player playMoveNow "Acts_AidlPsitMstpSsurWnonDnon02";
        };
    };

    // Shift + 0
    case 11:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if ((time - life_action_delay) < 0.1) exitWith {hint localize "STR_NOTF_ActionDelay";};
        life_action_delay = time;
        if(_shift && {!life_is_arrested} && {!life_AOSOUL_Delay}) then
        {
            [] spawn {
                life_AOSOUL_Delay = true;
                sleep 5;
                life_AOSOUL_Delay = false;
            };
        	[] spawn life_fnc_Ragdoll;
        };
    };

    // Shift + -
    case 12:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + =
    case 13:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F1
    case 59:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F2
    case 60:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F3
    case 61:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F4
    case 62:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F5
    case 63:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F6
    case 64:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F7
    case 65:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F8
    case 66:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F9
    case 67:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F10
    case 68:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F11
    case 87:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

    // Shift + F12
    case 88:
    {
        if(_shift) then {_handled = true;};
        if (player getVariable "restrained") exitWith {hint localize "STR_NOTF_isrestrained";};
        if (player getVariable "playerSurrender") exitWith {hint localize "STR_NOTF_surrender";};
        if(_shift && {isTouchingGround player}&& {stance player isEqualTo "STAND"}&& {!life_is_arrested}) then
        {
            [player,"",true] remoteExecCall ["life_fnc_animSync",RCLIENT];
            player switchMove "";
            player playMoveNow "";
        };
    };

};

_handled;
