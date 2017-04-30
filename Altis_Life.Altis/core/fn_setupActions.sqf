/*
    File: fn_setupActions.sqf
    Author:

    Description:
    Master addAction file handler for all client-based actions.
*/
switch (playerSide) do {
    case civilian: {
        //Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
        //Rob person
        life_actions = life_actions + [player addAction[localize "STR_pAct_RobPerson",life_fnc_robAction,"",0,false,false,"",'
        !isNull cursorObject && player distance cursorObject < 3.5 && isPlayer cursorObject && animationState cursorObject == "Incapacitated" && !(cursorObject getVariable ["robbed",false]) ']];
		
		//AOSOUL Added
		// RocketHelmet
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Active RocketPack</t>",life_fnc_JetRocket,"",0,false,false,"",
        'Backpack player == "B_AssaultPack_sgg" && alive player && isNull objectParent player && !life_istazed && !life_jetpack && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
    };
	case west: {
        // RocketHelmet
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Active RocketPack</t>",life_fnc_JetRocket,"",0,false,false,"",
        'Backpack player == "B_AssaultPack_sgg" && alive player && isNull objectParent player && !life_istazed && !life_jetpack && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
		//Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
    };
    case independent: {
        // RocketHelmet
        life_actions = life_actions + [player addAction["<t color='#FF0000'>Active RocketPack</t>",life_fnc_JetRocket,"",0,false,false,"",
        'Backpack player == "B_AssaultPack_sgg" && alive player && isNull objectParent player && !life_istazed && !life_jetpack && !(player getVariable "restrained") && !(player getVariable "Escorting") && !(player getVariable "transporting")']];
		//Drop fishing net
        life_actions = [player addAction[localize "STR_pAct_DropFishingNet",life_fnc_dropFishingNet,"",0,false,false,"",'
        (surfaceisWater (getPos vehicle player)) && (vehicle player isKindOf "Ship") && life_carryWeight < life_maxWeight && speed (vehicle player) < 2 && speed (vehicle player) > -1 && !life_net_dropped ']];
};
