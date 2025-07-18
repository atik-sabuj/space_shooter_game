import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import '../widgets/space_shooter_game.dart';

class GamePlayScreen extends StatelessWidget {
  const GamePlayScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SpaceShooterGame game = SpaceShooterGame();
    return GameWidget (game: game);
  }
}
