import 'package:card_crawler/constant/effect/consumable_effect.dart';

import '../../model/game_card.dart';
import '../effect/weapon_effect.dart';
import '../game_card_type.dart';

String _spritePath(String fileName) => 'assets/card_sprites/consumables/$fileName';

List<GameCard> _consumableGameCards = [
  GameCard(
    type: GameCardType.consumable,
    value: 0,
    effect: BloodthornBrew(),
    asset: _spritePath('2.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 6,
    effect: VampireMallet(),
    asset: _spritePath('3.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 8,
    effect: VampireMallet(),
    asset: _spritePath('4.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 8,
    effect: VampireMallet(),
    asset: _spritePath('5.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 9,
    effect: VampireMallet(),
    asset: _spritePath('6.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 9,
    effect: VampireMallet(),
    asset: _spritePath('7.png'),
  ),
  GameCard(
    type: GameCardType.consumable,
    value: 10,
    effect: VampireMallet(),
    asset: _spritePath('8.png'),
  ),
];

List<GameCard> get consumableGameCards => _consumableGameCards.toList();
