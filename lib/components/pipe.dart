import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:tap_bird/game/Assets.dart';
import 'package:tap_bird/game/configuration.dart';
import 'package:tap_bird/game/pipe_position.dart';
import 'package:tap_bird/game/tap_bird_game.dart';

class Pipe extends SpriteComponent with HasGameRef<TapBirdGame> {
  Pipe({
    required this.pipePosition,
    required this.height,
  });

  @override
  final double height;
  final PipePosition pipePosition;

  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final rotatedPipe = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);
    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(rotatedPipe);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Configuration.groundHeight;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }
}
