import 'package:flutter/material.dart';
import 'package:space_shooter_game/screens/game_over_screen.dart';
import 'package:space_shooter_game/helper_widget/space_shooter_game.dart';

class GameEndButton extends StatelessWidget {
  static const String ID = 'gameoverbtn';
  const GameEndButton({super.key, required this.game,});
  final SpaceShooterGame game;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () {
            game.overlays.add(GameOverScreen.ID);
          },
          child: const Text('End Game'),
        ),
      ),
    );
  }
}
