//CONFIGURATIONS:
/////////////////
//CHANNELS:			Channel# enableChannel [CHAT,VOICE]
//GLOBAL: 0 | SIDE: 1 | COMMAND: 2 | GROUP: 3 | VEHICLE: 4 | DIRECT: 5 | SYSTEM: 6 | 7-15 = Custom Channels
r_CH=[3,4,5];//Channels for radio effects 			>> Default: [1,2,3,4]
r_glCH=[FALSE,FALSE];//Global Channel Chat/Voice Allow	>> Default: [FALSE,FALSE]
r_sCH=[FALSE,FALSE];//Side Channel Chat/Voice Allow  		>> Default: [FALSE,TRUE]
r_cCH=[FALSE,FALSE];//Command Channel Chat/Voice Allow  	>> Default: [TRUE,TRUE]
r_grCH=[TRUE,TRUE];//Group Channel Chat/Voice Allow  	>> Default: [FALSE,TRUE]
r_vCH=[TRUE,TRUE];//Vehicle Channel Chat/Voice Allow  	>> Default: [TRUE,TRUE]
r_dCH=[TRUE,TRUE];//Direct Channel Chat/Voice Allow  	>> Default: [FALSE,TRUE]



//(Do not edit below!)
//////////////////////
//FUNCTION: Global radio noise based on distance between sender/closest receiver
Fuzz={
if!(currentChannel in r_CH)exitWith{};
if("ItemRadio" in assignedItems player&&alive player)then{
private["_s","_d0","_f"];
_s=[];_d0=0;_f="";
{if((alive _x)&&{(side _x==CIVILIAN)||(side _x==side player)})then{_s set[(count _s),_x];};}forEach allPlayers-[player];
_s=_s select 0;
_d0=player distance _s;
if(surfaceIsWater getPos player)then{
if(!isNull objectParent player)then{
_f="Land_HelipadEmpty_F" createVehicleLocal getPosASLW vehicle player;_f attachTo[vehicle player,[0,0,0.5]];}else{
_f="Land_HelipadEmpty_F" createVehicleLocal getPosASLW player;_f attachTo[player,[-0.08,0.35,0.005],"Neck"];};}else{
if(!isNull objectParent player)then{
_f="Land_HelipadEmpty_F" createVehicleLocal getPosATL vehicle player;_f attachTo[vehicle player,[0,0,0.5]];}else{
_f="Land_HelipadEmpty_F" createVehicleLocal getPosATL player;_f attachTo[player,[-0.08,0.35,0.005],"Neck"];};};

switch(true)do{
case(_d0>=0&&{_d0<1000}):{playSound "in1";while{!isNull _f}do{_f say2D "fuz1";sleep 5;};};
case(_d0>1000&&{_d0<6000}):{playSound "in1";while{!isNull _f}do{_f say2D "fuz2";sleep 5;};};
case(_d0>6000&&{_d0<8000}):{playSound "in1";while{!isNull _f}do{_f say2D "fuz3";sleep 5;};};
case(_d0>8000&&{_d0<12000}):{playSound "in1";while{!isNull _f}do{_f say2D "fuz4";sleep 5;};};
case(_d0>12000&&{_d0<18000}):{playSound "in1";while{!isNull _f}do{_f say2D "fuz5";sleep 5;};};
case(_d0>18000&&{_d0<20000}):{playSound "in1";while{!isNull _f}do{_f say2D "fuz6";sleep 5;};};
case(_d0>20000&&{_d0<21000}):{playSound "in1";while{!isNull _f}do{_f say2D "fuz7";sleep 5;};};
case(_d0>21000&&{_d0<22000}):{playSound "in1";while{!isNull _f}do{_f say2D "fuz8";sleep 5;};};
case(_d0>=22000):{};
};
_s=[];_f="";_d0=0;};};



//FUNCTION: Silence radio noise
Hush={playSound "out1";{if(_x isKindOf "Land_HelipadEmpty_F")then{detach _x;deleteVehicle _x;};}forEach attachedObjects player+[objectParent player];};


