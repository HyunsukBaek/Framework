/*
�씠 �뒪�겕?��???���뒗 ARMA AOS �꽌踰꾩?�� �냼��??��?��?���땲�떎.
?��???���쑝濡� �닔�젙 諛� 諛고�? �떆 ?��몄젣媛� 諛쒖�?�맖�쓣 �븣�젮�뱶?��?��?���떎.
?��몄쓽 : magicianaos@gmail.com
�솃�럹�씠吏� : http://cafe.naver.com/alflrss
*/
//Admin Light Bullet
if (isNil "PEDO_IS_FUKED" ) then {PEDO_IS_FUKED=0};

 if (PEDO_IS_FUKED==0) then 
 {
 PEDO_IS_FUKED=1;
 vehicle player removeAllEventHandlers "Fired";
 hint "Explosive Bullets ON";
 vehicle player addeventhandler ["Fired",{call Those_Massive_Bullets_Tho} ];

 Those_Massive_Bullets_Tho = 
 {
 if (isNull cursorTarget) then 
 {
 PEDO_IS_A_SEXY_CUNT = screenToWorld [0.5,0.5];
 } 
 else 
 {
 PEDO_IS_A_SEXY_CUNT = getpos cursorTarget;
 };
 private ["_caller"];
 _caller = _this select 0;
 omsz = false;


 _center = createCenter sideLogic; 
 _group = createGroup _center; 
 _target = PEDO_IS_A_SEXY_CUNT;
 _zlb = _group createUnit ["ModuleLightning_F",_target,[],0,""];
 _thunder = ["thunder_1", "thunder_2"] call BIS_fnc_selectRandom;
 playSound _thunder;

 omscz = true;
 true; 
 };
 }
 else
 {
 PEDO_IS_FUKED=0;
 hint "Explosive Bullets OFF";
 vehicle player removeAllEventHandlers "Fired";
 //Start Flare Gun
 player addEventHandler ["fired",{

	_p = _this select 6;
	_weapon = _this select 1;
	_v = velocity _p;
	if(_weapon == "SMG_02_F") then {
		_f = 'CMflare_Chaff_Ammo' createVehicle (position _p);
		_f setPosATL (getPosATL _p);_f setVelocity _v;
		[_p,_f] spawn {waitUntil{isNull (_this select 0)}; deleteVehicle (_this select 1);};
	};
	
}];
 }; 