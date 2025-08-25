class Character {
  Character._({required this.name, required this.sprite});

  String name;
  String sprite;

  static String _spritePath(String fileName) =>
      'assets/character_sprites/$fileName';

  static final cole = Character._(
    name: 'Cole',
    sprite: _spritePath('cole.png'),
  );

  static final lukas = Character._(
    name: 'Lukas',
    sprite: _spritePath('lukas.png'),
  );

  static final witch = Character._(
    name: 'Elder',
    sprite: _spritePath('witch.png'),
  );

  static final c0 = Character._(name: 'c0', sprite: _spritePath('c0.png'));
}
