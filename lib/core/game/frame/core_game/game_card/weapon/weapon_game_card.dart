import 'package:card_crawler/core/game/frame/core_game/game_card/weapon/weapon_card_effect.dart';

import '../base/game_card.dart';

class WeaponGameCard extends GameCard {
  WeaponGameCard._({
    required super.id,
    required super.value,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/weapon_32.png',
         iconSmall: 'assets/card_icons/weapon_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/weapon/$fileName';

  static final stormSplitter = WeaponGameCard._(
    id: 0,
    value: 5,
    effect: WeaponGameCardEffect.stormSplitter,
    sprite: _spritePath('storm_splitter.png'),
  );

  static final starForgedHammer = WeaponGameCard._(
    id: 1,
    value: 3,
    effect: WeaponGameCardEffect.starForgedHammer,
    sprite: _spritePath('star_forged_hammer.png'),
  );

  static final shadowFang = WeaponGameCard._(
    id: 2,
    value: 7,
    effect: WeaponGameCardEffect.shadowFang,
    sprite: _spritePath('shadow_fang.png'),
  );

  static final skullSplitter = WeaponGameCard._(
    id: 3,
    value: 6,
    effect: WeaponGameCardEffect.skullSplitter,
    sprite: _spritePath('skull_splitter.png'),
  );

  static final eternalCleaver = WeaponGameCard._(
    id: 4,
    value: 5,
    effect: WeaponGameCardEffect.eternalCleaver,
    sprite: _spritePath('eternal_cleaver.png'),
  );

  static final yamatsumi = WeaponGameCard._(
    id: 5,
    value: 3,
    effect: WeaponGameCardEffect.yamatsumi,
    sprite: _spritePath('yamatsumi.png'),
  );

  static final kokuryu = WeaponGameCard._(
    id: 6,
    value: 6,
    effect: WeaponGameCardEffect.kokuryu,
    sprite: _spritePath('kokuryu.png'),
  );

  static final stiletto = WeaponGameCard._(
    id: 7,
    value: 5,
    effect: WeaponGameCardEffect.stiletto,
    sprite: _spritePath('stiletto.png'),
  );

  static final morningStar = WeaponGameCard._(
    id: 8,
    value: 5,
    effect: WeaponGameCardEffect.morningStar,
    sprite: _spritePath('morning_star.png'),
  );

  static final bladedNunchaku = WeaponGameCard._(
    id: 9,
    value: 6,
    effect: WeaponGameCardEffect.bladedNunchaku,
    sprite: _spritePath('bladed_nunchaku.png'),
  );

  static final excalibur = WeaponGameCard._(
    id: 0,
    value: 4,
    effect: WeaponGameCardEffect.excalibur,
    sprite: _spritePath('excalibur.png'),
  );

  static final espadaLarga = WeaponGameCard._(
    id: 0,
    value: 6,
    effect: WeaponGameCardEffect.espadaLarga,
    sprite: _spritePath('espada_larga.png'),
  );

  static final shamshir = WeaponGameCard._(
    id: 0,
    value: 6,
    effect: WeaponGameCardEffect.shamshir,
    sprite: _spritePath('shamshir.png'),
  );

  static final kris = WeaponGameCard._(
    id: 0,
    value: 7,
    effect: WeaponGameCardEffect.kris,
    sprite: _spritePath('kris.png'),
  );

  static final deathCrescent = WeaponGameCard._(
    id: 0,
    value: 5,
    effect: WeaponGameCardEffect.deathCrescent,
    sprite: _spritePath('death_crescent.png'),
  );

  static final khopesh = WeaponGameCard._(
    id: 0,
    value: 6,
    effect: WeaponGameCardEffect.khopesh,
    sprite: _spritePath('khopesh.png'),
  );

  static final fangOfRiton = WeaponGameCard._(
    id: 0,
    value: 7,
    effect: WeaponGameCardEffect.fangOfRiton,
    sprite: _spritePath('fang_of_riton.png'),
  );

  static final shepherdStaff = WeaponGameCard._(
    id: 0,
    value: 4,
    effect: WeaponGameCardEffect.shepherdStaff,
    sprite: _spritePath('shepherd_staff.png'),
  );

  static final gladius = WeaponGameCard._(
    id: 0,
    value: 7,
    effect: WeaponGameCardEffect.gladius,
    sprite: _spritePath('gladius.png'),
  );

  static final doomSpire = WeaponGameCard._(
    id: 0,
    value: 6,
    effect: WeaponGameCardEffect.doomSpire,
    sprite: _spritePath('doom_spire.png'),
  );

  static final poseidonFang = WeaponGameCard._(
    id: 0,
    value: 5,
    effect: WeaponGameCardEffect.poseidonFang,
    sprite: _spritePath('poseidon_fang.png'),
  );

  static final snowyEntries = [
    stormSplitter,
    starForgedHammer,
    shadowFang,
    skullSplitter,
    eternalCleaver,
    yamatsumi,
    kokuryu,
  ];

  static final desertEntries = [
    stiletto,
    morningStar,
    bladedNunchaku,
    excalibur,
    espadaLarga,
    shamshir,
    kris,
  ];

  static final castleEntries = [
    deathCrescent,
    khopesh,
    fangOfRiton,
    shepherdStaff,
    gladius,
    doomSpire,
    poseidonFang,
  ];
}
