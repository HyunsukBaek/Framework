/*
�씠 �뒪�겕?��???���뒗 ARMA AOS �꽌踰꾩?�� �냼��??��?��?���땲�떎.
?��???���쑝濡� �닔�젙 諛� 諛고�? �떆 ?��몄젣媛� 諛쒖�?�맖�쓣 �븣�젮�뱶?��?��?���떎.
?��몄쓽 : magicianaos@gmail.com
�솃�럹�씠吏� : http://cafe.naver.com/alflrss
*/
//Metal Glide
removeAllWeapons player;
removeAllItems player;
removeAllAssignedItems player;
removeUniform player;
removeVest player;
removeBackpack player;
removeHeadgear player;
removeGoggles player;


player forceAddUniform "sab_EXT_Uniform";
player addBackpack "FLAY_HangGlider_Bag";
player addHeadgear "H_GuyFawkesMask";

player addWeapon "bv_FlashLight";
player addWeapon "Rangefinder";

player linkItem "ItemMap";
player linkItem "ItemCompass";
player linkItem "ItemWatch";
player linkItem "ItemRadio";
player linkItem "ItemGPS";