//FUNCTIONS: Client begins transmitting over radio
S_In={
if(currentChannel!=1)exitWith{};if(playersNumber playerSide<2)exitWith{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;};
private["_nearP","_c","_d1","_r"];
if("ItemRadio" in assignedItems player)then{
if(alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
_nearP=[];
{if((alive _x)&&(side player==side _x))then{_nearP set[(count _nearP),_x];};}forEach allPlayers-[player];
if(count _nearP>0)then{_c=_nearP select 0;_d1=player distance _c;
1 enableChannel r_sCH;
switch(true)do{
case(_d1>=0&&{_d1<1050}):{hintSilent"Transmitting...";playSound "in1";};
case(_d1>1050&&{_d1<1200}):{1 enableChannel r_sCH;hintSilent"v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^";playSound "in1";};
case(_d1>=1200):{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;hintSilent"-----------------------------------------------------";playSound "in2";};};
if(_d1>=0&&{_d1<=1200})then{{_x remoteExec["Fuzz",_x];}forEach _nearP;};
_nearP=[];_c="";_d1=0;}else{1 enableChannel false;hintSilent"-----------------------------------------------------";playSound "in2";};
}else{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;hintSilent"-----------------------------------------------------";playSound "in2";};
player playAction "HandSignalRadio";
if(!isNull objectParent player)then{
_r="Land_PortableLongRangeRadio_F" createVehicleLocal getPos vehicle player;_r attachTo[vehicle player,[0,0,0.5]];_r setVectorUp[0,0,0.005];}else{
_r="Land_PortableLongRangeRadio_F" createVehicleLocal getPos player;_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpSout];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpSin];
kpSout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkSide""<2)})then{[player]call sOut;}"];};};



C_In={
if(currentChannel!=2)exitWith{};if(playersNumber playerSide<2)exitWith{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;};
private["_nearP","_c","_d1","_r"];
if("ItemRadio" in assignedItems player)then{
if(alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
_nearP=[];_c="";_d1=0;_r="";
{if((side _x==side player)&&(alive _x)&&(leader(group(vehicle _x))==leader _x))then{_nearP set[(count _nearP),_x];};}forEach allPlayers-[player];
if(count _nearP>0)then{_c=_nearP select 0;_d1=player distance _c;
2 enableChannel r_cCH;
switch(true)do{
case(_d1>=0&&{_d1<1050}):{hintSilent"Transmitting...";playSound "in0";};
case(_d1>1050&&{_d1<1200}):{2 enableChannel false;hintSilent"v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^";playSound "in0";};
case(_d1>=1200):{2 enableChannel false;hintSilent"-----------------------------------------------------";playSound "in2";};};
if(_d1>=0&&{_d1<=1200})then{{_x remoteExec["Fuzz",_x];}forEach _nearP;};
_nearP=[];_c="";_d1=0;}else{2 enableChannel false;hintSilent"-----------------------------------------------------";playSound "in2";};
}else{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;hintSilent"-----------------------------------------------------";playSound "in2";};
player playAction "HandSignalRadio";
if(!isNull objectParent player)then{
_r="Land_PortableLongRangeRadio_F" createVehicleLocal getPos vehicle player;_r attachTo[vehicle player,[0,0,0.5]];_r setVectorUp[0,0,0.005];}else{
_r="Land_PortableLongRangeRadio_F" createVehicleLocal getPos player;_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpCout];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpCin];
kpCout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkCommand""<2)})then{[player]call cOut;}"];};};



