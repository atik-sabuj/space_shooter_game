import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:space_shooter_game/overlays/game_end_button.dart';
import 'package:space_shooter_game/screens/game_over_screen.dart';
import 'package:space_shooter_game/helper_widget/space_shooter_game.dart';

class GamePlayScreen extends StatelessWidget {
  const GamePlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SpaceShooterGame game = SpaceShooterGame();
    return GameWidget(
      game: game,
      /*initialActiveOverlays: [
        GameEndButton.ID
      ],*/
      overlayBuilderMap: {
        GameOverScreen.ID : (context, _) => GameOverScreen(game: game,),
        GameEndButton.ID : (context, _) => GameEndButton(game: game,),
      },
    );
  }
}
