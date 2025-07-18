import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/experimental.dart';
import 'package:flame/game.dart';
import 'package:flame/parallax.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter_game/components/enemy.dart';
import 'package:space_shooter_game/components/player.dart';
import 'package:flame_audio/flame_audio.dart';

class SpaceShooterGame extends FlameGame
    with PanDetector, HasCollisionDetection {
  late Player player;
  late SpawnComponent enemyCreator;
  late TextComponent enemyKilledCount;
  int enemyKilled = 0;
  double enemyPeriod = 0.5;
  Stopwatch elapsedTime = Stopwatch();

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    await FlameAudio.audioCache.loadAll([
      'explosion.mp3',
      'gunshot3.mp3',
    ]);
    final parallax = await loadParallaxComponent(
      [
        ParallaxImageData('space/background_1.png'),
        ParallaxImageData('space/background_2.png'),
        ParallaxImageData('space/background_4.png'),
      ],
      baseVelocity: Vector2(0, -5),
      repeat: ImageRepeat.repeat,
      velocityMultiplierDelta: Vector2(0, 2),
    );
    player = Player();
    add(parallax);
    add(player);
    _createEnemyComponent();
    enemyKilledCount = TextComponent(
        text: 'Enemy Killed: $enemyKilled',
        position: Vector2(10, size.y - 10),
        anchor: Anchor.bottomLeft,
        textRenderer: TextPaint(
            style: const TextStyle(fontSize: 22, color: Colors.white)));
    add(enemyKilledCount);
    add(TimerComponent(
      period: 10,
      repeat: true,
      autoStart: true,
      onTick: () {
        _levelUp();
      }
    ));
    elapsedTime.start();
  }

  @override
  void onPanUpdate(DragUpdateInfo info) {
    player.move(info.delta.global);
    super.onPanUpdate(info);
  }

  @override
  void onPanStart(DragStartInfo info) {
    player.startShooting();
    super.onPanStart(info);
  }

  @override
  void onPanEnd(DragEndInfo info) {
    player.stopShooting();
    super.onPanEnd(info);
  }

  void _createEnemyComponent() {
    enemyCreator = SpawnComponent(
      factory: (index) {
        return Enemy();
      },
      period: enemyPeriod,
      area: Rectangle.fromLTWH(0, 0, size.x, -32),
    );
    add(enemyCreator);
  }

  increaseEnemyKillCount() {
    enemyKilled++;
    enemyKilledCount.text = 'Enemy Killed: $enemyKilled';
  }

  void _levelUp() {
    if(enemyPeriod > 0.1) {
      enemyPeriod -= 0.1;
      enemyCreator.removeFromParent();
      _createEnemyComponent();
    }
  }

  void playGunShot() async {
    await FlameAudio.play('gunshot3.mp3', volume: 1.0);
  }

  void playExplosion() async {
    await FlameAudio.play('explosion.mp3', volume: 0.8);
  }
}
