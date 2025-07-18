import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:space_shooter_game/helper_widget/space_shooter_game.dart';

class Bullet extends SpriteAnimationComponent
    with HasGameRef<SpaceShooterGame> {

  Bullet({super.position});
  final speed = -500;
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    add(RectangleHitbox(collisionType: CollisionType.passive));
    size = Vector2(16, 32);
    anchor = Anchor.center;
    animation = await game.loadSpriteAnimation(
      'space/bullet.png',
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.2,
        textureSize: Vector2(8, 16), //spawncomponent
      ),
    );
  }

  @override
  void update(double dt) {
    position.y += dt * speed;
    if(position.y < -height) {
      removeFromParent();
    }
    super.update(dt);
  }
}
