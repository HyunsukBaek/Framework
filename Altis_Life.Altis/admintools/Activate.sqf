/*
�씠 �뒪�겕?��???���뒗 ARMA AOS �꽌踰꾩?�� �냼��??��?��?���땲�떎.
?��???���쑝濡� �닔�젙 諛� 諛고�? �떆 ?��몄젣媛� 諛쒖�?�맖�쓣 �븣�젮�뱶?��?��?���떎.
?��몄쓽 : magicianaos@gmail.com
�솃�럹�씠吏� : http://cafe.naver.com/alflrss
*/
waituntil {!alive player ; !isnull (finddisplay 46)};
if ((getPlayerUID player) in ["76561197996862052","76561198027776492"]) then {
	sleep 3;
	player addaction [("<t color=""#0074E8"">" + ("Tools Menu") +"</t>"),"admintools\Eexcute.sqf","",5,false,true,"",""];
};