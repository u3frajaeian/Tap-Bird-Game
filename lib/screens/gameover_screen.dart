import 'package:flutter/material.dart';
import 'package:tap_bird/game/Assets.dart';
import 'package:tap_bird/game/tap_bird_game.dart';

class GameOverScreen extends StatelessWidget {
  final TapBirdGame game;
  static const String id = 'gameOver';

  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset((Assets.gameOver)),
            ElevatedButton(onPressed: onRestart, child: const Text('Restart'))
          ],
        ),
      ),
    );
  }
  void onRestart(){
    game.bird.reset();
    game.overlays.remove('gameOver');
    game.resumeEngine();
  }
}
