class Character {
  Character._({required this.name, required this.sprite});

  String name;
  String sprite;

  static String _spritePath(String fileName) =>
      'assets/character_sprites/$fileName';

  static final cole = Character._(
    name: 'Cole',
    sprite: _spritePath('vito.png'),
  );

  static final lukas = Character._(
    name: 'Lukas',
    sprite: _spritePath('bryan.png'),
  );
}
