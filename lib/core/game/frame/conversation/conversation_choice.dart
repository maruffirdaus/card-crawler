import 'package:card_crawler/core/game/frame/common/status_effect/status_effect.dart';

class ConversationChoice {
  ConversationChoice({
    required this.text,
    this.nextUnitId,
    this.nextFrameId,
    this.nextStatusEffects,
    this.onSelected,
  });

  String text;
  String? nextUnitId;
  String? nextFrameId;
  List<StatusEffect>? nextStatusEffects;
  Function()? onSelected;
}
