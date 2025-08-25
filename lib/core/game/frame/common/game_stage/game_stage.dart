class GameStage {
  GameStage._({required this.background, required this.bgm});

  String background;
  String bgm;

  static String _backgroundPath(String fileName) =>
      'assets/backgrounds/$fileName';

  static String _bgmPath(String fileName) => 'sounds/bgm/$fileName';

  static final forest = GameStage._(
    background: _backgroundPath('forest.png'),
    bgm: _bgmPath('forest.mp3'),
  );

  static final snowyMountainForest = GameStage._(
    background: _backgroundPath('snowy_mountain_forest.png'),
    bgm: _bgmPath('snowy_mountain_forest.mp3'),
  );

  static final desert = GameStage._(
    background: _backgroundPath('desert.png'),
    bgm: _bgmPath('desert.mp3'),
  );

  static final castle = GameStage._(
    background: _backgroundPath('castle.png'),
    bgm: _bgmPath('castle.mp3'),
  );

  static final cliff = GameStage._(
    background: _backgroundPath('cliff.png'),
    bgm: _bgmPath('cliff.mp3'),
  );
}