G_In={
if(currentChannel!=3)exitWith{};if(playersNumber playerSide<2)exitWith{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;};
private["_nearP","_c","_d1","_r"];
if("ItemRadio" in assignedItems player)then{
if(alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
_nearP=[];
{if((alive _x)&&(group player==group _x))then{_nearP set[(count _nearP),_x];};}forEach allPlayers-[player];
if(count _nearP>0)then{_c=_nearP select 0;_d1=player distance _c;
3 enableChannel r_grCH;
switch(true)do{
case(_d1>=0&&{_d1<1050}):{hintSilent"Transmitting...";playSound "in1";};
case(_d1>1050&&{_d1<1200}):{3 enableChannel false;hintSilent"v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^v^";playSound "in1";};
case(_d1>=1200):{3 enableChannel false;hintSilent"-----------------------------------------------------";playSound "in2";};};
if(_d1>=0&&{_d1<=1200})then{{_x remoteExec["Fuzz",_x];}forEach _nearP;};
_nearP=[];_c="";_d1=0;}else{3 enableChannel false;hintSilent"-----------------------------------------------------";playSound "in2";};
}else{0 enableChannel false;1 enableChannel r_sCH;2 enableChannel false;3 enableChannel false;4 enableChannel false;hintSilent"-----------------------------------------------------";playSound "in2";};
player playAction "HandSignalRadio";
if(!isNull objectParent player)then{
_r="Land_PortableLongRangeRadio_F" createVehicleLocal getPos vehicle player;_r attachTo[vehicle player,[0,0,0.5]];_r setVectorUp[0,0,0.005];}else{
_r="Land_PortableLongRangeRadio_F" createVehicleLocal getPos player;_r attachTo[player,[-0.08,0.35,0.005],"Neck"];_r setVectorUp[0,-1,0.005];};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpGout];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpGin];
kpGout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkGroup""<2)})then{[player]call gOut;}"];};};



V_In={
if(currentChannel!=4)exitWith{};if(playersNumber playerSide<2)exitWith{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;};
private["_nearP","_r"];
if("ItemRadio" in assignedItems player&&!isNull objectParent player)then{
if(alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
_nearP=[];
{if((alive _x)&&{(_x in crew vehicle player)})then{_nearP set[(count _nearP),_x];};}forEach allPlayers-[player];
if(count _nearP>0)then{
4 enableChannel r_vCH;
hintSilent"Transmitting...";playSound "in1";
{_x remoteExec["Fuzz",_x];}forEach _nearP;};
}else{4 enableChannel r_vCH;hintSilent"-----------------------------------------------------";playSound "in2";};
_nearP=[];
_r="Land_PortableLongRangeRadio_F" createVehicleLocal getPos vehicle player;_r attachTo[vehicle player,[0,0,0.5]];_r setVectorUp[0,0,0.005];}else{0 enableChannel false;1 enableChannel r_sCH;2 enableChannel false;3 enableChannel false;4 enableChannel r_vCH;hintSilent"-----------------------------------------------------";playSound "in2";};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpVout];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpVin];
kpVout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkVehicle""<2)})then{[player]call vOut;}"];};



D_In={
if(currentChannel!=5)exitWith{};if(playersNumber playerSide<2)exitWith{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;};
if(alive player&&isAbleToBreathe player)then{5 enableChannel r_dCH;}else{5 enableChannel false;};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)displayRemoveEventHandler["KeyUp",kpDout];
(findDisplay 46)displayRemoveEventHandler["KeyDown",kpDin];
kpDout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkDirect""<2)})then{[player]call dOut;}"];};



sOut={
if(currentChannel!=1)exitWith{};if(playersNumber playerSide<2)exitWith{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;};
private["_nearP","_c","_d1","_r"];
if("ItemRadio" in assignedItems player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
_nearP=[];
{if((alive _x)&&(side player==side _x)&&(player distance _x<=1200))then{_nearP set[(count _nearP),_x];};}forEach allPlayers-[player];
if(count _nearP>0)then{_c=_nearP select 0;_d1=player distance _c;
1 enableChannel r_sCH;
if(_d1>=0&&{_d1<=1200})then{{_x remoteExec["Hush",_x];}forEach _nearP;};
_nearP=[];_c="";_d1=0;
}else{1 enableChannel r_sCH;};
_nearP=[];_c="";_d1=0;hintSilent"";playSound"out1";
{if(_x isKindOf "Land_PortableLongRangeRadio_F")then{detach _x;deleteVehicle _x;};}forEach attachedObjects vehicle player+[objectParent player];
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)DisplayRemoveEventHandler["KeyUp",kpSout];
(findDisplay 46)DisplayRemoveEventHandler["KeyDown",kpSin];
kpSin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkSide"">0))then{[player]call S_In;};"];};};



