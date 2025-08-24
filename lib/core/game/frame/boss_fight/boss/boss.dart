class Boss {
  Boss._({required this.health, required this.sprite});

  int health;
  String sprite;

  static String _spritePath(String fileName) => 'assets/boss_sprites/$fileName';

  static final amomongoEnemy = Boss._(
    health: 45,
    sprite: _spritePath('amomongo_enemy.png'),
  );

  static final buwayaEnemy = Boss._(
    health: 45,
    sprite: _spritePath('buwaya_enemy.png'),
  );

  static final kaperosaEnemy = Boss._(
    health: 45,
    sprite: _spritePath('kaperosa_enemy.png'),
  );

  static final lukasEnemy = Boss._(
    health: 45,
    sprite: _spritePath('lukas_enemy.png'),
  );
}
