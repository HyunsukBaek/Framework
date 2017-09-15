class CarShops {
    /*
    *    ARRAY FORMAT:
    *        0: STRING (Classname)
    *        1: STRING (Condition)
    *    FORMAT:
    *        STRING (Conditions) - Must return boolean :
    *            String can contain any amount of conditions, aslong as the entire
    *            string returns a boolean. This allows you to check any levels, licenses etc,
    *            in any combination. For example:
    *                "call life_coplevel && license_civ_someLicense"
    *            This will also let you call any other function.
    *
    *   BLUFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_WEST
    *   OPFOR Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_EAST
    *   Independent Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_GUER
    *   Civilian Vehicle classnames can be found here: https://community.bistudio.com/wiki/Arma_3_CfgVehicles_CIV
    */
    class civ_car {
        side = "civ";
        conditions = "";
        vehicles[] = {
            //쿼드바이크
            { "B_Quadbike_01_F", "" },
            //해치백
            { "C_Hatchback_01_F", "" },
            //오프로드
            { "C_Offroad_01_F", "" },
            //SUV
            { "C_SUV_01_F", "" },
            //해치백 스포츠
            { "C_Hatchback_01_sport_F", "license_civ_level2" },
            //트럭 기본
            { "C_Van_01_transport_F", "" },
            { "C_IDAP_Van_02_transport_F", "" },
            { "C_Van_02_transport_F", "" },
            { "C_Van_02_service_F", "" },
            //오프로드
            { "C_Offroad_02_unarmed_F", "" } //Apex DLC
        };
    };

    class kart_shop {
        side = "civ";
        conditions = "";
        vehicles[] = {
            { "C_Kart_01_Blu_F", "" },
            { "C_Kart_01_Fuel_F", "" },
            { "C_Kart_01_Red_F", "" },
            { "C_Kart_01_Vrana_F", "" }
        };
    };

    class civ_truck {
        side = "civ";
        conditions = "";
        vehicles[] = {
            //트럭(박스)
            { "C_Van_01_box_F", "" },
            //자마크 수송(덮개)
            { "I_Truck_02_covered_F", "" },
            //HEMTT 박스
            { "B_Truck_01_box_F", "license_civ_level1" },
            //HEMTT 수송
            { "B_Truck_01_transport_F", "license_civ_level1" },
            //템페스트 장치
            { "O_Truck_03_device_F", "license_civ_level3" },
            //트럭 연료
            { "C_Van_01_fuel_F", "" },
            //자마크 연료
            { "I_Truck_02_fuel_F", "license_civ_level1" },
            //HEMTT 연료
            { "B_Truck_01_fuel_F", "license_civ_level2" },
            //템페스트 연료
            { "O_Truck_03_fuel_F", "license_civ_level3" }

        };
    };

    class civ_air {
        side = "civ";
        conditions = "";
        vehicles[] = {
            //M-900
            { "C_Heli_Light_01_civil_F", "" },
            //허밍버드
            { "B_Heli_Light_01_F", "license_civ_level1" },
            //오르카
            { "O_Heli_Light_02_unarmed_F", "license_civ_level2" },
            //모호크
            { "I_Heli_Transport_02_F", "license_civ_level3" },
            //휴론 비무장
            { "B_Heli_Transport_03_unarmed_F", "license_civ_level4" },
            //Caesar BTT 경비행기
            { "C_Plane_Civil_01_F", "license_civ_level1" }, //Apex DLC
            { "C_Plane_Civil_01_racing_F", "call life_donorlevel >= 1" },//Apex DLC

            //JET
            { "O_Plane_Fighter_02_F", "license_civ_level5" },
            { "O_Plane_Fighter_02_Stealth_F", "license_civ_level5" },
            { "O_Plane_CAS_02_dynamicLoadout_F", "license_civ_level5" },
            { "I_Plane_Fighter_04_F", "license_civ_level5" },
            { "I_Plane_Fighter_03_dynamicLoadout_F", "license_civ_level5" },
            { "O_T_VTOL_02_infantry_dynamicLoadout_F", "license_civ_level5" },
            { "O_T_VTOL_02_vehicle_dynamicLoadout_F", "license_civ_level5" }



        };
    };

     class civ_ship {
        side = "civ";
        conditions = "";
        vehicles[] = {
            //고무 보트
            { "C_Rubberboat", "" },
            { "B_Lifeboat", "" },
            //공격단정 (고무보트와 외형 똑같음)
            { "O_Boat_Transport_01_F", "license_civ_level2" },
            { "I_Boat_Transport_01_F", "license_civ_level2" },
            //모터 보트
            { "C_Boat_Civil_01_F", "" },
            //SDV 잠수함
            { "B_SDV_01_F", "license_civ_level1" },
            { "O_SDV_01_F", "license_civ_level1" },
            { "I_SDV_01_F", "license_civ_level1" },
            //RHIB(낚시배)
            { "C_Boat_Transport_02_F", "license_civ_level2" }, //Apex DLC
            //수상 스쿠터
            { "C_Scooter_Transport_01_F", "license_civ_level1" } //Apex DLC
        };
    };

    class reb_car {
        side = "civ";
        conditions = "";
        vehicles[] = {
            //쿼드바이크
            { "B_Quadbike_01_F", "" },
            //오프로드
            { "B_G_Offroad_01_F", "" },
            { "C_Offroad_02_unarmed_F", "" }, //Apex DLC
            //이프리트
            { "O_MRAP_02_F", "license_civ_level2" },
            //Qilin 비무장
            { "O_T_LSV_02_unarmed_F", "" }, //Apex DLC
            //Prowler 비무장
            { "B_T_LSV_01_unarmed_F", "" }, //APEX DLC
            //오프로드 무장
            { "B_G_Offroad_01_armed_F", "license_civ_level2" },
            //Prowler(무장)
            { "B_T_LSV_01_armed_F", "license_civ_level4" }, //APEX DLC
            //Qilin(무장)
            { "O_T_LSV_02_armed_F", "license_civ_level5" }, //APEX DLC
            //MH-9 허밍버드(반군)
            { "B_Heli_Light_01_stripped_F", "" },
            //오르카(비무장)
            { "O_Heli_Light_02_unarmed_F", "license_civ_level1" },
            //헬켓(비무장)
            { "I_Heli_light_03_unarmed_F", "license_civ_level1" },
            //타루 벤치
            { "O_Heli_Transport_04_bench_F", "license_civ_level1" },
            //V-44X 블랙피쉬 보병수송
            { "B_T_VTOL_01_infantry_F", "license_civ_level5" },
            //V-44X 블랙피쉬 차량수송
            { "B_T_VTOL_01_vehicle_F", "license_civ_level5" },
            //PO-30 오르카 무장
            { "O_Heli_Light_02_F", "license_civ_level5" },
            //고스트 호크
            { "B_Heli_Transport_01_F", "license_civ_level3" },
            //Mi-48 카이만
            { "O_Heli_Attack_02_F", "license_civ_level5" },
            //WY-55 핼켓(무장)
            { "I_Heli_light_03_F", "license_civ_level4" }
        };
    };

    class med_shop {
        side = "med";
        conditions = "";
        vehicles[] = {
            //쿼드바이크
            { "B_Quadbike_01_F", "" },
            { "C_Hatchback_01_F", "" },
            { "C_Hatchback_01_sport_F", "" },
            { "C_Offroad_02_unarmed_F", "" }, //Apex DLC
            //SUV
            { "C_SUV_01_F", "" },
            //오프로드
            { "C_Offroad_01_F", "" },
            { "C_Van_01_box_F", "" },
            { "B_MRAP_01_F", "call life_donorlevel >= 1" },
            //스트라이더
            { "I_MRAP_03_F", "" },
            { "C_Van_02_medevac_F", "" },
            { "C_IDAP_Van_02_medevac_F", "" },

            //자마크 의무
            { "I_Truck_02_medical_F", "" },
            //템페스트 의무
            { "O_Truck_03_medical_F", "" },
            //HEMTT 의무
            { "B_Truck_01_medical_F", "call life_donorlevel >= 2" },
            //자마크 정비
            { "I_Truck_02_box_F", "" },
            //템페스트 정비
            { "O_Truck_03_repair_F", "" },
            //HEMTT 정비
            { "B_Truck_01_Repair_F", "" },
            //HEMTT 기본형 토우트럭으로 활용
            { "B_Truck_01_mover_F", "" }
        };
    };

    class med_air_hs {
        side = "med";
        conditions = "";
        vehicles[] = {
            //허밍버드
            { "B_Heli_Light_01_F", "" },
            //오르카
            { "O_Heli_Light_02_unarmed_F", "" },
            //모호크
            { "I_Heli_Transport_02_F", "" },

            //고스트 호크
            { "B_Heli_Transport_01_F", "call life_mediclevel >= 4" },
            //타루 기본
            { "O_Heli_Transport_04_F", ""},
            //타루 수리
            { "O_Heli_Transport_04_repair_F", "" },
            //타루 연료
            { "O_Heli_Transport_04_fuel_F", "" },
            //타루 수송
            { "O_Heli_Transport_04_covered_F", "" },
            //타루 의료
            { "O_Heli_Transport_04_medevac_F", "" }
        };
    };

    class med_air_ground {
        side = "med";
        conditions = "";
        vehicles[] = {
            //허밍버드
            { "B_Heli_Light_01_F", "" },
            //오르카
            { "O_Heli_Light_02_unarmed_F", "" },
            //모호크
            { "I_Heli_Transport_02_F", "" },

            //고스트 호크
            { "B_Heli_Transport_01_F", "call life_mediclevel >= 4" },
            //타루 기본
            { "O_Heli_Transport_04_F", ""},
            //타루 수리
            { "O_Heli_Transport_04_repair_F", "" },
            //타루 연료
            { "O_Heli_Transport_04_fuel_F", "" },
            //타루 수송
            { "O_Heli_Transport_04_covered_F", "" },
            //타루 의료
            { "O_Heli_Transport_04_medevac_F", "" }
        };
    };

    class med_ship {
        side = "med";
        conditions = "";
        vehicles[] = {
                //모터보트
                { "C_Boat_Civil_01_rescue_F", "" },
                //RHIB 낚시배
                { "C_Boat_Transport_02_F", "" }, //Apex DLC
                //SDV 잠수함
                { "I_SDV_01_F", "" }
        };
    };

    class cop_car {
        side = "cop";
        conditions = "";
        vehicles[] = {
            //쿼드바이크
            { "B_Quadbike_01_F", "" },
            //오프로드
            { "C_Offroad_01_F", "" },
            //SUV
            { "C_SUV_01_F", "" },
            //해치백 스포츠
            { "C_Hatchback_01_sport_F", "call life_coplevel >= 1" },
            //오프로드
            { "C_Offroad_02_unarmed_F", "call life_coplevel >= 3" },
            //스트라이더
            { "I_MRAP_03_F", "" },
            //스트라이더 HMG
            { "I_MRAP_03_hmg_F", "call life_coplevel >= 4" },
            //헌터
            { "B_MRAP_01_F", "call life_coplevel >= 2" },
            //헌터 HMG
            { "B_MRAP_01_hmg_F", "call life_coplevel >= 5" },
            //자마크수송
            { "I_Truck_02_covered_F", "" },
            //자마크 탄약
            { "I_Truck_02_ammo_F", "" },
            //템페스트 탄약
            { "O_Truck_03_ammo_F", "" },
            //HEMTT 탄약
            { "B_Truck_01_ammo_F", "call life_coplevel >= 4" }
        };
    };

    class cop_air {
        side = "cop";
        conditions = "call life_coplevel >= 3";
        vehicles[] = {
            //MH-9 허밍버드
            { "B_Heli_Light_01_F", "" },
            //모호크
            { "I_Heli_Transport_02_F", "" },
            //헬켓(비무장)
            { "I_Heli_light_03_unarmed_F", "" },
            //타루 기본
            { "O_Heli_Transport_04_F", "" },
            //타루 수송
            { "O_Heli_Transport_04_covered_F", "" },
            //휴론 비무장
            { "B_Heli_Transport_03_unarmed_F", "" },
            //포니
            { "B_Heli_Light_01_armed_F", "call life_coplevel >= 5" },
            //WY-55 핼켓(무장)
            { "I_Heli_light_03_F", "call life_coplevel >= 4" },
            //블랙풋
            { "B_Heli_Attack_01_F", "call life_coplevel >= 5" },
            //고스트 호크
            { "B_Heli_Transport_01_F", "call life_coplevel >= 3" },
            //휴론
            { "B_Heli_Transport_03_F", "call life_coplevel >= 4" },

            { "B_Plane_CAS_01_dynamicLoadout_F", "call life_coplevel >= 4" },
            { "B_Plane_Fighter_01_Stealth_F", "call life_coplevel >= 4" },
            { "B_Plane_Fighter_01_F", "call life_coplevel >= 4" }

        };
    };

    class cop_ship {
        side = "cop";
        conditions = "";
        vehicles[] = {
            //공격 단정
            { "B_Boat_Transport_01_F", "" },
            //모터보트
            { "C_Boat_Civil_01_police_F", "" },
            { "C_Boat_Civil_01_rescue_F", "" },
            //RHIB 낚시배
            { "C_Boat_Transport_02_F", "" }, //Apex DLC
            //쾌속정 미니건
            { "B_Boat_Armed_01_minigun_F", "call life_coplevel >= 4" },
            //쾌속정 HMG
            { "O_Boat_Armed_01_hmg_F", "call life_coplevel >= 4" },
            //SDV 잠수함
            { "B_SDV_01_F", "" },
            { "O_SDV_01_F", "" },
            { "I_SDV_01_F", "" }
        };
    };
};

