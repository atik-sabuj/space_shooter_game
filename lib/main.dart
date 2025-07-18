import 'package:flutter/material.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:space_shooter_game/screens/game_start_screen.dart';

void main() {
  //WidgetsFlutterBinding.ensureInitialized();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple,),
      useMaterial3: true,
    ),
    home: const GameStartScreen(),
  ));
}

