'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "2ea5ae30fa808a757d4b0c6eba51317f",
"assets/AssetManifest.bin.json": "052205c0e9e0d1547bc66982909032da",
"assets/AssetManifest.json": "2fc3894e7db95a24bc456bc7c7bc5cc7",
"assets/assets/backgrounds/black_background.jpg": "d484c6e16e511b5d5de42520ab40157a",
"assets/assets/backgrounds/castle.png": "3d7fd049b01eb9d6b295786e620fd669",
"assets/assets/backgrounds/cliff.png": "a4686241c1d452929c48ef85effb831c",
"assets/assets/backgrounds/desert.png": "9112b1bb5228a1982c947e2cd7d26eff",
"assets/assets/backgrounds/forest.png": "508dbf605a87e593042a269038ed26f0",
"assets/assets/backgrounds/snowy_mountain_forest.png": "0f96f7109ac99e6c0cd0242999bf6430",
"assets/assets/bgms/boss_fight.mp3": "2630ba13223e2dc3543b3d7ef5298b7e",
"assets/assets/bgms/castle.mp3": "d7fe30d63a0dfaf69380d4d52ebb12d9",
"assets/assets/bgms/core_game.mp3": "72333186d3db2d9ffaa89a4096174f34",
"assets/assets/bgms/desert.mp3": "55115113f6c124235c85357564a95a55",
"assets/assets/bgms/forest.mp3": "5b975517a208ceffc10096c4a840db66",
"assets/assets/bgms/snowy_mountain_forest.mp3": "5b975517a208ceffc10096c4a840db66",
"assets/assets/boss_sprites/amomongo_enemy.png": "475ddfe37f44dac9b7967ce3cc5e1089",
"assets/assets/boss_sprites/buwaya_enemy.png": "bb142d8503d305bba3d784e25ec87377",
"assets/assets/boss_sprites/kaperosa_enemy.png": "f58c6d60f73e0fdb2bef46f5fa53e61a",
"assets/assets/boss_sprites/lukas_enemy.png": "de20367efb550dd52c0803504e8d2e89",
"assets/assets/card_icons/boss_action_16.png": "32ac4978e082715a439c1e4f747e6590",
"assets/assets/card_icons/boss_action_32.png": "5b2027df91a1d76c09585bec2f3076bf",
"assets/assets/card_icons/consumable_16.png": "1bda076b48370805a695807d0bbd304f",
"assets/assets/card_icons/consumable_32.png": "9830b9833aa1c3d72ca5b529beea806c",
"assets/assets/card_icons/equipment_16.png": "9ab6b67cb930d43aa4101447fe1a7acc",
"assets/assets/card_icons/equipment_32.png": "165671b3707d3a97f973f8fdc42a5567",
"assets/assets/card_icons/monster_16.png": "6183f850714367e0a3f97d9c59f87acb",
"assets/assets/card_icons/monster_32.png": "2edb58b468a72351bca284700495359e",
"assets/assets/card_icons/player_action_16.png": "32ac4978e082715a439c1e4f747e6590",
"assets/assets/card_icons/player_action_32.png": "5b2027df91a1d76c09585bec2f3076bf",
"assets/assets/card_icons/player_equipment_16.png": "9ab6b67cb930d43aa4101447fe1a7acc",
"assets/assets/card_icons/player_equipment_32.png": "165671b3707d3a97f973f8fdc42a5567",
"assets/assets/card_icons/weapon_16.png": "0064ec92dfd2a22344226207c2959fdb",
"assets/assets/card_icons/weapon_32.png": "40e5c28b858de1738f4dab1ab0437445",
"assets/assets/card_sprites/boss_action/acid_belch.png": "6e3b85fa1a4b308a53b8dea80890dafb",
"assets/assets/card_sprites/boss_action/all_out_attack.png": "f703c54567a5c49d068ba1b15bb40935",
"assets/assets/card_sprites/boss_action/angelic_respite.png": "8d5f8dbb196d04ccdfc1593dd56be42b",
"assets/assets/card_sprites/boss_action/ba0.png": "18fb0565c6fb33a9e309cc058efbb1a2",
"assets/assets/card_sprites/boss_action/ba1.png": "9222b9599d969fc0c1f2777ae1986dd8",
"assets/assets/card_sprites/boss_action/ba10.png": "8d5f8dbb196d04ccdfc1593dd56be42b",
"assets/assets/card_sprites/boss_action/ba11.png": "42f7c981c43eceecbd24e6ce0d4152c8",
"assets/assets/card_sprites/boss_action/ba12.png": "dfb910f46bca6fd456c88cfbee2a1d00",
"assets/assets/card_sprites/boss_action/ba13.png": "4ea44530166e04d58571f0cede088b02",
"assets/assets/card_sprites/boss_action/ba14.png": "c4665ea9cc7fa01a529285b3446b6abe",
"assets/assets/card_sprites/boss_action/ba15.png": "a9edf1327704f837e534097d5d71543a",
"assets/assets/card_sprites/boss_action/ba16.png": "cf9b9eb44a51cb1fc37ab598bed9cc6f",
"assets/assets/card_sprites/boss_action/ba17.png": "d0cf2337d857f566ce1fbe531bd82c30",
"assets/assets/card_sprites/boss_action/ba18.png": "9af3235f07e20a3b4986bbbef462e5fb",
"assets/assets/card_sprites/boss_action/ba19.png": "aab338faa5bf51d3632daba82cf9ba9f",
"assets/assets/card_sprites/boss_action/ba2.png": "157cf1cc3b05980880b8182507ed0609",
"assets/assets/card_sprites/boss_action/ba20.png": "5161ad3b5bf0c8398fae0e2739404020",
"assets/assets/card_sprites/boss_action/ba21.png": "6e3b85fa1a4b308a53b8dea80890dafb",
"assets/assets/card_sprites/boss_action/ba22.png": "e35f74b2a35ada322de1a5ee0df2e4e1",
"assets/assets/card_sprites/boss_action/ba23.png": "c4ddfd8d2d83defb7e9cdfaedba9e543",
"assets/assets/card_sprites/boss_action/ba24.png": "c2b5bc65e96a4e7e8c071d48e825fff9",
"assets/assets/card_sprites/boss_action/ba25.png": "26fac8aadd1ae8fe6f88c1a392932606",
"assets/assets/card_sprites/boss_action/ba26.png": "d0a7ad92c23cb02b09350038e63fd965",
"assets/assets/card_sprites/boss_action/ba27.png": "f61b297330e52f71133a93f012deffbe",
"assets/assets/card_sprites/boss_action/ba3.png": "078d61ffd01d75fec70aac92d5001fbc",
"assets/assets/card_sprites/boss_action/ba4.png": "92bb18d7a8716c11638e88604abce771",
"assets/assets/card_sprites/boss_action/ba5.png": "f8f8b0e073bae6da2d4a5cb9d3ef9620",
"assets/assets/card_sprites/boss_action/ba6.png": "ed9a1ce1a351aff2d667652cfdb7f437",
"assets/assets/card_sprites/boss_action/ba7.png": "976603d1c8b49d83246f022dce0d047f",
"assets/assets/card_sprites/boss_action/ba8.png": "aec4401dbef9a78dbd8027b7b7abab93",
"assets/assets/card_sprites/boss_action/ba9.png": "6f538dc90fadf0f6961ad370d8496c1e",
"assets/assets/card_sprites/boss_action/battle_axe.png": "83942c9c3cafb5b4d27dda471da0d1ff",
"assets/assets/card_sprites/boss_action/battle_hammer.png": "d958ef89d461179d6ba933f136a2de03",
"assets/assets/card_sprites/boss_action/body_possession.png": "4ea44530166e04d58571f0cede088b02",
"assets/assets/card_sprites/boss_action/cursed_bells.png": "9222b9599d969fc0c1f2777ae1986dd8",
"assets/assets/card_sprites/boss_action/cyclone.png": "efd5e32501ec16abf0fedf78f7010df2",
"assets/assets/card_sprites/boss_action/divine_smite.png": "3d2fe8038b6f7b8190aca27edb582fb1",
"assets/assets/card_sprites/boss_action/ectoplasm_slam.png": "92bb18d7a8716c11638e88604abce771",
"assets/assets/card_sprites/boss_action/enhance_weapon.png": "5161ad3b5bf0c8398fae0e2739404020",
"assets/assets/card_sprites/boss_action/finishing_blow.png": "8e9663efa0b3e83c8c7411d5c72f5831",
"assets/assets/card_sprites/boss_action/freezing_breath.png": "c2b5bc65e96a4e7e8c071d48e825fff9",
"assets/assets/card_sprites/boss_action/greatsword_2.png": "f703c54567a5c49d068ba1b15bb40935",
"assets/assets/card_sprites/boss_action/haunting_dreams.png": "dfb910f46bca6fd456c88cfbee2a1d00",
"assets/assets/card_sprites/boss_action/intimidation_tactic.png": "d0a7ad92c23cb02b09350038e63fd965",
"assets/assets/card_sprites/boss_action/katana_2.png": "b300f763274393991a698fb1c55bfa01",
"assets/assets/card_sprites/boss_action/life_drain.png": "157cf1cc3b05980880b8182507ed0609",
"assets/assets/card_sprites/boss_action/mass_healing_ward.png": "6f538dc90fadf0f6961ad370d8496c1e",
"assets/assets/card_sprites/boss_action/melting_chomp.png": "c4ddfd8d2d83defb7e9cdfaedba9e543",
"assets/assets/card_sprites/boss_action/metal_scale.png": "c4665ea9cc7fa01a529285b3446b6abe",
"assets/assets/card_sprites/boss_action/misty_footwork.png": "42f7c981c43eceecbd24e6ce0d4152c8",
"assets/assets/card_sprites/boss_action/necrotic_rebirth.png": "f8f8b0e073bae6da2d4a5cb9d3ef9620",
"assets/assets/card_sprites/boss_action/phantom_attack.png": "18fb0565c6fb33a9e309cc058efbb1a2",
"assets/assets/card_sprites/boss_action/photosynthesis.png": "aab338faa5bf51d3632daba82cf9ba9f",
"assets/assets/card_sprites/boss_action/poisonous_miasma.png": "ed9a1ce1a351aff2d667652cfdb7f437",
"assets/assets/card_sprites/boss_action/quick_attack.png": "ed7834e371e8956ae3d90da3c367e9af",
"assets/assets/card_sprites/boss_action/rally.png": "d0cf2337d857f566ce1fbe531bd82c30",
"assets/assets/card_sprites/boss_action/rapier_2.png": "ed7834e371e8956ae3d90da3c367e9af",
"assets/assets/card_sprites/boss_action/reckless_attack.png": "078d61ffd01d75fec70aac92d5001fbc",
"assets/assets/card_sprites/boss_action/relentless_bites.png": "976603d1c8b49d83246f022dce0d047f",
"assets/assets/card_sprites/boss_action/riposte.png": "b300f763274393991a698fb1c55bfa01",
"assets/assets/card_sprites/boss_action/scythe.png": "8bfb6cde77050b672d7ebe3d73cd3073",
"assets/assets/card_sprites/boss_action/second_wind.png": "e35f74b2a35ada322de1a5ee0df2e4e1",
"assets/assets/card_sprites/boss_action/sickle.png": "efd5e32501ec16abf0fedf78f7010df2",
"assets/assets/card_sprites/boss_action/slam.png": "cf9b9eb44a51cb1fc37ab598bed9cc6f",
"assets/assets/card_sprites/boss_action/soul_eater.png": "8bfb6cde77050b672d7ebe3d73cd3073",
"assets/assets/card_sprites/boss_action/tail_swipe.png": "a9edf1327704f837e534097d5d71543a",
"assets/assets/card_sprites/boss_action/toxic_breath.png": "aec4401dbef9a78dbd8027b7b7abab93",
"assets/assets/card_sprites/boss_action/trident.png": "3d2fe8038b6f7b8190aca27edb582fb1",
"assets/assets/card_sprites/consumable/arcana_elixir.png": "fe7a89063647282a97df90478cab7fc3",
"assets/assets/card_sprites/consumable/ash_draught.png": "5a7e8d4e5c0f31d15cd99bc33f5d4a34",
"assets/assets/card_sprites/consumable/azure_elixir.png": "315e182954e931693f45faf6f5217da9",
"assets/assets/card_sprites/consumable/c0.png": "5a7e8d4e5c0f31d15cd99bc33f5d4a34",
"assets/assets/card_sprites/consumable/c1.png": "bb08682a30c50a7bf86112e390d0bb32",
"assets/assets/card_sprites/consumable/c10.png": "484a2a537dc4a9e271ca769b95fbb015",
"assets/assets/card_sprites/consumable/c11.png": "315e182954e931693f45faf6f5217da9",
"assets/assets/card_sprites/consumable/c12.png": "701430226b4c3e11ca070510613fe8f1",
"assets/assets/card_sprites/consumable/c13.png": "3e7fb899bae2006d732ac2d3b1f7d090",
"assets/assets/card_sprites/consumable/c14.png": "fe7a89063647282a97df90478cab7fc3",
"assets/assets/card_sprites/consumable/c15.png": "444bf27814dbba7b2c1076eb260290b7",
"assets/assets/card_sprites/consumable/c16.png": "f0c3af64d454186670ce0f57e3a1b243",
"assets/assets/card_sprites/consumable/c17.png": "76eacbeb3a2cb387ea169cdbeef63e42",
"assets/assets/card_sprites/consumable/c18.png": "dea278dcb32ec96d35aa0b13917632a5",
"assets/assets/card_sprites/consumable/c19.png": "34a6563f54d9656c509d0f4189341819",
"assets/assets/card_sprites/consumable/c2.png": "09d04e93a14612f98ae9eb5bd302b36a",
"assets/assets/card_sprites/consumable/c20.png": "99f4dc2910de65236cdcce9dddb3a9d2",
"assets/assets/card_sprites/consumable/c3.png": "4e49989c2000c38781f4ef04ad3a32c5",
"assets/assets/card_sprites/consumable/c4.png": "effcbc3075325f2b99022c595caa63e7",
"assets/assets/card_sprites/consumable/c5.png": "06347d73c8e087883802ad164b017019",
"assets/assets/card_sprites/consumable/c6.png": "b37f106f5d8398b61bb848ea60ff7480",
"assets/assets/card_sprites/consumable/c7.png": "85016b5b98e1eaf22543980f204192e9",
"assets/assets/card_sprites/consumable/c8.png": "67114202146bb733137cb4e3a64fba46",
"assets/assets/card_sprites/consumable/c9.png": "6a309ddf92f3f5ba166800a52bfaa86a",
"assets/assets/card_sprites/consumable/crimson_serum.png": "76eacbeb3a2cb387ea169cdbeef63e42",
"assets/assets/card_sprites/consumable/enigma_tonic.png": "f0c3af64d454186670ce0f57e3a1b243",
"assets/assets/card_sprites/consumable/ether_grey_tonic.png": "09d04e93a14612f98ae9eb5bd302b36a",
"assets/assets/card_sprites/consumable/fire_vein_tonic.png": "dea278dcb32ec96d35aa0b13917632a5",
"assets/assets/card_sprites/consumable/gilded_elixir.png": "b37f106f5d8398b61bb848ea60ff7480",
"assets/assets/card_sprites/consumable/golden_tonic.png": "effcbc3075325f2b99022c595caa63e7",
"assets/assets/card_sprites/consumable/grey_matter_potion.png": "bb08682a30c50a7bf86112e390d0bb32",
"assets/assets/card_sprites/consumable/indigo_serum.png": "484a2a537dc4a9e271ca769b95fbb015",
"assets/assets/card_sprites/consumable/ivory_draught.png": "99f4dc2910de65236cdcce9dddb3a9d2",
"assets/assets/card_sprites/consumable/lavender_essence.png": "444bf27814dbba7b2c1076eb260290b7",
"assets/assets/card_sprites/consumable/ocean_mist.png": "701430226b4c3e11ca070510613fe8f1",
"assets/assets/card_sprites/consumable/purge_brew.png": "6a309ddf92f3f5ba166800a52bfaa86a",
"assets/assets/card_sprites/consumable/sol_essence.png": "06347d73c8e087883802ad164b017019",
"assets/assets/card_sprites/consumable/stone_hide_elixir.png": "34a6563f54d9656c509d0f4189341819",
"assets/assets/card_sprites/consumable/venom_brew.png": "3e7fb899bae2006d732ac2d3b1f7d090",
"assets/assets/card_sprites/consumable/verdant_elixir.png": "85016b5b98e1eaf22543980f204192e9",
"assets/assets/card_sprites/consumable/vine_brew.png": "67114202146bb733137cb4e3a64fba46",
"assets/assets/card_sprites/consumable/vitalis_potion.png": "4e49989c2000c38781f4ef04ad3a32c5",
"assets/assets/card_sprites/equipment/armor_of_achilles.png": "e9e30c17e8b92e4b887ea56129a7a00b",
"assets/assets/card_sprites/equipment/celestial_aegis.png": "242373428cbd6b0ce7e7681fdf61be74",
"assets/assets/card_sprites/equipment/e0.png": "ce4ea803daf9dbb4f3ff8e72f7a3f445",
"assets/assets/card_sprites/equipment/e1.png": "09adc12884383191c96aee82c6f54d5d",
"assets/assets/card_sprites/equipment/e10.png": "69ec566c0c7e96e86cc9486a06e68c28",
"assets/assets/card_sprites/equipment/e11.png": "fff9196a0f38dba6803208bd773409c5",
"assets/assets/card_sprites/equipment/e12.png": "01413aaec3de17a3c55f0caac4c17a37",
"assets/assets/card_sprites/equipment/e13.png": "5af6f5a0eb3cf1f316c7194b461e5db6",
"assets/assets/card_sprites/equipment/e14.png": "e82030df1298540f3899daa673839860",
"assets/assets/card_sprites/equipment/e15.png": "2121ab0949d4c01f2c6c930fcba37ca8",
"assets/assets/card_sprites/equipment/e16.png": "118b45eb9813210e2ea70f2a958669a1",
"assets/assets/card_sprites/equipment/e17.png": "4842d3db64d145ce71a07fdf26bc6050",
"assets/assets/card_sprites/equipment/e18.png": "d24279c09d122115b96aed40322bd2d8",
"assets/assets/card_sprites/equipment/e19.png": "3b3f0510ef85036c1497417450fa5600",
"assets/assets/card_sprites/equipment/e2.png": "c645afacbec6243d47cbe119193ed5cd",
"assets/assets/card_sprites/equipment/e20.png": "712a67a59c1378010fda0353b4739590",
"assets/assets/card_sprites/equipment/e3.png": "9b05503d6822e1859d5fa4e464f4568a",
"assets/assets/card_sprites/equipment/e4.png": "e9e30c17e8b92e4b887ea56129a7a00b",
"assets/assets/card_sprites/equipment/e5.png": "242373428cbd6b0ce7e7681fdf61be74",
"assets/assets/card_sprites/equipment/e6.png": "0d2df659488a9fa51730775ee25882cb",
"assets/assets/card_sprites/equipment/e7.png": "3495390fc995d8fdc3281406cb6ed43e",
"assets/assets/card_sprites/equipment/e8.png": "2efc4d476a0843d5ea0cffd712f62626",
"assets/assets/card_sprites/equipment/e9.png": "3a71af45edddace4b1240321f63e456e",
"assets/assets/card_sprites/equipment/eastern_guardian_plate.png": "3b3f0510ef85036c1497417450fa5600",
"assets/assets/card_sprites/equipment/forest_warden_armor.png": "d24279c09d122115b96aed40322bd2d8",
"assets/assets/card_sprites/equipment/gambelash.png": "3a71af45edddace4b1240321f63e456e",
"assets/assets/card_sprites/equipment/gambeson.png": "2efc4d476a0843d5ea0cffd712f62626",
"assets/assets/card_sprites/equipment/hussite_plate.png": "69ec566c0c7e96e86cc9486a06e68c28",
"assets/assets/card_sprites/equipment/jack_of_plate.png": "c645afacbec6243d47cbe119193ed5cd",
"assets/assets/card_sprites/equipment/kalkan_breastplate.png": "9b05503d6822e1859d5fa4e464f4568a",
"assets/assets/card_sprites/equipment/lamellar_armor.png": "2121ab0949d4c01f2c6c930fcba37ca8",
"assets/assets/card_sprites/equipment/lorica_segmentata.png": "01413aaec3de17a3c55f0caac4c17a37",
"assets/assets/card_sprites/equipment/maximilian_plate.png": "09adc12884383191c96aee82c6f54d5d",
"assets/assets/card_sprites/equipment/o_yoroi.png": "118b45eb9813210e2ea70f2a958669a1",
"assets/assets/card_sprites/equipment/pectoral_armor.png": "e82030df1298540f3899daa673839860",
"assets/assets/card_sprites/equipment/power_breastplate.png": "ce4ea803daf9dbb4f3ff8e72f7a3f445",
"assets/assets/card_sprites/equipment/ruby_wyrmbark_breastplate.png": "712a67a59c1378010fda0353b4739590",
"assets/assets/card_sprites/equipment/spirit_forged_mail.png": "fff9196a0f38dba6803208bd773409c5",
"assets/assets/card_sprites/equipment/storm_breaker_cuirass.png": "5af6f5a0eb3cf1f316c7194b461e5db6",
"assets/assets/card_sprites/equipment/storm_plate_of_tempest.png": "3495390fc995d8fdc3281406cb6ed43e",
"assets/assets/card_sprites/equipment/sun_blessed_aegis.png": "0d2df659488a9fa51730775ee25882cb",
"assets/assets/card_sprites/equipment/verdant_breastplate.png": "4842d3db64d145ce71a07fdf26bc6050",
"assets/assets/card_sprites/monster/aghoy.png": "c94f86cd599ae51fee53c5f15153465b",
"assets/assets/card_sprites/monster/amaranhig.png": "9f6089c96785829767c260fe8eda8889",
"assets/assets/card_sprites/monster/amomongo.png": "faf8cf76960c9e85f53dc9292656ab01",
"assets/assets/card_sprites/monster/boar.png": "f7f08bc5a7cc3d452aa78e92f87a5957",
"assets/assets/card_sprites/monster/boar_2.png": "d11d4e14bf204012b11daa9638d4f320",
"assets/assets/card_sprites/monster/bungisngis.png": "784776b949f922fe78161ac049021776",
"assets/assets/card_sprites/monster/busaw.png": "4f55e616d8cd45f447b9c41a89b722ac",
"assets/assets/card_sprites/monster/buwaya.png": "69b1c4f2782c3f5b8d6d873c64f0045c",
"assets/assets/card_sprites/monster/chicken.png": "fe7313f754c222c6dd739609fda3537c",
"assets/assets/card_sprites/monster/dwende_blue.png": "341bbd92804c204f70618d42235dca19",
"assets/assets/card_sprites/monster/dwende_orange.png": "0d91bdd0d1a603740783f8d86d24a3dc",
"assets/assets/card_sprites/monster/dwende_red.png": "b4eb7deaa09f296a5e6dfc2fea8bffb1",
"assets/assets/card_sprites/monster/dwende_yellow.png": "28f006fe4e9ff71579ac8e7344eb1c1c",
"assets/assets/card_sprites/monster/ek_ek.png": "bbb11166cdf7e9f403c39b2d0ec102f3",
"assets/assets/card_sprites/monster/evil_dwende.png": "87ca675ff4baf9cb278851ffba90562f",
"assets/assets/card_sprites/monster/kapre.png": "bf90514a9b01f48834919b76eab787c6",
"assets/assets/card_sprites/monster/kolyog.png": "65f70f56293a475304ec4d556afaba23",
"assets/assets/card_sprites/monster/malakat.png": "cd08a506d233db67a925c2661042e38a",
"assets/assets/card_sprites/monster/manananggal.png": "24f656f78cd7807b8c0bed872b7454b6",
"assets/assets/card_sprites/monster/nuno_sa_punso.png": "d100a7f3f9ca29ae576ec7006b28ad50",
"assets/assets/card_sprites/monster/rooster.png": "7db7f2ffbf67ea860d1c095f8064e14b",
"assets/assets/card_sprites/monster/santelmo.png": "2aa9b53f8846204fa41bd34de7029a27",
"assets/assets/card_sprites/monster/sigbin.png": "f7142299358fb57ba737e321bb30bb95",
"assets/assets/card_sprites/monster/sirena.png": "eacebd490d6618d419184ba9bab9bfc4",
"assets/assets/card_sprites/monster/syokoy.png": "61d7fe4b7a93aeeb82ab59ac36e2ba37",
"assets/assets/card_sprites/monster/taong_tuod.png": "62b3bbbe18a40a175b9cf3f08d898621",
"assets/assets/card_sprites/monster/tiburones.png": "217cc243a3a7507d429a47742e5c3473",
"assets/assets/card_sprites/monster/tikbalang.png": "d183c9dfa2bc6a35ec39c3be678ee334",
"assets/assets/card_sprites/monster/tiyanak.png": "3e83536158666347ba1b1bafdce8079f",
"assets/assets/card_sprites/monster/witch.png": "73bc22228228b3ee34092fb8e9ff9e0e",
"assets/assets/card_sprites/player_action/all_out_attack.png": "f703c54567a5c49d068ba1b15bb40935",
"assets/assets/card_sprites/player_action/angelic_respite.png": "f8f8b0e073bae6da2d4a5cb9d3ef9620",
"assets/assets/card_sprites/player_action/ba0.png": "18fb0565c6fb33a9e309cc058efbb1a2",
"assets/assets/card_sprites/player_action/ba1.png": "9222b9599d969fc0c1f2777ae1986dd8",
"assets/assets/card_sprites/player_action/ba10.png": "8d5f8dbb196d04ccdfc1593dd56be42b",
"assets/assets/card_sprites/player_action/ba11.png": "42f7c981c43eceecbd24e6ce0d4152c8",
"assets/assets/card_sprites/player_action/ba12.png": "dfb910f46bca6fd456c88cfbee2a1d00",
"assets/assets/card_sprites/player_action/ba13.png": "4ea44530166e04d58571f0cede088b02",
"assets/assets/card_sprites/player_action/ba14.png": "c4665ea9cc7fa01a529285b3446b6abe",
"assets/assets/card_sprites/player_action/ba15.png": "a9edf1327704f837e534097d5d71543a",
"assets/assets/card_sprites/player_action/ba16.png": "cf9b9eb44a51cb1fc37ab598bed9cc6f",
"assets/assets/card_sprites/player_action/ba17.png": "d0cf2337d857f566ce1fbe531bd82c30",
"assets/assets/card_sprites/player_action/ba18.png": "9af3235f07e20a3b4986bbbef462e5fb",
"assets/assets/card_sprites/player_action/ba19.png": "aab338faa5bf51d3632daba82cf9ba9f",
"assets/assets/card_sprites/player_action/ba2.png": "157cf1cc3b05980880b8182507ed0609",
"assets/assets/card_sprites/player_action/ba20.png": "5161ad3b5bf0c8398fae0e2739404020",
"assets/assets/card_sprites/player_action/ba21.png": "6e3b85fa1a4b308a53b8dea80890dafb",
"assets/assets/card_sprites/player_action/ba22.png": "e35f74b2a35ada322de1a5ee0df2e4e1",
"assets/assets/card_sprites/player_action/ba23.png": "c4ddfd8d2d83defb7e9cdfaedba9e543",
"assets/assets/card_sprites/player_action/ba24.png": "c2b5bc65e96a4e7e8c071d48e825fff9",
"assets/assets/card_sprites/player_action/ba25.png": "26fac8aadd1ae8fe6f88c1a392932606",
"assets/assets/card_sprites/player_action/ba26.png": "d0a7ad92c23cb02b09350038e63fd965",
"assets/assets/card_sprites/player_action/ba27.png": "f61b297330e52f71133a93f012deffbe",
"assets/assets/card_sprites/player_action/ba3.png": "078d61ffd01d75fec70aac92d5001fbc",
"assets/assets/card_sprites/player_action/ba4.png": "92bb18d7a8716c11638e88604abce771",
"assets/assets/card_sprites/player_action/ba5.png": "f8f8b0e073bae6da2d4a5cb9d3ef9620",
"assets/assets/card_sprites/player_action/ba6.png": "ed9a1ce1a351aff2d667652cfdb7f437",
"assets/assets/card_sprites/player_action/ba7.png": "976603d1c8b49d83246f022dce0d047f",
"assets/assets/card_sprites/player_action/ba8.png": "aec4401dbef9a78dbd8027b7b7abab93",
"assets/assets/card_sprites/player_action/ba9.png": "6f538dc90fadf0f6961ad370d8496c1e",
"assets/assets/card_sprites/player_action/battle_axe.png": "83942c9c3cafb5b4d27dda471da0d1ff",
"assets/assets/card_sprites/player_action/battle_hammer.png": "d958ef89d461179d6ba933f136a2de03",
"assets/assets/card_sprites/player_action/blood_blade.png": "b300f763274393991a698fb1c55bfa01",
"assets/assets/card_sprites/player_action/bone_chill.png": "e35f74b2a35ada322de1a5ee0df2e4e1",
"assets/assets/card_sprites/player_action/butcher_knife.png": "d2d443c8d21814f0d42427e8324e31a5",
"assets/assets/card_sprites/player_action/c3.png": "4e49989c2000c38781f4ef04ad3a32c5",
"assets/assets/card_sprites/player_action/c5.png": "06347d73c8e087883802ad164b017019",
"assets/assets/card_sprites/player_action/cyclone.png": "efd5e32501ec16abf0fedf78f7010df2",
"assets/assets/card_sprites/player_action/dark_determination.png": "9222b9599d969fc0c1f2777ae1986dd8",
"assets/assets/card_sprites/player_action/divine_interference.png": "ed9a1ce1a351aff2d667652cfdb7f437",
"assets/assets/card_sprites/player_action/divine_smite.png": "3d2fe8038b6f7b8190aca27edb582fb1",
"assets/assets/card_sprites/player_action/eldritch_contract.png": "078d61ffd01d75fec70aac92d5001fbc",
"assets/assets/card_sprites/player_action/enhance_weapon.png": "5161ad3b5bf0c8398fae0e2739404020",
"assets/assets/card_sprites/player_action/everbloom.png": "976603d1c8b49d83246f022dce0d047f",
"assets/assets/card_sprites/player_action/fancy_footwork.png": "ed7834e371e8956ae3d90da3c367e9af",
"assets/assets/card_sprites/player_action/finishing_blow.png": "8e9663efa0b3e83c8c7411d5c72f5831",
"assets/assets/card_sprites/player_action/follow_up.png": "39398b93b56d6306f24ea99e36966958",
"assets/assets/card_sprites/player_action/greatsword.png": "8e9663efa0b3e83c8c7411d5c72f5831",
"assets/assets/card_sprites/player_action/greatsword_2.png": "f703c54567a5c49d068ba1b15bb40935",
"assets/assets/card_sprites/player_action/haste.png": "26fac8aadd1ae8fe6f88c1a392932606",
"assets/assets/card_sprites/player_action/healing_potion.png": "4e49989c2000c38781f4ef04ad3a32c5",
"assets/assets/card_sprites/player_action/holy_prayers.png": "aec4401dbef9a78dbd8027b7b7abab93",
"assets/assets/card_sprites/player_action/ironskin_potion.png": "06347d73c8e087883802ad164b017019",
"assets/assets/card_sprites/player_action/katana.png": "d9657f566302f918c6cb4b9a9d9de933",
"assets/assets/card_sprites/player_action/katana_2.png": "b300f763274393991a698fb1c55bfa01",
"assets/assets/card_sprites/player_action/knife.png": "1e219b4a5c9ffb31c014a59e096724cb",
"assets/assets/card_sprites/player_action/knightly_rending.png": "7e0cee8628cac29f1d3ee7d07b320fe4",
"assets/assets/card_sprites/player_action/mace.png": "f07902ce40809514b5928083541c8fe0",
"assets/assets/card_sprites/player_action/mass_healing_ward.png": "6f538dc90fadf0f6961ad370d8496c1e",
"assets/assets/card_sprites/player_action/metallica.png": "18fb0565c6fb33a9e309cc058efbb1a2",
"assets/assets/card_sprites/player_action/misty_dodge.png": "c2b5bc65e96a4e7e8c071d48e825fff9",
"assets/assets/card_sprites/player_action/nunchucks.png": "13fddf119651118456d939b855df1ebc",
"assets/assets/card_sprites/player_action/pocket_sand.png": "1e219b4a5c9ffb31c014a59e096724cb",
"assets/assets/card_sprites/player_action/rapier.png": "e8b28a4759843e7d67dd52e36356f679",
"assets/assets/card_sprites/player_action/rapier_2.png": "ed7834e371e8956ae3d90da3c367e9af",
"assets/assets/card_sprites/player_action/scimitar.png": "b93936a2498caded5cb7dd65332f6c71",
"assets/assets/card_sprites/player_action/scimitar_2.png": "39398b93b56d6306f24ea99e36966958",
"assets/assets/card_sprites/player_action/scythe.png": "8bfb6cde77050b672d7ebe3d73cd3073",
"assets/assets/card_sprites/player_action/sickle.png": "efd5e32501ec16abf0fedf78f7010df2",
"assets/assets/card_sprites/player_action/singularity.png": "42f7c981c43eceecbd24e6ce0d4152c8",
"assets/assets/card_sprites/player_action/soul_eater.png": "8bfb6cde77050b672d7ebe3d73cd3073",
"assets/assets/card_sprites/player_action/spear.png": "9153b19d780f7e249a744d61bd5c5504",
"assets/assets/card_sprites/player_action/staff.png": "15896bcb34d34e37b72462fcf677887b",
"assets/assets/card_sprites/player_action/sword.png": "7e0cee8628cac29f1d3ee7d07b320fe4",
"assets/assets/card_sprites/player_action/sword_2.png": "80a526ac15347d1924ce142718c17060",
"assets/assets/card_sprites/player_action/trident.png": "3d2fe8038b6f7b8190aca27edb582fb1",
"assets/assets/card_sprites/player_action/weaken.png": "a9edf1327704f837e534097d5d71543a",
"assets/assets/card_sprites/player_equipment/amethyst_gauntlet.png": "e9e30c17e8b92e4b887ea56129a7a00b",
"assets/assets/card_sprites/player_equipment/conquerers_armor.png": "118b45eb9813210e2ea70f2a958669a1",
"assets/assets/card_sprites/player_equipment/cursed_shield.png": "9b05503d6822e1859d5fa4e464f4568a",
"assets/assets/card_sprites/player_equipment/desert_armor.png": "0d2df659488a9fa51730775ee25882cb",
"assets/assets/card_sprites/player_equipment/emerald_gauntlet.png": "09adc12884383191c96aee82c6f54d5d",
"assets/assets/card_sprites/player_equipment/icarus_wings.png": "e82030df1298540f3899daa673839860",
"assets/assets/card_sprites/player_equipment/knights_breastplate.png": "c645afacbec6243d47cbe119193ed5cd",
"assets/assets/card_sprites/player_equipment/light_armor.png": "3b3f0510ef85036c1497417450fa5600",
"assets/assets/card_sprites/player_equipment/maddening_shelter.png": "242373428cbd6b0ce7e7681fdf61be74",
"assets/assets/card_sprites/player_equipment/midas_touch.png": "2121ab0949d4c01f2c6c930fcba37ca8",
"assets/assets/card_sprites/player_equipment/monkeys_gloves.png": "5af6f5a0eb3cf1f316c7194b461e5db6",
"assets/assets/card_sprites/player_equipment/pandoras_box.png": "712a67a59c1378010fda0353b4739590",
"assets/assets/card_sprites/player_equipment/pe0.png": "ce4ea803daf9dbb4f3ff8e72f7a3f445",
"assets/assets/card_sprites/player_equipment/pe1.png": "09adc12884383191c96aee82c6f54d5d",
"assets/assets/card_sprites/player_equipment/pe10.png": "69ec566c0c7e96e86cc9486a06e68c28",
"assets/assets/card_sprites/player_equipment/pe11.png": "fff9196a0f38dba6803208bd773409c5",
"assets/assets/card_sprites/player_equipment/pe12.png": "01413aaec3de17a3c55f0caac4c17a37",
"assets/assets/card_sprites/player_equipment/pe13.png": "5af6f5a0eb3cf1f316c7194b461e5db6",
"assets/assets/card_sprites/player_equipment/pe14.png": "e82030df1298540f3899daa673839860",
"assets/assets/card_sprites/player_equipment/pe15.png": "2121ab0949d4c01f2c6c930fcba37ca8",
"assets/assets/card_sprites/player_equipment/pe16.png": "118b45eb9813210e2ea70f2a958669a1",
"assets/assets/card_sprites/player_equipment/pe17.png": "4842d3db64d145ce71a07fdf26bc6050",
"assets/assets/card_sprites/player_equipment/pe18.png": "d24279c09d122115b96aed40322bd2d8",
"assets/assets/card_sprites/player_equipment/pe19.png": "3b3f0510ef85036c1497417450fa5600",
"assets/assets/card_sprites/player_equipment/pe2.png": "c645afacbec6243d47cbe119193ed5cd",
"assets/assets/card_sprites/player_equipment/pe20.png": "712a67a59c1378010fda0353b4739590",
"assets/assets/card_sprites/player_equipment/pe3.png": "9b05503d6822e1859d5fa4e464f4568a",
"assets/assets/card_sprites/player_equipment/pe4.png": "e9e30c17e8b92e4b887ea56129a7a00b",
"assets/assets/card_sprites/player_equipment/pe5.png": "242373428cbd6b0ce7e7681fdf61be74",
"assets/assets/card_sprites/player_equipment/pe6.png": "0d2df659488a9fa51730775ee25882cb",
"assets/assets/card_sprites/player_equipment/pe7.png": "3495390fc995d8fdc3281406cb6ed43e",
"assets/assets/card_sprites/player_equipment/pe8.png": "2efc4d476a0843d5ea0cffd712f62626",
"assets/assets/card_sprites/player_equipment/pe9.png": "3a71af45edddace4b1240321f63e456e",
"assets/assets/card_sprites/player_equipment/superior_armor.png": "3495390fc995d8fdc3281406cb6ed43e",
"assets/assets/card_sprites/player_equipment/swordsman_armor.png": "3a71af45edddace4b1240321f63e456e",
"assets/assets/card_sprites/player_equipment/timeless_piece.png": "69ec566c0c7e96e86cc9486a06e68c28",
"assets/assets/card_sprites/player_equipment/unholy_aura.png": "d24279c09d122115b96aed40322bd2d8",
"assets/assets/card_sprites/player_equipment/vampiric_strength.png": "4842d3db64d145ce71a07fdf26bc6050",
"assets/assets/card_sprites/player_equipment/vulnerability_exposer.png": "2efc4d476a0843d5ea0cffd712f62626",
"assets/assets/card_sprites/weapon/battle_axe.png": "83942c9c3cafb5b4d27dda471da0d1ff",
"assets/assets/card_sprites/weapon/battle_hammer.png": "d958ef89d461179d6ba933f136a2de03",
"assets/assets/card_sprites/weapon/bladed_nunchaku.png": "13fddf119651118456d939b855df1ebc",
"assets/assets/card_sprites/weapon/butcher_knife.png": "d2d443c8d21814f0d42427e8324e31a5",
"assets/assets/card_sprites/weapon/death_crescent.png": "8bfb6cde77050b672d7ebe3d73cd3073",
"assets/assets/card_sprites/weapon/doom_spire.png": "80a526ac15347d1924ce142718c17060",
"assets/assets/card_sprites/weapon/espada_larga.png": "ed7834e371e8956ae3d90da3c367e9af",
"assets/assets/card_sprites/weapon/eternal_cleaver.png": "f703c54567a5c49d068ba1b15bb40935",
"assets/assets/card_sprites/weapon/excalibur.png": "e8b28a4759843e7d67dd52e36356f679",
"assets/assets/card_sprites/weapon/fang_of_riton.png": "9153b19d780f7e249a744d61bd5c5504",
"assets/assets/card_sprites/weapon/gladius.png": "7e0cee8628cac29f1d3ee7d07b320fe4",
"assets/assets/card_sprites/weapon/greatsword.png": "8e9663efa0b3e83c8c7411d5c72f5831",
"assets/assets/card_sprites/weapon/greatsword_2.png": "f703c54567a5c49d068ba1b15bb40935",
"assets/assets/card_sprites/weapon/katana.png": "d9657f566302f918c6cb4b9a9d9de933",
"assets/assets/card_sprites/weapon/katana_2.png": "b300f763274393991a698fb1c55bfa01",
"assets/assets/card_sprites/weapon/khopesh.png": "efd5e32501ec16abf0fedf78f7010df2",
"assets/assets/card_sprites/weapon/knife.png": "1e219b4a5c9ffb31c014a59e096724cb",
"assets/assets/card_sprites/weapon/kokuryu.png": "b300f763274393991a698fb1c55bfa01",
"assets/assets/card_sprites/weapon/kris.png": "39398b93b56d6306f24ea99e36966958",
"assets/assets/card_sprites/weapon/mace.png": "f07902ce40809514b5928083541c8fe0",
"assets/assets/card_sprites/weapon/morning_star.png": "f07902ce40809514b5928083541c8fe0",
"assets/assets/card_sprites/weapon/nunchucks.png": "13fddf119651118456d939b855df1ebc",
"assets/assets/card_sprites/weapon/poseidon_fang.png": "3d2fe8038b6f7b8190aca27edb582fb1",
"assets/assets/card_sprites/weapon/rapier.png": "e8b28a4759843e7d67dd52e36356f679",
"assets/assets/card_sprites/weapon/rapier_2.png": "ed7834e371e8956ae3d90da3c367e9af",
"assets/assets/card_sprites/weapon/scimitar.png": "b93936a2498caded5cb7dd65332f6c71",
"assets/assets/card_sprites/weapon/scimitar_2.png": "39398b93b56d6306f24ea99e36966958",
"assets/assets/card_sprites/weapon/scythe.png": "8bfb6cde77050b672d7ebe3d73cd3073",
"assets/assets/card_sprites/weapon/shadow_fang.png": "d2d443c8d21814f0d42427e8324e31a5",
"assets/assets/card_sprites/weapon/shamshir.png": "b93936a2498caded5cb7dd65332f6c71",
"assets/assets/card_sprites/weapon/shepherd_staff.png": "15896bcb34d34e37b72462fcf677887b",
"assets/assets/card_sprites/weapon/sickle.png": "efd5e32501ec16abf0fedf78f7010df2",
"assets/assets/card_sprites/weapon/skull_splitter.png": "8e9663efa0b3e83c8c7411d5c72f5831",
"assets/assets/card_sprites/weapon/spear.png": "9153b19d780f7e249a744d61bd5c5504",
"assets/assets/card_sprites/weapon/staff.png": "15896bcb34d34e37b72462fcf677887b",
"assets/assets/card_sprites/weapon/star_forged_hammer.png": "d958ef89d461179d6ba933f136a2de03",
"assets/assets/card_sprites/weapon/stiletto.png": "1e219b4a5c9ffb31c014a59e096724cb",
"assets/assets/card_sprites/weapon/storm_splitter.png": "83942c9c3cafb5b4d27dda471da0d1ff",
"assets/assets/card_sprites/weapon/sword.png": "7e0cee8628cac29f1d3ee7d07b320fe4",
"assets/assets/card_sprites/weapon/sword_2.png": "80a526ac15347d1924ce142718c17060",
"assets/assets/card_sprites/weapon/trident.png": "3d2fe8038b6f7b8190aca27edb582fb1",
"assets/assets/card_sprites/weapon/yamatsumi.png": "d9657f566302f918c6cb4b9a9d9de933",
"assets/assets/character_sprites/c0.png": "14a6825be7085eff942a31ab2ac29ecd",
"assets/assets/character_sprites/cole.png": "fae2e115a53253bd09fb367605473b65",
"assets/assets/character_sprites/lukas.png": "7972fe40eabb4aefac4c1e433c313f99",
"assets/assets/character_sprites/witch.png": "b8b2b817a957ce81e216e5fe86c50971",
"assets/assets/fonts/ConcertOne-Regular.ttf": "47fb27f06685e983e830e0d7c33c5e8b",
"assets/FontManifest.json": "5c9cae536d98fdc4a2c6b2f34f122166",
"assets/fonts/MaterialIcons-Regular.otf": "36475af447db2d2c736f89d6b0b4ea7a",
"assets/NOTICES": "00bae75a26f227cd28ba82e168bf4c00",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "f262f49c76a5c2aa061c6544b536913d",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "12ada8dac0647203ac45f5f5adeb0632",
"icons/Icon-192.png": "bf5a344e06c8a028c499a3e6d98a54af",
"icons/Icon-512.png": "5830a844b08035310cec4cfe88804087",
"icons/Icon-maskable-192.png": "bf5a344e06c8a028c499a3e6d98a54af",
"icons/Icon-maskable-512.png": "5830a844b08035310cec4cfe88804087",
"index.html": "ef2a1043ef634a72499a5bc0579c6a7a",
"/": "ef2a1043ef634a72499a5bc0579c6a7a",
"main.dart.js": "aa24444864dbc72b7be1e8c795b1f5aa",
"manifest.json": "57367f6be3be826514765a9dad2a8e3f",
"version.json": "9ee1524e80f68850244867748af962ff"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