class LifeCfgVehicles {
    /*
    *    Vehicle Configs (Contains textures and other stuff)
    *
    *    "price" is the price before any multipliers set in Master_Config are applied.
    *
    *    Default Multiplier Values & Calculations:
    *       Civilian [Purchase, Sell]: [1.0, 0.5]
    *       Cop [Purchase, Sell]: [0.5, 0.5]
    *       Medic [Purchase, Sell]: [0.75, 0.5]
    *       ChopShop: Payout = price * 0.25
    *       GarageSell: Payout = price * [0.5, 0.5, 0.5, -1]
    *       Cop Impound: Payout = price * 0.1
    *       Pull Vehicle from Garage: Cost = price * [1, 0.5, 0.75, -1] * [0.5, 0.5, 0.5, -1]
    *           -- Pull Vehicle & GarageSell Array Explanation = [civ,cop,medic,east]
    *
    *       1: STRING (Condition)
    *    Textures config follows { Texture Name, side, {texture(s)path}, Condition}
    *    Texture(s)path follows this format:
    *    INDEX 0: Texture Layer 0
    *    INDEX 1: Texture Layer 1
    *    INDEX 2: Texture Layer 2
    *    etc etc etc
    *
    */

    class Default {
        vItemSpace = 20;
        conditions = "";
        price = 500000;
        textures[] = {};
    };

