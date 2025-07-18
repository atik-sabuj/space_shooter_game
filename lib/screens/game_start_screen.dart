import 'package:flutter/material.dart';
import 'package:space_shooter_game/screens/game_play_screen.dart';

class GameStartScreen extends StatelessWidget {
  const GameStartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => GamePlayScreen())),
            child: const Text("Start"),
        ),
      ),
    );
  }
}
