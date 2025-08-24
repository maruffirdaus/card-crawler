import 'package:card_crawler/core/game/frame/core_game/game_card/monster/monster_card_effect.dart';

import '../base/game_card.dart';

class MonsterGameCard extends GameCard {
  MonsterGameCard._({
    required super.id,
    required super.value,
    required super.effect,
    required super.sprite,
  }) : super(
    icon: 'assets/card_icons/monster_32.png',
    iconSmall: 'assets/card_icons/monster_16.png',
  );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/monster/$fileName';

  static final aghoy = MonsterGameCard._( //snowy
    id: 0,
    value: 5,
    effect: MonsterGameCardEffect.ally,
    sprite: _spritePath('aghoy.png'),
  );

  static final amaranhig = MonsterGameCard._( //desert
    id: 1,
    value: 1,
    effect: MonsterGameCardEffect.scaling,
    sprite: _spritePath('amaranhig.png'),
  );

  static final amomongo = MonsterGameCard._( //snowy
    id: 2,
    value: 4,
    effect: MonsterGameCardEffect.wrecker,
    sprite: _spritePath('amomongo.png'),
  );

  static final boar = MonsterGameCard._( //snowy
    id: 3,
    value: 8,
    effect: MonsterGameCardEffect.noEscape,
    sprite: _spritePath('boar.png'),
  );

  static final boar2 = MonsterGameCard._( //snowy
    id: 4,
    value: 7,
    effect: MonsterGameCardEffect.noEscape,
    sprite: _spritePath('boar_2.png'),
  );

  static final bungisngis = MonsterGameCard._( //desert
    id: 5,
    value: 4,
    effect: MonsterGameCardEffect.antiHeal,
    sprite: _spritePath('bungisngis.png'),
  );

  static final busaw = MonsterGameCard._( //snowy
    id: 6,
    value: 3,
    effect: MonsterGameCardEffect.antiHeal,
    sprite: _spritePath('busaw.png'),
  );

  static final buwaya = MonsterGameCard._( //desert
    id: 7,
    value: 9,
    effect: MonsterGameCardEffect.spiky,
    sprite: _spritePath('buwaya.png'),
  );

  static final chicken = MonsterGameCard._( //castle
    id: 8,
    value: 3,
    effect: MonsterGameCardEffect.ally,
    sprite: _spritePath('chicken.png'),
  );

  static final dwendeBlue = MonsterGameCard._( //castle
    id: 9,
    value: 5,
    effect: MonsterGameCardEffect.poisonous,
    sprite: _spritePath('dwende_blue.png'),
  );

  static final dwendeOrange = MonsterGameCard._( //castle
    id: 10,
    value: 6,
    effect: MonsterGameCardEffect.poisonous,
    sprite: _spritePath('dwende_orange.png'),
  );

  static final dwendeRed = MonsterGameCard._( //castle
    id: 11,
    value: 7,
    effect: MonsterGameCardEffect.poisonous,
    sprite: _spritePath('dwende_red.png'),
  );

  static final dwendeYellow = MonsterGameCard._( //castle
    id: 12,
    value: 4,
    effect: MonsterGameCardEffect.poisonous,
    sprite: _spritePath('dwende_yellow.png'),
  );

  static final ekEk = MonsterGameCard._( //desert
    id: 13,
    value: 5,
    effect: MonsterGameCardEffect.corrosive,
    sprite: _spritePath('ek_ek.png'),
  );

  static final evilDwende = MonsterGameCard._( //castle
    id: 14,
    value: 7,
    effect: MonsterGameCardEffect.vengeful,
    sprite: _spritePath('evil_dwende.png'),
  );

  static final kapre = MonsterGameCard._( //snowy
    id: 15,
    value: 7,
    effect: MonsterGameCardEffect.wrecker,
    sprite: _spritePath('kapre.png'),
  );

  static final kolyog = MonsterGameCard._( //desert
    id: 16,
    value: 4,
    effect: MonsterGameCardEffect.mimic,
    sprite: _spritePath('kolyog.png'),
  );

  static final malakat = MonsterGameCard._( //desert
    id: 17,
    value: 7,
    effect: MonsterGameCardEffect.aftermath,
    sprite: _spritePath('malakat.png'),
  );

  static final manananggal = MonsterGameCard._( //castle
    id: 18,
    value: 5,
    effect: MonsterGameCardEffect.opportunist,
    sprite: _spritePath('manananggal.png'),
  );

  static final nunoSaPunso = MonsterGameCard._( //desert
    id: 19,
    value: 2,
    effect: MonsterGameCardEffect.scaling,
    sprite: _spritePath('nuno_sa_punso.png'),
  );

  static final rooster = MonsterGameCard._( //desert
    id: 20,
    value: 4,
    effect: MonsterGameCardEffect.ally,
    sprite: _spritePath('rooster.png'),
  );

  static final santelmo = MonsterGameCard._( //desert //burning
    id: 21,
    value: 5,
    effect: MonsterGameCardEffect.burn,
    sprite: _spritePath('santelmo.png'),
  );

  static final sigbin = MonsterGameCard._( //castle
    id: 22,
    value: 7,
    effect: MonsterGameCardEffect.scaling,
    sprite: _spritePath('sigbin.png'),
  );

  static final sirena = MonsterGameCard._( //castle
    id: 23,
    value: 4,
    effect: MonsterGameCardEffect.corrosive,
    sprite: _spritePath('sirena.png'),
  );

  static final syokoy = MonsterGameCard._( //castle
    id: 24,
    value: 5,
    effect: MonsterGameCardEffect.antiHeal,
    sprite: _spritePath('syokoy.png'),
  );

  static final taongTuod = MonsterGameCard._( //snowy
    id: 25,
    value: 9,
    effect: MonsterGameCardEffect.wrecker,
    sprite: _spritePath('taong_tuod.png'),
  );

  static final tiburones = MonsterGameCard._(//castle
    id: 26,
    value: 7,
    effect: MonsterGameCardEffect.noEscape,
    sprite: _spritePath('tiburones.png'),
  );

  static final tikbalang = MonsterGameCard._( //desert
    id: 27,
    value: 3,
    effect: MonsterGameCardEffect.scaling,
    sprite: _spritePath('tikbalang.png'),
  );

  static final tiyanak = MonsterGameCard._( //castle //burn
    id: 28,
    value: 6,
    effect: MonsterGameCardEffect.burn,
    sprite: _spritePath('tiyanak.png'),
  );

  static final witch = MonsterGameCard._(
    id: 29,
    value: 5,
    effect: MonsterGameCardEffect.opportunist,
    sprite: _spritePath('witch.png'),
  );

  static final entriesSnowy = [
    aghoy,
    amaranhig,
    amomongo,
    boar,
    boar2,
    busaw,
    dwendeBlue,
    dwendeOrange,
    kapre,
    taongTuod,
  ];

  static final entriesDesert = [
    amaranhig,
    bungisngis,
    buwaya,
    ekEk,
    kolyog,
    malakat,
    nunoSaPunso,
    rooster,
    santelmo,
    tikbalang,
  ];

  static final entriesCastle = [
    chicken,
    dwendeRed,
    dwendeYellow,
    evilDwende,
    manananggal,
    sigbin,
    sirena,
    syokoy,
    tiburones,
    tiyanak,
  ];
}