//FUNCTIONS: Ends radio transmission
cOut={
if(currentChannel!=2)exitWith{};if(playersNumber playerSide<2)exitWith{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;};
private["_nearP","_c","_d1","_r"];
if("ItemRadio" in assignedItems player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
_nearP=[];
{if((alive _x)&&(group player==group _x)&&(player distance _x<=1200))then{_nearP set[(count _nearP),_x];};}forEach allPlayers-[player];
if(count _nearP>0)then{_c=_nearP select 0;_d1=player distance _c;
2 enableChannel r_cCH;
if(_d1>=0&&{_d1<=1200})then{{_x remoteExec["Hush",_x];}forEach _nearP;};
}else{2 enableChannel false;};
_nearP=[];_c="";_d1=0;hintSilent"";playSound"out1";
{if(_x isKindOf "Land_PortableLongRangeRadio_F")then{detach _x;deleteVehicle _x;};}forEach attachedObjects vehicle player+[objectParent player];
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)DisplayRemoveEventHandler["KeyUp",kpCout];
(findDisplay 46)DisplayRemoveEventHandler["KeyDown",kpCin];
kpCin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkCommand"">0))then{[player]call C_In;};"];};};



gOut={
if(currentChannel!=3)exitWith{};if(playersNumber playerSide<2)exitWith{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;};
private["_nearP","_c","_d1","_r"];
if("ItemRadio" in assignedItems player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
_nearP=[];
{if((alive _x)&&(group player==group _x)&&(player distance _x<=1200))then{_nearP set[(count _nearP),_x];};}forEach allPlayers-[player];
if(count _nearP>0)then{_c=_nearP select 0;_d1=player distance _c;
3 enableChannel r_grCH;
if(_d1>=0&&{_d1<=1200})then{{_x remoteExec["Hush",_x];}forEach _nearP;};
}else{3 enableChannel false;};
_nearP=[];_c="";_d1=0;hintSilent"";playSound"out1";
{if(_x isKindOf "Land_PortableLongRangeRadio_F")then{detach _x;deleteVehicle _x;};}forEach attachedObjects vehicle player+[objectParent player];
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)DisplayRemoveEventHandler["KeyUp",kpGout];
(findDisplay 46)DisplayRemoveEventHandler["KeyDown",kpGin];
kpGin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkGroup"">0))then{[player]call G_In;};"];};};



vOut={
if(currentChannel!=4)exitWith{};if(playersNumber playerSide<2)exitWith{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;};
private["_nearP","_r"];
if("ItemRadio" in assignedItems player&&alive player&&isAbleToBreathe player&&incapacitatedState player=="")then{
_nearP=[];
{if((alive _x)&&{(!isNull objectParent _x)&&(_x in crew vehicle player)})then{_nearP set[(count _nearP),_x];};}forEach allPlayers-[player];
if(count _nearP>0)then{
4 enableChannel r_vCH;
{_x remoteExec["Hush",_x];}forEach _nearP;
}else{4 enableChannel false;};
_nearP=[];hintSilent"";playSound"out1";
{if(_x isKindOf "Land_PortableLongRangeRadio_F")then{detach _x;deleteVehicle _x;};}forEach attachedObjects vehicle player+[objectParent player];
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)DisplayRemoveEventHandler["KeyUp",kpVout];
(findDisplay 46)DisplayRemoveEventHandler["KeyDown",kpVin];
kpVin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkVehicle"">0))then{[player]call V_In;};"];};};



dOut={
if(currentChannel!=5)exitWith{};if(playersNumber playerSide<2)exitWith{0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;};
if(alive player&&isAbleToBreathe player)then{5 enableChannel r_dCH;}else{5 enableChannel false;};
waitUntil{!(isNull(findDisplay 46))};
(findDisplay 46)DisplayRemoveEventHandler["KeyUp",kpDout];
(findDisplay 46)DisplayRemoveEventHandler["KeyDown",kpDin];
kpDin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkDirect"">0))then{[player]call D_In;};"];};



