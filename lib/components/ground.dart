import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/layers.dart';
import 'package:flame/parallax.dart';
import 'package:tap_bird/game/Assets.dart';
import 'package:tap_bird/game/configuration.dart';

import '../game/tap_bird_game.dart';

class Ground extends ParallaxComponent<TapBirdGame> with HasGameRef<TapBirdGame> {
  Ground();

  @override
  Future<void> onLoad() async {
    final ground = await Flame.images.load(Assets.ground);
    parallax = Parallax([ParallaxLayer(ParallaxImage(ground, fill: LayerFill.none))]);
    add(RectangleHitbox(position: Vector2(0,gameRef.size.y-Configuration.groundHeight),size: Vector2(gameRef.size.x,Configuration.groundHeight)));
  }
  @override
  void update(double dt) {
    super.update(dt);
    parallax?.baseVelocity.x=Configuration.gameSpeed;

  }
}