    // Apex DLC
    class C_Boat_Transport_02_F {
        vItemSpace = 100;
        conditions = "license_civ_boat || {!(playerSide isEqualTo civilian)}";
        price = 320000;
        textures[] = {
            { "Civilian", "civ", {
                "\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_exterior_civilian_CO.paa"
            }, "" },
            { "Black", "cop", {
                "\A3\Boat_F_Exp\Boat_Transport_02\Data\Boat_Transport_02_exterior_CO.paa"
            }, "" }
        };
    };

    // Apex DLC
    class C_Offroad_02_unarmed_F {
        vItemSpace = 70;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 460000;
        textures[] = {
            { "Black", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_black_co.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_blue_co.paa"
            }, "" },
            { "Green", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_green_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_orange_co.paa"
            }, "" },
            { "Red", "med", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_red_co.paa"
            }, "" },
            { "White", "civ", {
                "\A3\Soft_F_Exp\Offroad_02\Data\offroad_02_ext_white_co.paa"
            }, "" },
            { "Cop Offroad", "cop", {
                "textures\AOSoul\vehicles\offroad_4wdcop.paa"
            }, "" }
        };
    };

    // Apex DLC
    class C_Plane_Civil_01_F {
        vItemSpace = 80;
        conditions = "license_civ_pilot || {!(playerSide isEqualTo civilian)}";
        price = 1500000;
        textures[] = {
            { "Racing (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Racing", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Racer_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" },
            { "Red Line (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Red Line", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_RedLine_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" },
            { "Tribal (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Tribal", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Tribal_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" },
            { "Blue Wave (Tan Interior)", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_tan_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_tan_co.paa"
            }, "" },
            { "Blue Wave", "civ", {
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_01_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_ext_02_Wave_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_01_co.paa",
                "A3\Air_F_Exp\Plane_Civil_01\Data\btt_int_02_co.paa"
            }, "" }
        };
    };

    class C_Plane_Civil_01_racing_F : C_Plane_Civil_01_F{};

    // Apex DLC
    class B_T_VTOL_01_infantry_F {
        vItemSpace = 500;
        conditions = "license_civ_pilot || license_civ_rebel || {!(playerSide isEqualTo civilian)}";
        price = 5000000;
        textures[] = {};
    };
    class B_T_VTOL_01_vehicle_F : B_T_VTOL_01_infantry_F{};

    // Apex DLC
    class C_Scooter_Transport_01_F {
        vItemSpace = 80;
        conditions = "license_civ_boat || {!(playerSide isEqualTo civilian)}";
        price = 100000;
        textures[] = {
            { "Black", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Black_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Black_CO.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Blue_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Blue_co.paa"
            }, "" },
            { "Grey", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Grey_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Grey_co.paa"
            }, "" },
            { "Green", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Lime_co.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Lime_co.paa"
            }, "" },
            { "Red", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Red_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"
            }, "" },
            { "White", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_CO.paa"
            }, "" },
            { "Yellow", "civ", {
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_Yellow_CO.paa",
                "\A3\Boat_F_Exp\Scooter_Transport_01\Data\Scooter_Transport_01_VP_Yellow_CO.paa"
            }, "" }
        };
    };

    // Apex DLC
    class O_T_LSV_02_unarmed_F {
        vItemSpace = 100;
        conditions = "";
        price = 300000;
        textures[] = {
            { "Arid", "civ", {
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_arid_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_arid_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_arid_CO.paa"
            }, "" },
            { "Black", "civ", {
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_black_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_black_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_black_CO.paa"
            }, "" },
            { "Green Hex", "civ", {
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_01_ghex_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_02_ghex_CO.paa",
                "\A3\Soft_F_Exp\LSV_02\Data\CSAT_LSV_03_ghex_CO.paa"
            }, "" }
        };
    };

    class I_Truck_02_medical_F {
        vItemSpace = 100;
        conditions = "";
        price = 500000;
        textures[] = {};
    };

    class O_Truck_03_medical_F {
        vItemSpace = 150;
        conditions = "";
        price = 550000;
        textures[] = {};
    };

    class B_Truck_01_medical_F {
        vItemSpace = 200;
        conditions = "";
        price = 600000;
        textures[] = {};
    };

    class I_Truck_02_box_F {
        vItemSpace = 100;
        conditions = "";
        price = 500000;
        textures[] = {};
    };

    class O_Truck_03_repair_F {
        vItemSpace = 150;
        conditions = "";
        price = 550000;
        textures[] = {};
    };

    class B_Truck_01_Repair_F {
        vItemSpace = 200;
        conditions = "";
        price = 800000;
        textures[] = {};
    };

    class C_Rubberboat {
        vItemSpace = 50;
        conditions = "license_civ_boat || {!(playerSide isEqualTo civilian)} || license_cop_cg || {!(playerSide isEqualTo west)}";
        price = 150000;
        textures[] = { };
    };
    class B_Boat_Transport_01_F : C_Rubberboat{};
    class O_Boat_Transport_01_F : C_Rubberboat{};
    class I_Boat_Transport_01_F : C_Rubberboat{};
    class B_Lifeboat : C_Rubberboat{};

    class B_Heli_Light_01_armed_F {
        vItemSpace = 50;
        conditions = "license_cop_cAir || {!(playerSide isEqualTo west)}";
        price = 11000000;
        textures[] = {};
    };

    class B_Heli_Attack_01_F {
        vItemSpace = 50;
        conditions = "license_cop_cAir || {!(playerSide isEqualTo west)}";
        price = 15000000;
        textures[] = {};
    };

    class B_Heli_Transport_01_F {
        vItemSpace = 100;
        conditions = "license_cop_cAir || {!(playerSide isEqualTo west)} || license_civ_rebel";
        price = 4500000;
        textures[] = {
            { "Beautiful", "reb", {
                "textures\AOSoul\vehicles\ghosthawk_Reb_Gay_1.paa",
                "textures\AOSoul\vehicles\ghosthawk_Reb_Gay_2.paa",
                "textures\AOSoul\vehicles\ghosthawk_Reb_Gay_3.paa"
            }, "" },
            { "Kitty", "civ", {
                "textures\AOSoul\vehicles\ghosthawk_Reb_Kitty_1.paa",
                "textures\AOSoul\vehicles\ghosthawk_Reb_Kitty_2.paa",
                "textures\AOSoul\vehicles\ghosthawk_Reb_Kitty_3.paa"
            }, "" },
            { "KoreanAir", "civ", {
                "textures\AOSoul\vehicles\ghosthawk_Koreanair1.paa",
                "textures\AOSoul\vehicles\ghosthawk_Koreanair2.paa"
            }, "call life_donorlevel >= 1" },
            { "Cop", "cop", {
                "textures\AOSoul\vehicles\ghosthawk_cop_white1.paa",
                "textures\AOSoul\vehicles\ghosthawk_cop_white2.paa"
            }, "" },
            { "EMS white", "med", {
				"textures\AOSoul\vehicles\ghosthawk_EMS_kor1.paa",
				"textures\AOSoul\vehicles\ghosthawk_EMS_kor2.paa"
			}, "" }
        };
    };

    class B_Heli_Transport_03_F {
        vItemSpace = 300;
        conditions = "license_cop_cAir || {!(playerSide isEqualTo west)}";
        price = 10000000;
        textures[] = {};
    };

    class O_Heli_Light_02_F {
        vItemSpace = 80;
        conditions = "license_civ_rebel || {!(playerSide isEqualTo civilian)}";
        price = 6000000;
        textures[] = {
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            }, "" },
            { "Desert Digi", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            }, "" },
            { "Reb Custom 1", "reb", {
                "textures\AOSoul\vehicles\orca_Reb_Custom_1.paa"
            }, "" },
            { "Reb Custom 2", "reb", {
                "textures\AOSoul\vehicles\orca_Reb_Custom_2.paa"
            }, "" },
            { "Reb Custom 3", "reb", {
                "textures\AOSoul\vehicles\orca_Reb_Custom_3.paa"
            }, "" },
            { "Reb Custom 4", "reb", {
                "textures\AOSoul\vehicles\orca_Reb_Custom_4.paa"
            }, "" },
            { "Reb Custom 5", "reb", {
                "textures\AOSoul\vehicles\orca_Reb_Custom_5.paa"
            }, "" }
        };
    };

    class O_Heli_Attack_02_F {
        vItemSpace = 50;
        conditions = "license_civ_rebel || {!(playerSide isEqualTo civilian)}";
        price = 26000000;
        textures[] = {};
    };

    class I_Heli_light_03_F {
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir} || license_civ_rebel";
        price = 9000000;
        textures[] = {
            { "Swat", "cop", {
                "textures\AOSoul\vehicles\hellcat_Cop_Swat_1.paa",
            }, "" },
            { "Dragon", "reb", {
                "textures\AOSoul\vehicles\hellcat_Reb_Dragon_1.paa",
            }, "" }
        };
    };

    class B_Boat_Armed_01_minigun_F {
        vItemSpace = 50;
        conditions = "license_cop_cg || {!(playerSide isEqualTo west)}";
        price = 800000;
        textures[] = { };
    };
    class O_Boat_Armed_01_hmg_F : B_Boat_Armed_01_minigun_F{};

    class O_Truck_03_transport_F {
        vItemSpace = 320;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 360000;
        textures[] = { };
    };

    class O_Truck_03_device_F {
        vItemSpace = 350;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 2800000;
        textures[] = { };
    };

    class Land_CargoBox_V1_F {
        vItemSpace = 5000;
        conditions = "";
        price = -1;
        textures[] = {};
    };

    class Box_IND_Grenades_F {
        vItemSpace = 350;
        conditions = "";
        price = -1;
        textures[] = {};
    };

    class B_supplyCrate_F {
        vItemSpace = 700;
        conditions = "";
        price = -1;
        textures[] = {};
    };

    class B_G_Offroad_01_F {
        vItemSpace = 65;
        conditions = "";
        price = 12500;
        textures[] = { };
    };

    class B_G_Offroad_01_armed_F {
        vItemSpace = 50;
        conditions = "license_civ_rebel || {!(playerSide isEqualTo civilian)}";
        price = 700000;
        textures[] = { };
    };

    class B_T_LSV_01_armed_F {
        vItemSpace = 50;
        conditions = "license_civ_rebel || {!(playerSide isEqualTo civilian)}";
        price = 2000000;
        textures[] = { };
    };
    class O_T_LSV_02_armed_F : B_T_LSV_01_armed_F{};

    class B_T_LSV_01_unarmed_F {
        vItemSpace = 130;
        conditions = "license_civ_rebel || {!(playerSide isEqualTo civilian)}";
        price = 320000;
        textures[] = { };
    };

    class C_Boat_Civil_01_F {
        vItemSpace = 85;
        conditions = "license_civ_boat || {!(playerSide isEqualTo civilian)}";
        price = 300000;
        textures[] = { };
    };

    class C_Boat_Civil_01_police_F {
        vItemSpace = 85;
        conditions = "license_cop_cg || {!(playerSide isEqualTo west)}";
        price = 100000;
        textures[] = { };
    };
    class C_Boat_Civil_01_rescue_F : C_Boat_Civil_01_police_F{};

    class B_Truck_01_box_F {
        vItemSpace = 350;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 1200000;
        textures[] = { };
    };

    class B_Truck_01_transport_F {
        vItemSpace = 250;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 1030000;
        textures[] = { };
    };

    class B_Truck_01_covered_F : B_Truck_01_transport_F{};

    class O_MRAP_02_F {
        vItemSpace = 80;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 1000000;
        textures[] = { };
    };

    class I_MRAP_03_F {
        vItemSpace = 80;
        conditions = "";
        price = 1000000;
        textures[] = {
            { "EMS white", "med", {"#(argb,8,8,3)color(1,1,1,0.8)"}, "" },
            { "Blue", "cop", {"#(argb,8,8,3)color(0.01,0.01,1.53,1)"}, "" },
            { "Police", "cop", {"textures\AOSoul\vehicles\strider_copblack.paa"}, "" }
        };
    };
    class I_MRAP_03_hmg_F : I_MRAP_03_F{};

    class C_Offroad_01_F {
        vItemSpace = 90;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 200000;
        textures[] = {
            { "Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            }, "" },
            { "Yellow", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE01_CO.paa"
            }, "" },
            { "White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE02_CO.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE03_CO.paa"
            }, "" },
            { "Dark Red", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE04_CO.paa"
            }, "" },
            { "Blue / White", "civ", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_BASE05_CO.paa"
            }, "" },
            { "Hello kitty", "civ",    {"textures\AOSoul\vehicles\offroad_kitty.paa"}, "" },
            { "EMS", "med", {
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa",
                "\A3\soft_F\Offroad_01\Data\offroad_01_ext_co.paa"
            }, "" },
            { "EMS Red", "med",        {"textures\AOSoul\vehicles\offroad_EMS_red.paa"}, "" },
            { "MetroCop", "cop",       {"textures\AOSoul\vehicles\offroad_met_police.paa"}, "" },
            { "UKPD", "cop",           {"textures\AOSoul\vehicles\offroad_uk.paa"}, "" },
            { "LAPD", "cop",           {"textures\AOSoul\vehicles\offroad_lapd.paa"}, "" },
            { "Traffic police", "cop", {"textures\AOSoul\vehicles\offroad_traffic.paa"}, "" },
            { "SWAT", "cop",           {"textures\AOSoul\vehicles\offroad_swat.paa"}, "" }
        };
    };

    class C_Kart_01_Blu_F {
        vItemSpace = 20;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 50000;
        textures[] = {};
    };
