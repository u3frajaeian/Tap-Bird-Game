import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tap_bird/game/Assets.dart';
import 'package:tap_bird/game/tap_bird_game.dart';

class MainMenuScreen extends StatelessWidget {
  final TapBirdGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: (){
          game.overlays.remove('mainMenu');
          game.resumeEngine();
        },
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(image: DecorationImage(image: AssetImage(Assets.menu), fit: BoxFit.cover)),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}