//INIT FUNCTION: Initializes AFAR script functions
initAFAR={
//Sets up channels
0 enableChannel r_glCH;1 enableChannel r_sCH;2 enableChannel r_cCH;3 enableChannel r_grCH;4 enableChannel r_vCH;5 enableChannel r_dCH;6 enableChannel true;setCurrentChannel 5;0 fadeSpeech 1;

//EVENTHANDLER: If player gets rid of radio, he cannot send/recieve transmissions
player addEventHandler["Put",{if((_this select 2=="ItemRadio")&&{!("ItemRadio" in assignedItems player)})then{
0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;}else{
0 enableChannel r_glCH;1 enableChannel r_sCH;2 enableChannel r_cCH;3 enableChannel r_grCH;5 enableChannel r_dCH;};}];

//EVENTHANDLERS: Adds inputAction eventHandler to call In and Out functions upon keyPress/keyRelease
waitUntil{!(isNull(findDisplay 46))};
kpCin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkCommand"">0))then{[player]call C_In;};"];
kpSin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkSide"">0))then{[player]call S_In;};"];
kpGin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkGroup"">0))then{[player]call G_In;};"];
kpVin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkVehicle"">0))then{[player]call V_In;};"];
kpDin=(findDisplay 46)displayAddEventHandler["KeyDown","if((inputAction""PushToTalk"">0)||(inputAction""PushToTalkDirect"">0))then{[player]call D_In;};"];

kpCout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkCommand""<2)})then{};"];
kpSout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkSide""<2)})then{};"];
kpGout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkGroup""<2)})then{};"];
kpVout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkVehicle""<2)})then{};"];
kpDout=(findDisplay 46)displayAddEventHandler["KeyUp","if((inputAction""PushToTalk""<2)&&{(inputAction""PushToTalkDirect""<2)})then{};"];

//EVENTHANDLERS: Adds getIn/Out eventHandler to keep radio/static attached to player
player addEventHandler["GetInMan",{
if(surfaceIsWater getPos player)then{
if(!isNull objectParent player)then{
_r=nearestObjects[getPosASLW vehicle player,["Land_PortableLongRangeRadio_F","Land_HelipadEmpty_F"],9];{detach _x;_x attachTo[vehicle player,[-0.08,0.35,0.005],"Neck"];_x setVectorUp[0,-1,0.005];}forEach _r;}else{
_r=nearestObjects[getPosASLW player,["Land_PortableLongRangeRadio_F","Land_HelipadEmpty_F"],9];{detach _x;_x attachTo[player,[-0.08,0.35,0.005],"Neck"];_x setVectorUp[0,-1,0.005];}forEach _r;};};
if(!isNull objectParent player)then{
_r=nearestObjects[getPosATL vehicle player,["Land_PortableLongRangeRadio_F","Land_HelipadEmpty_F"],9];{detach _x;_x attachTo[vehicle player,[0,0,0.5]];_x setVectorUp[0,-1,0.005];}forEach _r;}else{
_r=nearestObjects[getPosATL player,["Land_PortableLongRangeRadio_F","Land_HelipadEmpty_F"],9];{detach _x;_x attachTo[player,[-0.08,0.35,0.005],"Neck"];_x setVectorUp[0,-1,0.005];}forEach _r;};}];

player addEventHandler["GetOutMan",{
if(surfaceIsWater getPos player)then{
if(!isNull objectParent player)then{
_r=nearestObjects[getPosASLW vehicle player,["Land_PortableLongRangeRadio_F","Land_HelipadEmpty_F"],9];{detach _x;_x attachTo[vehicle player,[0,0,0.5]];_x setVectorUp[0,-1,0.005];}forEach _r;}else{
_r=nearestObjects[getPosASLW player,["Land_PortableLongRangeRadio_F","Land_HelipadEmpty_F"],9];{detach _x;_x attachTo[player,[-0.08,0.35,0.005],"Neck"];_x setVectorUp[0,-1,0.005];}forEach _r;};};
if(!isNull objectParent player)then{
_r=nearestObjects[getPosATL vehicle player,["Land_PortableLongRangeRadio_F","Land_HelipadEmpty_F"],9];{detach _x;_x attachTo[vehicle player,[0,0,0.5]];_x setVectorUp[0,-1,0.005];}forEach _r;}else{
_r=nearestObjects[getPosATL player,["Land_PortableLongRangeRadio_F","Land_HelipadEmpty_F"],9];{detach _x;_x attachTo[player,[-0.08,0.35,0.005],"Neck"];_x setVectorUp[0,-1,0.005];}forEach _r;};}];

