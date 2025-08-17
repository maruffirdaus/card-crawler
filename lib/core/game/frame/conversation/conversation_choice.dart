class ConversationChoice {
  ConversationChoice({
    required this.text,
    this.nextUnitId,
    this.nextFrameId,
    this.onSelected,
  });

  String text;
  String? nextUnitId;
  String? nextFrameId;
  Function()? onSelected;
}
