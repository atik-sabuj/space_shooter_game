import 'package:flame/components.dart';
import 'package:space_shooter_game/helper_widget/space_shooter_game.dart';

class Explosion extends SpriteAnimationComponent with
HasGameRef<SpaceShooterGame> {

  Explosion({super.position});
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = Vector2.all(64);
    anchor = Anchor.center;
    removeOnFinish = true;

    animation = await game.loadSpriteAnimation(
      'space/explosion.png',
      SpriteAnimationData.sequenced(
        amount: 6,
        stepTime: .1,
        textureSize: Vector2.all(32),
        loop: false,
      ),
    );
  }
}