/*
ï¿½ì”  ï¿½ë’ªï¿½ê²•?”±???“ƒï¿½ë’— ARMA AOS ï¿½ê½Œè¸°ê¾©?“½ ï¿½ëƒ¼ï¿½ì??‡¾?‡±?—¯ï¿½ë•²ï¿½ë–.
?‡¾???–’ï¿½ì‘æ¿¡ï¿½ ï¿½ë‹”ï¿½ì ™ è«›ï¿½ è«›ê³ ë£? ï¿½ë–† ?‡¾ëª„ì £åª›ï¿½ è«›ì’–ê¹?ï¿½ë§–ï¿½ì“£ ï¿½ë¸£ï¿½ì ®ï¿½ë±¶?”±?ˆ?•²ï¿½ë–.
?‡¾ëª„ì“½ : magicianaos@gmail.com
ï¿½ì†ƒï¿½ëŸ¹ï¿½ì” ï§ï¿½ : http://cafe.naver.com/alflrss
*/
//Female Glide
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;

player forceAddUniform "A3L_Bikini_Girl";
for "_i" from 1 to 3 do {player addItemToUniform "30Rnd_45ACP_Mag_SMG_01";};
player addBackpack "FLAY_HangGliderBlack_Bag";

player addWeapon "bv_FlashLight";
player addWeapon "Rangefinder";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "I_UavTerminal";
player linkItem "NVGoggles_OPFOR";