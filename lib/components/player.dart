import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_shooter_game/components/bullet.dart';
import 'package:space_shooter_game/components/player_explosion.dart';
import 'package:space_shooter_game/screens/game_over_screen.dart';
import 'package:space_shooter_game/helper_widget/space_shooter_game.dart';

import 'enemy.dart';

class Player extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame>, CollisionCallbacks {
  late SpawnComponent _bulletSpawner;

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
    size = Vector2(64, 96);
    anchor = Anchor.center;
    position = game.size / 2;
    animation = await game.loadSpriteAnimation(
      'space/player.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.2,
        textureSize: Vector2(32, 39),
      ),
    );
    _bulletSpawner = SpawnComponent(
      factory: (index) {
        game.playGunShot();
        return Bullet(
          position: position + Vector2(0 , -height / 2),
        );
      },
      period: 0.2,
      selfPositioning: true,
      autoStart: false,
    );
    game.add(_bulletSpawner);
  }

  void move(Vector2 delta) {
    position.add(delta);
  }

  void startShooting() {
    _bulletSpawner.timer.start();
  }

  void stopShooting() {
    _bulletSpawner.timer.stop();
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if(other is Enemy) {
      removeFromParent();
      game.add(PlayerExplosion(position: position));
      game.playExplosion();
      other.removeFromParent();
      Future.delayed(const Duration(seconds: 1), () {
        game.pauseEngine();
        game.overlays.add(GameOverScreen.ID);
      });
    }
  }
}
