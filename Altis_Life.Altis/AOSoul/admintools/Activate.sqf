waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["76561198080113617","76561198055045009","76561198027776492"]) then {
	sleep 3;
	player addaction [("<t color=""#0074E8"">" + ("Tools Menu") +"</t>"),"AOSoul\admintools\Eexcute.sqf","",5,false,true,"",""];
};