//EVENTHANDLERS: Toggle vehicle channel when getting in/out of vehicle
player addEventHandler["GetInMan",{4 enableChannel r_vCH;}];
player addEventHandler["GetOutMan",{4 enableChannel false;}];

//EVENTHANDLER: Toggle off all VON channels and delete radio + static upon death
player addMPEVentHandler["Killed",{
_myBod=_this select 0;
0 enableChannel false;1 enableChannel false;2 enableChannel false;3 enableChannel false;4 enableChannel false;5 enableChannel false;0 fadeSpeech 0;
{if((_x isKindOf "Land_HelipadEmpty_F")||(_x isKindOf "Land_PortableLongRangeRadio_F"))then{detach _x;deleteVehicle _x;};}forEach attachedObjects _myBod+[objectParent _myBod];hintSilent"";}];

player addMPEventHandler["MPRespawn",{
0 enableChannel r_glCH;1 enableChannel r_sCH;3 enableChannel r_grCH;5 enableChannel r_dCH;6 enableChannel true;0 fadeSpeech 1;
if(leader player==player)then{2 enableChannel r_cCH;}else{2 enableChannel false;};
if(!isNull objectParent player)then{4 enableChannel r_vCH;}else{4 enableChannel false;};
}];

//BRIEFING: Helpful information / instructions for AFAR
player createDiarySubject["Arma Radio","ArmA Radio"];
player createDiaryRecord["Arma Radio",["Instructions Manual","
<font face='PuristaMedium' size=30 shadow='5' color='#808000'>ADDON-FREE ARMA RADIO</font></size><b/><br/>Created by Phronk<br/>
<font face='PuristaMedium' size=12 color='#8E8E8E'>__________________________________</font></size><br/><br/>
<font face='PuristaMedium' size=20 color='#808000'>RADIO SETUP</font></size><br/>
     0. Use a PUSH TO TALK key to talk via radio<br/><br/>
     1. Open the in-game menu and go into 'Configure/Controls/Multiplayer'<br/><br/>
     2. Set your PUSH TO TALK or TALK ON GROUP CHANNEL key<br/><br/>
     3. Set your TALK ON DIRECT CHANNEL key to whatever you prefer<br/><br/>
     4. Unbind your VoiceOverNet keybind!
     5. Raise VON volume slider in AUDIO settings<br/><br/>

<font face='PuristaMedium' size=20 color='#808000'>OPERATING RADIO</font></size><br/>
• PUSH TO TALK key(s) to use radio<br/><br/>
• Radio channels are <font color='#2AA1D5'>SIDE</font>, <font color='#fffaa3'>COMMAND</font>, <font color='#b6f442'>GROUP</font>, and <font color='#f4c542'>VEHICLE</font><br/><br/>
• Radio must be equipped to send/receive transmissions<br/><br/>
• You must be within 1050m of another friendly soldier with a radio<br/><br/>
• Radio static intensifies every 150m away from closest recieving soldier<br/><br/>
• Only squad leaders can communicate via <font color='#fffaa3'>Command Channel</font><br/><br/>
• Only squadmates can communicate via <font color='#b6f442'>Group Channel</font><br/><br/>
• Only vehicle passengers can communicate via <font color='#f4c542'>Vehicle Channel</font><br/><br/>
• Cannot speak via <font color='#ffffff'>Direct Channel</font> while underwater<br/><br/>
• Cannot communicate if dead or underwater without rebreather<br/><br/>
• Cannot communicate via radio if incapacitated<br/><br/>
• Cannot communicate via radio if outside radio range"]];};

/*	Script Version: 0.4
	SCRIPT BY: Phronk
	CONTRIBUTIONS:
		1. Killzone_Kid fixed server globally distribute AFAR variable, in init.sqf
		2. Larrow helped improve radio keybind detection (inputAction)
*/