/*
To edit another information in this classes you can use this exemple.
class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{
    vItemSpace = 40;
    price = ;
};

will modify the virtual space and the price of the vehicle, but other information such as license and textures will pick up the vehicle declare at : Vehicle {};
*/
    class C_Kart_01_Fuel_F : C_Kart_01_Blu_F{}; // Get all information of C_Kart_01_Blu_F
    class C_Kart_01_Red_F : C_Kart_01_Blu_F{};
    class C_Kart_01_Vrana_F : C_Kart_01_Blu_F{};

    class B_Quadbike_01_F {
        vItemSpace = 30;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 30000;
        textures[] = {
            { "Police", "cop", {
                "textures\AOSoul\vehicles\quad_police.paa"
            }, "" },
            { "Digi Desert", "reb", {
                "\A3\Soft_F\Quadbike_01\Data\quadbike_01_opfor_co.paa"
            }, "" },
            { "Black", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_black_co.paa"
            }, "" },
            { "Blue", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_blue_co.paa"
            }, "" },
            { "Red", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_red_co.paa"
            }, "" },
            { "White", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_civ_white_co.paa"
            }, "" },
            { "Digi Green", "civ", {
                "\A3\Soft_F_beta\Quadbike_01\Data\quadbike_01_indp_co.paa"
            }, "" },
            { "Hunter Camo", "civ", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            }, "" },
            { "Rebel Camo", "reb", {
                "\a3\soft_f_gamma\Quadbike_01\data\quadbike_01_indp_hunter_co.paa"
            }, "" },
            { "EMS", "med", {
                "textures\AOSoul\vehicles\quad_med.paa"
            }, "" },
            { "LADY_후원1", "civ", {
                "textures\AOSoul\vehicles\quad_lady.paa"
            }, "call life_donorlevel >= 1" }
        };
    };

    class I_Truck_02_covered_F {
        vItemSpace = 280;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 800000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "" },
            { "Cola", "civ", {
                "textures\AOSoul\vehicles\zamak_cola_front.paa",
                "textures\AOSoul\vehicles\zamak_cola_back.paa"
            }, "" },
            { "RedBull", "civ", {
                "textures\AOSoul\vehicles\zamak_rebull_front.paa",
                "textures\AOSoul\vehicles\zamak_redbull_back.paa"
            }, "" },
            { "COP", "cop", {
                "textures\AOSoul\vehicles\zamak_cop_front.paa",
                "textures\AOSoul\vehicles\zamak_cop_back.paa"
            }, "" }
        };
    };

    class I_Truck_02_transport_F {
        vItemSpace = 280;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 300000;
        textures[] = {
            { "Orange", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\a3\soft_f_beta\Truck_02\data\truck_02_kuz_co.paa"
            }, "" },
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" }
        };
    };

    class O_Truck_03_covered_F {
        vItemSpace = 320;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 360000;
        textures[] = {};
    };

    class C_Hatchback_01_F {
        vItemSpace = 50;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 80000;
        textures[] = {
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base01_co.paa"
            }, "" },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base02_co.paa"
            }, "" },
            { "Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base03_co.paa"
            }, "" },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base04_co.paa"
            }, "" },
            { "Yellow", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base06_co.paa"
            }, "" },
            { "White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base07_co.paa"
            }, "" },
            { "Grey", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base08_co.paa"
            }, "" },
            { "Black", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_base09_co.paa"
            }, "" },
            { "Security", "cop", {
                "textures\AOSoul\vehicles\hatchback_secure.paa"
            }, "" },
            { "Subaru", "civ", {
                "textures\AOSoul\vehicles\hatchback_subaru.paa"
            }, "" },
            { "monster", "civ", {
                "textures\AOSoul\vehicles\hatchback_monster.paa"
            }, "" },
            { "EMS 119", "med", {
                "textures\AOSoul\vehicles\hatchback_med_119.paa"
            }, "" },
            { "EMS UK_후원1", "med", {
                "textures\AOSoul\vehicles\hatchback_EMSUK.paa"
            }, "call life_donorlevel >= 1" },
            { "KORPolice", "cop", {
                "textures\AOSoul\vehicles\hatchback_cop_kor.paa"
            }, "" },
            { "LAPD_후원2", "cop", {
                "textures\AOSoul\vehicles\hatchback_lapd.paa"
            }, "call life_donorlevel >= 2" },
            { "UKPD_후원1", "cop", {
                "textures\AOSoul\vehicles\hatchback_UKpolice.paa"
            }, "call life_donorlevel >= 1" },
            { "TAXI후원2", "civ", {
                "textures\AOSoul\vehicles\hatchback_altis_taxi.paa"
            }, "call life_donorlevel >= 2" }
        };
    };

    class C_Hatchback_01_sport_F {
        vItemSpace = 50;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 350000;
        textures[] = {
            { "Red", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport01_co.paa"
            }, "" },
            { "Dark Blue", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport02_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport03_co.paa"
            }, "" },
            { "Black / White", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport04_co.paa"
            }, "" },
            { "Beige", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport05_co.paa"
            }, "" },
            { "Green", "civ", {
                "\a3\soft_f_gamma\Hatchback_01\data\hatchback_01_ext_sport06_co.paa"
            }, "" },
            { "porsche", "civ", {
                "textures\AOSoul\vehicles\hatchback_porsche.paa"
            }, "" },
            { "Ferrari", "civ", {
                "textures\AOSoul\vehicles\hatchback_ferrari.paa"
            }, "" },
            { "EMS 119", "med", {
                "textures\AOSoul\vehicles\hatchback_med_119.paa"
            }, "" },
            { "EMS UK", "med", {
                "textures\AOSoul\vehicles\hatchback_EMSUK.paa"
            }, "call life_donorlevel >= 1" },
            { "KORPolice", "cop", {
                "textures\AOSoul\vehicles\hatchback_cop_kor.paa"
            }, "" },
            { "LAPD_후원2", "cop", {
                "textures\AOSoul\vehicles\hatchback_lapd.paa"
            }, "call life_donorlevel >= 2" },
            { "UKPD_후원1", "cop", {
                "textures\AOSoul\vehicles\hatchback_UKpolice.paa"
            }, "call life_donorlevel >= 1" },
            { "Interceptor", "cop", {
                "textures\AOSoul\vehicles\hatchback_cop_interceptor.paa"
            }, "call life_donorlevel >= 3" },
            { "TAXI후원2", "civ", {
                "textures\AOSoul\vehicles\hatchback_altis_taxi.paa"
            }, "call life_donorlevel >= 2" }
        };
    };

    class C_SUV_01_F {
        vItemSpace = 70;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 250000;
        textures[] = {
            { "Dark Red", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_co.paa"
            }, "" },
            { "Silver", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_03_co.paa"
            }, "" },
            { "Orange", "civ", {
                "\a3\soft_f_gamma\SUV_01\Data\suv_01_ext_04_co.paa"
            }, "" },
            { "Sticker_후원2", "civ",        {"textures\AOSoul\vehicles\suv_sticker.paa"}, "call life_donorlevel >= 2" },
            { "Hello kitty_후원1", "civ",    {"textures\AOSoul\vehicles\suv_kitty.paa"}, "call life_donorlevel >= 1" },
            { "Cube", "civ",                {"textures\AOSoul\vehicles\suv_cube.paa"}, "" },
            { "Hunters", "civ",             {"textures\AOSoul\vehicles\suv_hunter.paa"}, "" },
            { "Channel8_후원2", "civ",       {"textures\AOSoul\vehicles\suv_channel8.paa"}, "call life_donorlevel >= 2" },
            { "VIP", "civ",                 {"textures\AOSoul\vehicles\suv_vip.paa"}, "" },
            { "Security", "civ",            {"textures\AOSoul\vehicles\suv_security.paa"}, "" },
            { "Ferrari_후원3", "civ",        {"textures\AOSoul\vehicles\suv_ferrari.paa"}, "call life_donorlevel >= 3" },
            { "blueflames", "civ",          {"textures\AOSoul\vehicles\suv_flames.paa"}, "" },
            { "5taku_후원1", "civ",          {"textures\AOSoul\vehicles\suv_otaku.paa"}, "call life_donorlevel >= 1" },
            { "ghostRider_후원2", "civ",     {"textures\AOSoul\vehicles\suv_ghostrider.paa"}, "call life_donorlevel >= 2" },
            { "TAXI", "civ",                {"textures\AOSoul\vehicles\suv_taxi.paa"}, "" },
            { "EMS red_후원1", "med",        {"textures\AOSoul\vehicles\suv_EMS_dor2.paa"}, "call life_donorlevel >= 1" },
            { "EMS white", "med",           {"textures\AOSoul\vehicles\suv_EMS_white.paa"}, "" },
            { "EMS 119", "med",             {"textures\AOSoul\vehicles\suv_EMS_119.paa"}, "" },
            { "EMS119 후원2", "med",         {"textures\AOSoul\vehicles\suv_EMS_kor119.paa"}, "call life_donorlevel >= 2" },
            { "KOPD", "cop",                {"textures\AOSoul\vehicles\suv_112.paa"}, "" },
            { "LAPD", "cop",                {"textures\AOSoul\vehicles\suv_lapd.paa"}, "" },
            { "Blue poltan", "civ",         {"textures\AOSoul\vehicles\suv_bluepoltan.paa"}, "" },
            { "slime", "cop",               {"textures\AOSoul\vehicles\suv_slime.paa"}, "call life_donorlevel >= 4" },
            //Test
            { "Raptor", "cop",              {"textures\AOSoul\vehicles\suv_allblack_raptor.paa"}, "call life_donorlevel >= 4" },
            { "Flower_후원3", "civ",         {"textures\AOSoul\vehicles\suv_vip.paa"}, "call life_donorlevel >= 3" },
            { "검찰", "civ",                 {"textures\AOSoul\vehicles\suv_prosecutors_office.paa"}, "call life_donorlevel >= 5" },
            { "KOR119_black", "cop",       {"textures\AOSoul\vehicles\suv_interceptor_cop_black.paa"}, "call life_coplevel >= 5" },
            { "KOR119_sky", "cop",         {"textures\AOSoul\vehicles\suv_interceptor_cop_sky.paa"}, "call life_donorlevel >= 1" }


            /*
            { "Raptor", "cop",              {"textures\AOSoul\vehicles\suv_raptor.paa"}, "call life_donorlevel >= 4" },
            { "Flower_후원3", "civ",         {"textures\AOSoul\vehicles\suv_flower.paa"}, "call life_donorlevel >= 3" },
            { "검찰", "civ",                 {"textures\AOSoul\vehicles\suv_prosec.paa"}, "call life_donorlevel >= 5" }
            */

        };
    };

    class C_Van_01_transport_F {
        vItemSpace = 100;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 430000;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            }, "" },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            }, "" }
        };
    };

    class C_Van_01_box_F {
        vItemSpace = 200;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 570000;
        textures[] = {
            { "White", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_co.paa"
            }, "" },
            { "Red", "civ", {
                "\a3\soft_f_gamma\Van_01\Data\van_01_ext_red_co.paa"
            }, "" },
            { "EMS UK", "med", {
                "textures\AOSoul\vehicles\Van_01_box_Ambulance_front.paa",
                "textures\AOSoul\vehicles\Van_01_box_Ambulance_back.paa"
            }, "" },
            { "EMS Red_후원1", "med", {
                "textures\AOSoul\vehicles\Van_01_box_ambred_front.paa",
                "textures\AOSoul\vehicles\Van_01_box_ambred_back.paa"
            }, "" },
            { "AOSoul 택배", "civ", {
                "textures\AOSoul\vehicles\van_box_delivery_kor_front.paa",
                "textures\AOSoul\vehicles\van_box_delivery_kor_back.paa"
            }, "call life_donorlevel >= 1" }
        };
    };

    class B_MRAP_01_F {
        vItemSpace = 80;
        conditions = "";
        price = 1000000;
        textures[] = {
            { "Police", "cop", {
                "textures\AOSoul\vehicles\hunter_copblack_front.paa",
                "textures\AOSoul\vehicles\hunter_copblack_back.paa"}
            , "" },
            { "Scott police", "cop", {
                "textures\AOSoul\vehicles\hunter_scotpol_Front.paa",
                "textures\AOSoul\vehicles\hunter_scotpol_Back.paa"
            }, "" },
            { "EMS RED", "med", {
                "textures\AOSoul\vehicles\hunter_med_red_front.paa",
                "textures\AOSoul\vehicles\hunter_med_red_back.paa"
            }, "" }
        };
    };

    class B_MRAP_01_hmg_F {
        vItemSpace = 100;
        conditions = "";
        price = 750000;
        textures[] = {
            { "Police", "cop", {
                "textures\AOSoul\vehicles\hunter_copblack_front.paa",
                "textures\AOSoul\vehicles\hunter_copblack_back.paa"}
            , "" },
            { "Scott police", "cop", {
                "textures\AOSoul\vehicles\hunter_scotpol_Front.paa",
                "textures\AOSoul\vehicles\hunter_scotpol_Back.paa"
            }, "" },
        };
    };

    class B_Heli_Light_01_stripped_F {
        vItemSpace = 60;
        conditions = "";
        price = 800000;
        textures[] = {
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            }, "" },
            { "Reb 1_후원1", "reb", {
                "textures\AOSoul\vehicles\humming_Reb_1.paa"
            }, "call life_donorlevel >= 1" },
            { "Reb 2_후원2", "reb", {
                "textures\AOSoul\vehicles\humming_Reb_2.paa"
            }, "call life_donorlevel >= 2" },
            { "Reb 2_후원2", "reb", {
                "textures\AOSoul\vehicles\humming_Reb_3.paa"
            }, "call life_donorlevel >= 2" }
        };
    };

    class B_Heli_Light_01_F {
        vItemSpace = 60;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 900000;
        textures[] = {
            { "Sheriff", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sheriff_co.paa"
            }, "" },
            { "Civ Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_blue_co.paa"
            }, "" },
            { "Civ Red", "civ", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_co.paa"
            }, "" },
            { "Blueline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_blueline_co.paa"
            }, "" },
            { "Elliptical", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_elliptical_co.paa"
            }, "" },
            { "Furious", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_furious_co.paa"
            }, "" },
            { "Jeans Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_jeans_co.paa"
            }, "" },
            { "Speedy Redline", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_speedy_co.paa"
            }, "" },
            { "Sunset", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_sunset_co.paa"
            }, "" },
            { "Vrana", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_vrana_co.paa"
            }, "" },
            { "Waves Blue", "civ", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_wave_co.paa"
            }, "" },
            { "Rebel Digital", "reb", {
                "\a3\air_f\Heli_Light_01\Data\Skins\heli_light_01_ext_digital_co.paa"
            }, "" },
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_01\Data\heli_light_01_ext_indp_co.paa"
            }, "" },
            { "Gay Kitty", "civ", {
                "textures\AOSoul\vehicles\humming_Kitty.paa"
            }, "call life_donorlevel >= 3" },
            { "EMS YellowBlue", "med", {
                "textures\AOSoul\vehicles\humming_EMS_yellow.paa"
            }, "" },
            { "EMS Red", "med", {
                "textures\AOSoul\vehicles\humming_EMS_red.paa"
            }, "" },
            { "LAPD", "cop", {
                "textures\AOSoul\vehicles\humming_police_1.paa",
                "textures\AOSoul\vehicles\humming_police_2.paa"
            }, "" },
            { "KOR119", "cop", {
                "textures\AOSoul\vehicles\humming_korpolice.paa",
                "textures\AOSoul\vehicles\humming_korpolice2.paa"
            }, "" }
        };
    };

    class C_Heli_Light_01_civil_F : B_Heli_Light_01_F {};

    class O_Heli_Light_02_unarmed_F {
        vItemSpace = 100;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 1500000;
        textures[] = {
            { "Black", "cop", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_co.paa"
            }, "" },
            { "White / Blue", "civ", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_civilian_co.paa"
            }, "" },
            { "EMS White", "med", {
                "#(argb,8,8,3)color(1,1,1,0.8)"
            }, "" },
            { "EMS Red", "med", {
               "textures\AOSoul\vehicles\orca_EMS_red.paa"
            }, "" },
            { "Civ Custom 1", "civ", {
                "textures\AOSoul\vehicles\orca_Custom_1.paa"
            }, "" },
            { "Civ Custom 2", "civ", {
                "textures\AOSoul\vehicles\orca_Custom_2.paa"
            }, "" },
            { "Digi Green", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa"
            }, "" },
            { "Desert Digi", "reb", {
                "\a3\air_f\Heli_Light_02\Data\heli_light_02_ext_opfor_co.paa"
            }, "" },
            { "Reb Custom 1", "reb", {
                "textures\AOSoul\vehicles\orca_Reb_Custom_1.paa"
            }, "" },
            { "Reb Custom 2", "reb", {
                "textures\AOSoul\vehicles\orca_Reb_Custom_2.paa"
            }, "" },
            { "Reb Custom 3", "reb", {
                "textures\AOSoul\vehicles\orca_Reb_Custom_3.paa"
            }, "" },
            { "Reb Custom 4", "reb", {
                "textures\AOSoul\vehicles\orca_Reb_Custom_4.paa"
            }, "" },
            { "Reb Custom 5", "reb", {
                "textures\AOSoul\vehicles\orca_Reb_Custom_5.paa"
            }, "" }
        };
    };

    class I_Heli_Transport_02_F {
        vItemSpace = 150;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 2000000;
        textures[] = {
            { "Black", "cop", {
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)",
                "#(argb,8,8,3)color(0.05,0.05,0.05,1)"
            }, "" },
            { "Rescue Y", "med", {
                "textures\AOSoul\vehicles\Med_Mohawk_Yellow_1.paa",
                "textures\AOSoul\vehicles\Med_Mohawk_Yellow_2.paa",
                "textures\AOSoul\vehicles\Med_Mohawk_Yellow_3.paa"
            }, "" },
            { "Rescue R", "med", {
                "textures\AOSoul\vehicles\Med_Mohawk_Red_1.paa",
                "textures\AOSoul\vehicles\Med_Mohawk_Red_2.paa",
                "textures\AOSoul\vehicles\Med_Mohawk_Red_3.paa"
            }, "" },
        };
    };

    class I_Heli_light_03_unarmed_F {
        vItemSpace = 120;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir} || license_civ_rebel";
        price = 1300000;
        textures[] = {
            { "Swat", "cop", {
                "textures\AOSoul\vehicles\hellcat_Cop_Swat_1.paa",
            }, "" },
            { "Dragon", "reb", {
                "textures\AOSoul\vehicles\hellcat_Reb_Dragon_1.paa",
            }, "" }
        };
    };

    class B_Heli_Transport_03_unarmed_F {
        vItemSpace = 280;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 3500000;
        textures[] = {};
    };

    class O_Heli_Transport_04_F {
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 2000000;
        textures[] = {};
    };
    class O_Heli_Transport_04_bench_F : O_Heli_Transport_04_F{};
    class O_Heli_Transport_04_covered_F : O_Heli_Transport_04_F{};

    class O_Heli_Transport_04_box_F {
        vItemSpace = 180;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 2300000;
        textures[] = {};
    };

    class O_Heli_Transport_04_repair_F {
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 2000000;
        textures[] = {};
    };
    class O_Heli_Transport_04_fuel_F : O_Heli_Transport_04_repair_F{};
    class O_Heli_Transport_04_medevac_F : O_Heli_Transport_04_repair_F{};
    class O_Heli_Transport_04_ammo_F : O_Heli_Transport_04_repair_F{};

    class B_SDV_01_F {
        vItemSpace = 100;
        conditions = "license_civ_boat || {license_cop_cg} || {(playerSide isEqualTo independent)}";
        price = 150000;
        textures[] = {};
    };
    class O_SDV_01_F : B_SDV_01_F{};
    class I_SDV_01_F : B_SDV_01_F{};

    class C_Van_01_fuel_F {
        vItemSpace = 50;
        vFuelSpace = 19000;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 450000;
        textures[] = {
            { "White", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_co.paa"
            }, "" },
            { "Red", "civ", {
                "\A3\soft_f_gamma\Van_01\data\van_01_ext_red_co.paa",
                "\A3\soft_f_gamma\Van_01\data\van_01_tank_red_co.paa"
            }, "" }
        };
    };

    class I_Truck_02_fuel_F {
        vItemSpace = 50;
        vFuelSpace = 38000;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 800000;
        textures[] = {
            { "White", "civ", {
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_kab_co.paa",
                "\A3\Soft_F_Beta\Truck_02\data\truck_02_fuel_co.paa"
            }, "" }
        };
    };

    class B_Truck_01_fuel_F {
        vItemSpace = 50;
        vFuelSpace = 50000;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 1300000;
        textures[] = {};
    };

    class O_Truck_03_fuel_F {
        vItemSpace = 50;
        vFuelSpace = 65000;
        conditions = "license_civ_trucking || {!(playerSide isEqualTo civilian)}";
        price = 1750000;
        textures[] = {};
    };

    class B_Truck_01_mover_F {
        vItemSpace = 100;
        vFuelSpace = 500000;
        conditions = "";
        price = 650000;
        textures[] = {};
    };

    class I_Truck_02_ammo_F {
        vItemSpace = 100;
        conditions = "";
        price = 400000;
        textures[] = {};
    };

    class O_Truck_03_ammo_F {
        vItemSpace = 150;
        conditions = "";
        price = 550000;
        textures[] = {};
    };

    class B_Truck_01_ammo_F {
        vItemSpace = 200;
        conditions = "";
        price = 600000;
        textures[] = {};
    };

    //JET
    class O_Plane_Fighter_02_F { //shikra
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 80000000;
        textures[] = {};
    };

    class O_Plane_Fighter_02_Stealth_F {
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 85000000;
        textures[] = {};
    };

    class O_Plane_CAS_02_dynamicLoadout_F { //네오프론
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 70000000;
        textures[] = {};
    };

    class I_Plane_Fighter_04_F { //gryphon
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 67000000;
        textures[] = {};
    };

    class O_T_VTOL_02_infantry_dynamicLoadout_F {
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 70000000;
        textures[] = {};
    };

    class O_T_VTOL_02_vehicle_dynamicLoadout_F {
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 70000000;
        textures[] = {};
    };

    class I_Plane_Fighter_03_dynamicLoadout_F { //버자드
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 60000000;
        textures[] = {};
    };

    class B_Plane_CAS_01_dynamicLoadout_F { //와이프아웃 //경찰
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 30000000;
        textures[] = {};
    };

    class B_Plane_Fighter_01_Stealth_F { //블랙wasp2위장 // 경찰용
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 40000000;
        textures[] = {};
    };

    class B_Plane_Fighter_01_F { //블랙wasp2 //경찰
        vItemSpace = 50;
        conditions = "license_civ_pilot || {license_cop_cAir} || {license_med_mAir}";
        price = 40000000;
        textures[] = {};
    };

    class C_Van_02_transport_F {
        vItemSpace = 110;
        conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
        price = 1250000;
        textures[] = {};
    };

	class C_IDAP_Van_02_transport_F {
		vItemSpace = 110;
		conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
		price = 1350000;
        textures[] = {};
    };

	class C_Van_02_medevac_F {
		vItemSpace = 110;
		conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
		price = 800000;
        textures[] = {};
    };

	class C_IDAP_Van_02_medevac_F {
		vItemSpace = 110;
		conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
		price = 750000;
        textures[] = {};
    };

	class C_Van_02_service_F {
		vItemSpace = 120;
		conditions = "license_civ_driver || {!(playerSide isEqualTo civilian)}";
		price = 1750000;
        textures[] = {};
    };
};
