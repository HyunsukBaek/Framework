/*
�씠 �뒪�겕?��???���뒗 ARMA AOS �꽌踰꾩?�� �냼��??��?��?���땲�떎.
?��???���쑝濡� �닔�젙 諛� 諛고�? �떆 ?��몄젣媛� 諛쒖�?�맖�쓣 �븣�젮�뱶?��?��?���떎.
?��몄쓽 : magicianaos@gmail.com
�솃�럹�씠吏� : http://cafe.naver.com/alflrss
*/
_pathtotools = "admintools\tools\";
_pathtovehicles = "admintools\vehicles\";
_EXECscript1 = 'player execVM "'+_pathtotools+'%1"';
_EXECscript2 = 'player execVM "'+_pathtovehicles+'%1"';
//customise these menus to fit your server
if ((getPlayerUID player) in ["76561197996862052","76561198027776492"]) then { //all admins
	if ((getPlayerUID player) in ["76561197996862052","76561198027776492"]) then { //mods
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:ModToolsMenu", -5, [["expression", ""]], "1", "1"],
			["Exit", [3], "", -3, [["expression", ""]], "1", "1"]
        ];};
	if ((getPlayerUID player) in ["76561197996862052","76561198027776492"]) then { //admins
        adminmenu =
        [
			["",true],
				["Tools Menu", [2], "#USER:AdminToolsMenu", -5, [["expression", ""]], "1", "1"],
			["Exit", [3], "", -3, [["expression", ""]], "1", "1"]
        ];};
	if ((getPlayerUID player) in ["76561197996862052","76561198027776492"]) then { // super admins
		adminmenu =
		[
			["",true],
				["Tools Menu", [2], "#USER:ToolsMenu", -5, [["expression", ""]], "1", "1"],
			["Exit", [3], "", -3, [["expression", ""]], "1", "1"]
		];};
};
//customise to fit
ModToolsMenu =
[
	["",true],
		["Open Arsenal", [2],  "", -5, [["expression", format [_EXECscript1,"OpenArsenal.sqf"]]], "1", "1"],
		["Light Bullet", [3], "", -5, [["expression", format [_EXECscript1, "LightBullet.sqf"]]], "1", "1"],
		["Add RocketPackBag", [4], "", -5, [["expression", format [_EXECscript1, "JetPack.sqf"]]], "1", "1"],
		["Add GliderBag", [5], "", -5, [["expression", format [_EXECscript1, "Glider.sqf"]]], "1", "1"],
		["Fix Building", [6], "", -5, [["expression", format [_EXECscript1, "fixbuildings.sqf"]]], "1", "1"],
		["Exit", [7], "", -3, [["expression", ""]], "1", "1"]
];
//customise to fit
AdminToolsMenu =
[
	["",true],
		["Open Arsenal", [2],  "", -5, [["expression", format [_EXECscript1,"OpenArsenal.sqf"]]], "1", "1"],
		["Light Bullet", [3], "", -5, [["expression", format [_EXECscript1, "LightBullet.sqf"]]], "1", "1"],
		["Add RocketPackBag", [4], "", -5, [["expression", format [_EXECscript1, "JetPack.sqf"]]], "1", "1"],
		["Add GliderBag", [5], "", -5, [["expression", format [_EXECscript1, "Glider.sqf"]]], "1", "1"],
		["Fix Building", [6], "", -5, [["expression", format [_EXECscript1, "fixbuildings.sqf"]]], "1", "1"],
		["Exit", [7], "", -3, [["expression", ""]], "1", "1"]
];
ToolsMenu =
[
	["",true],
		["Open Arsenal", [2],  "", -5, [["expression", format [_EXECscript1,"OpenArsenal.sqf"]]], "1", "1"],
		["Light Bullet", [3], "", -5, [["expression", format [_EXECscript1, "LightBullet.sqf"]]], "1", "1"],
		["Add RocketPackBag", [4], "", -5, [["expression", format [_EXECscript1, "JetPack.sqf"]]], "1", "1"],
		["Add GliderBag", [5], "", -5, [["expression", format [_EXECscript1, "Glider.sqf"]]], "1", "1"],
		["Fix Building", [6], "", -5, [["expression", format [_EXECscript1, "fixbuildings.sqf"]]], "1", "1"],
		["Exit", [7], "", -3, [["expression", ""]], "1", "1"]
];
showCommandingMenu "#USER:adminmenu";