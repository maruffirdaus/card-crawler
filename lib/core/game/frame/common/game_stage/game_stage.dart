class GameStage {
  GameStage._({required this.background});

  String background;

  static String _backgroundPath(String fileName) =>
      'assets/backgrounds/$fileName';

  static final forest = GameStage._(background: _backgroundPath('forest.png'));

  static final snowyMountainForest = GameStage._(
    background: _backgroundPath('snowy_mountain_forest.png'),
  );

  static final desert = GameStage._(background: _backgroundPath('desert.png'));

  static final castle = GameStage._(background: _backgroundPath('castle.png'));

  static final cliff = GameStage._(background: _backgroundPath('cliff.png'));

  static final black = GameStage._(
    background: _backgroundPath('black_background.png'),
  );
}
