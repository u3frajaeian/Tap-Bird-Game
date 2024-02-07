import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:tap_bird/screens/gameover_screen.dart';
import 'package:tap_bird/screens/main_menu_screen.dart';

import 'game/tap_bird_game.dart';

void main() {
  final game = TapBirdGame();
  runApp(GameWidget(
    game: game,
    initialActiveOverlays: const [MainMenuScreen.id],
    overlayBuilderMap: {
      'mainMenu': (context, _) => MainMenuScreen(game: game),
      'gameOver': (context, _) => GameOverScreen(game: game)
    },
  ));
}
