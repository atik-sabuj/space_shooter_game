import 'package:flutter/material.dart';
import 'package:space_shooter_game/helper_widget/space_shooter_game.dart';

class GameOverScreen extends StatelessWidget {
  static const String ID = 'gameover';
  const GameOverScreen({super.key, required this.game,});
  final SpaceShooterGame game;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text('GAME OVER', style: TextStyle(fontSize: 25.0),),
            Text('Total Enemy Killed: ${game.enemyKilled}', style: TextStyle(fontSize: 30.0),),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Go home'),
            ),
          ],
        ),
      ),
    );
  }
}
