/*
    Ragdoll Effect
*/
if (!isNull objectParent player) exitWith {};
private "_ragdoll";
player allowdamage false;
_ragdoll = "Land_Can_V3_F" createVehicleLocal [0,0,0];
_ragdoll setMass 1e10;
_ragdoll attachTo [player, [0,0,0], "Spine3"];
_ragdoll setVelocity [0,0,6];
detach _ragdoll;
0 = _ragdoll spawn {
    deleteVehicle _this;
    uisleep 3;
    player allowdamage true;
};
//
[] spawn {
    life_AOSOUL_Delay = true;
    sleep 3;
    life_AOSOUL_Delay = false;
};