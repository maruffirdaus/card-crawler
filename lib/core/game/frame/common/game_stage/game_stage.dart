class GameStage {
  GameStage._({required this.background});

  String background;

  static String _backgroundPath(String fileName) =>
      'assets/backgrounds/$fileName';

  static final forest = GameStage._(background: _backgroundPath('Forest.png'));

  static final snowyMountainForest = GameStage._(background: _backgroundPath('SnowyMountainForest.png'));

  static final desert = GameStage._(background: _backgroundPath('Desert.png'));

  static final castle = GameStage._(background: _backgroundPath('Castle.png'));
}
