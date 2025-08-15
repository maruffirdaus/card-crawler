class GameStage {
  GameStage._({required this.background});

  String background;

  static String _backgroundPath(String fileName) =>
      'assets/backgrounds/$fileName';

  static final s0 = GameStage._(background: _backgroundPath('b0.png'));

  static final s1 = GameStage._(background: _backgroundPath('b1.png'));
}
