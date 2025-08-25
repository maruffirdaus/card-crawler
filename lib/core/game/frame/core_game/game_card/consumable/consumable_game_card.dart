import 'package:card_crawler/core/game/frame/core_game/game_card/consumable/consumable_game_card_effect.dart';

import '../base/game_card.dart';

class ConsumableGameCard extends GameCard {
  ConsumableGameCard._({
    required super.id,
    required super.value,
    required super.effect,
    required super.sprite,
  }) : super(
         icon: 'assets/card_icons/consumable_32.png',
         iconSmall: 'assets/card_icons/consumable_16.png',
       );

  static String _spritePath(String fileName) =>
      'assets/card_sprites/consumable/$fileName';

  static final ashDraught = ConsumableGameCard._(
    id: 16,
    value: 5,
    effect: ConsumableGameCardEffect.bloodthornBrew,
    sprite: _spritePath('ash_draught.png'),
  );

  static final greyMatterPotion = ConsumableGameCard._(
    id: 17,
    value: 7,
    effect: ConsumableGameCardEffect.titansShroom,
    sprite: _spritePath('grey_matter_potion.png'),
  );

  static final etherGreyTonic = ConsumableGameCard._(
    id: 18,
    value: 6,
    effect: ConsumableGameCardEffect.temporalDew,
    sprite: _spritePath('ether_grey_tonic.png'),
  );

  static final vitalisPotion = ConsumableGameCard._(
    id: 19,
    value: 4,
    effect: ConsumableGameCardEffect.emeticElixir,
    sprite: _spritePath('vitalis_potion.png'),
  );

  static final goldenTonic = ConsumableGameCard._(
    id: 20,
    value: 3,
    effect: ConsumableGameCardEffect.bolterPotion,
    sprite: _spritePath('golden_tonic.png'),
  );

  static final solEssence = ConsumableGameCard._(
    id: 21,
    value: 7,
    effect: ConsumableGameCardEffect.agedBerries,
    sprite: _spritePath('sol_essence.png'),
  );

  static final gildedElixir = ConsumableGameCard._(
    id: 22,
    value: 7,
    effect: ConsumableGameCardEffect.volatileElixir,
    sprite: _spritePath('gilded_elixir.png'),
  );

  static final verdantElixir = ConsumableGameCard._(
    id: 22,
    value: 5,
    effect: ConsumableGameCardEffect.temporalDew,
    sprite: _spritePath('verdant_elixir.png'),
  );

  static final vineBrew = ConsumableGameCard._(
    id: 22,
    value: 4,
    effect: ConsumableGameCardEffect.emeticElixir,
    sprite: _spritePath('vine_brew.png'),
  );

  static final purgeBrew = ConsumableGameCard._(
    id: 22,
    value: 5,
    effect: ConsumableGameCardEffect.volatileElixir,
    sprite: _spritePath('purge_brew.png'),
  );

  static final indigoSerum = ConsumableGameCard._(
    id: 22,
    value: 4,
    effect: ConsumableGameCardEffect.bolterPotion,
    sprite: _spritePath('indigo_serum.png'),
  );

  static final azureElixir = ConsumableGameCard._(
    id: 22,
    value: 6,
    effect: ConsumableGameCardEffect.agedBerries,
    sprite: _spritePath('azure_elixir.png'),
  );

  static final oceanMist = ConsumableGameCard._(
    id: 22,
    value: 7,
    effect: ConsumableGameCardEffect.titansShroom,
    sprite: _spritePath('ocean_mist.png'),
  );

  static final venomBrew = ConsumableGameCard._(
    id: 22,
    value: 3,
    effect: ConsumableGameCardEffect.volatileElixir,
    sprite: _spritePath('venom_brew.png'),
  );

  static final arcanaElixir = ConsumableGameCard._(
    id: 22,
    value: 5,
    effect: ConsumableGameCardEffect.bloodthornBrew,
    sprite: _spritePath('arcana_elixir.png'),
  );

  static final lavenderEssence = ConsumableGameCard._(
    id: 22,
    value: 7,
    effect: ConsumableGameCardEffect.emeticElixir,
    sprite: _spritePath('lavender_essence.png'),
  );

  static final enigmaTonic = ConsumableGameCard._(
    id: 22,
    value: 7,
    effect: ConsumableGameCardEffect.temporalDew,
    sprite: _spritePath('enigma_tonic.png'),
  );

  static final crimsonSerum = ConsumableGameCard._(
    id: 22,
    value: 6,
    effect: ConsumableGameCardEffect.bloodthornBrew,
    sprite: _spritePath('crimson_serum.png'),
  );

  static final fireVeinTonic = ConsumableGameCard._(
    id: 22,
    value: 6,
    effect: ConsumableGameCardEffect.bloodthornBrew,
    sprite: _spritePath('fire_vein_tonic.png'),
  );

  static final stoneHideElixir = ConsumableGameCard._(
    id: 22,
    value: 5,
    effect: ConsumableGameCardEffect.titansShroom,
    sprite: _spritePath('stone_hide_elixir.png'),
  );

  static final ivoryDraught = ConsumableGameCard._(
    id: 22,
    value: 7,
    effect: ConsumableGameCardEffect.temporalDew,
    sprite: _spritePath('ivory_draught.png'),
  );

  static final snowyEntries = [
    ashDraught,
    greyMatterPotion,
    etherGreyTonic,
    vitalisPotion,
    goldenTonic,
    solEssence,
    gildedElixir,
  ];

  static final desertEntries = [
    verdantElixir,
    vineBrew,
    purgeBrew,
    indigoSerum,
    azureElixir,
    oceanMist,
    venomBrew,
  ];

  static final castleEntries = [
    arcanaElixir,
    lavenderEssence,
    enigmaTonic,
    crimsonSerum,
    fireVeinTonic,
    stoneHideElixir,
    ivoryDraught,
  ];
}
