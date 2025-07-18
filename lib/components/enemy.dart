import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_shooter_game/components/explosion.dart';
import 'package:space_shooter_game/helper_widget/space_shooter_game.dart';

import 'bullet.dart';

class Enemy extends SpriteAnimationComponent with
HasGameRef<SpaceShooterGame>, CollisionCallbacks {
  final speed = 250;

  Enemy({super.position}) : super(
    size: Vector2.all(32),
    anchor: Anchor.center,
  );

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox());
    animation = await game.loadSpriteAnimation(
      'space/enemy.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: .2,
        textureSize: Vector2.all(16),
      ),
    );
  }

  @override
  void update(double dt) {
    position.y += dt * speed;
    if(position.y > game.size.y) {
      removeFromParent();
    }
    super.update(dt);
  }

  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    if(other is Bullet) {
      removeFromParent();
      other.removeFromParent();
      game.playExplosion();
      game.add(Explosion(position: position));
      game.increaseEnemyKillCount();
    }
  }
}