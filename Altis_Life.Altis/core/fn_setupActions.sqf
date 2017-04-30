/*
 File: fn_setupActions.sqf
 Author:

 Description:
 Master addAction file handler for all client-based actions.
 */
switch (playerSide) do {
     case civilian: {
        //Rob person
        life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",' !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']];

        //AOSoul Added : drop fishing, roket pack, sitdown, standup
        //Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",' (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
        //RocketHelmet
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Active RocketPack</t>",life_fnc_JetRocket,"",0,false,false,"",' Backpack player == "B_AssaultPack_sgg" && alive player && isNull objectParent player && !life_istazed && !life_jetpack && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
        //Sitdown
        life_actions = life_actions + [player addAction["Sitdown",life_fnc_sitDown,cursorTarget,10,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V1_F" || cursorTarget isKindOf "Land_CampingChair_V2_F" || cursorTarget isKindOf "Land_Bench_F" || cursorTarget isKindOf "Land_Bench_01_F" || cursorTarget isKindOf "Land_ChairWood_F" || cursorTarget isKindOf "Land_ChairPlastic_F")']];
        //Standup
        life_actions = life_actions + [player addAction["Standup", life_fnc_sitDown,cursorTarget,10,false,false,"",'life_sitting']];
    };
    case west: {
        //AOSoul Added : drop fishing, roket pack, sitdown, standup
        //Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",' (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
        //RocketHelmet
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Active RocketPack</t>",life_fnc_JetRocket,"",0,false,false,"",' Backpack player == "B_AssaultPack_sgg" && alive player && isNull objectParent player && !life_istazed && !life_jetpack && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
        //Sitdown
        life_actions = life_actions + [player addAction["Sitdown",life_fnc_sitDown,cursorTarget,10,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V1_F" || cursorTarget isKindOf "Land_CampingChair_V2_F" || cursorTarget isKindOf "Land_Bench_F" || cursorTarget isKindOf "Land_Bench_01_F" || cursorTarget isKindOf "Land_ChairWood_F" || cursorTarget isKindOf "Land_ChairPlastic_F")']];
        //Standup
        life_actions = life_actions + [player addAction["Standup", life_fnc_sitDown,cursorTarget,10,false,false,"",'life_sitting']];
    };
    case independent: {
        //AOSoul Added : drop fishing, roket pack, sitdown, standup
        //Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",' (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
        //RocketHelmet
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Active RocketPack</t>",life_fnc_JetRocket,"",0,false,false,"",' Backpack player == "B_AssaultPack_sgg" && alive player && isNull objectParent player && !life_istazed && !life_jetpack && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
        //Sitdown
        life_actions = life_actions + [player addAction["Sitdown",life_fnc_sitDown,cursorTarget,10,false,false,"",' !isNull cursorTarget && (player distance cursorTarget) < 3 && (cursorTarget isKindOf "Land_CampingChair_V1_F" || cursorTarget isKindOf "Land_CampingChair_V2_F" || cursorTarget isKindOf "Land_Bench_F" || cursorTarget isKindOf "Land_Bench_01_F" || cursorTarget isKindOf "Land_ChairWood_F" || cursorTarget isKindOf "Land_ChairPlastic_F")']];
        //Standup
        life_actions = life_actions + [player addAction["Standup", life_fnc_sitDown,cursorTarget,10,false,false,"",'life_sitting']];
    };
};