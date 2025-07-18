import 'package:flame/components.dart';
import 'package:space_shooter_game/helper_widget/space_shooter_game.dart';

class PlayerExplosion extends SpriteAnimationComponent with
HasGameRef<SpaceShooterGame> {

  PlayerExplosion({super.position});
  @override
  Future<void> onLoad() async {
    await super.onLoad();
    size = Vector2(66, 96);
    anchor = Anchor.center;
    removeOnFinish = true;

    animation = await game.loadSpriteAnimation(
      'space/light_explosion.png',
      SpriteAnimationData.sequenced(
        amount: 7,
        stepTime: .2,
        textureSize: Vector2(22, 32),
        loop: false,
      ),
    );
  }
}