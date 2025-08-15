class Character {
  Character._({required this.name, required this.sprite});

  String name;
  String sprite;

  static String _spritePath(String fileName) =>
      'assets/character_sprites/$fileName';

  static final vito = Character._(
    name: 'Vito',
    sprite: _spritePath('vito.png'),
  );

  static final bryan = Character._(
    name: 'Bryan',
    sprite: _spritePath('bryan.png'),
  );
}
