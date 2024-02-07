import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:tap_bird/game/Assets.dart';
import 'package:tap_bird/game/bird_movement.dart';
import 'package:tap_bird/game/configuration.dart';
import 'package:tap_bird/game/tap_bird_game.dart';

class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<TapBirdGame>,CollisionCallbacks {
  Bird();

  @override
  Future<void> onLoad() async {
    final birdIdle = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUp = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDown = await gameRef.loadSprite(Assets.birdDownFlap);

    size = Vector2(50, 40);
    position = Vector2(50, gameRef.size.y / 2 - size.y / 2);
    current = BirdMovement.idle;
    sprites = {
      BirdMovement.idle: birdIdle,
      BirdMovement.up: birdUp,
      BirdMovement.down: birdDown,
    };
    add(CircleHitbox());
  }
  @override
  void update(double dt) {
    super.update(dt);
    position.y +=Configuration.birdVelocity* dt;
  }

  void fly() {
    add(MoveByEffect(Vector2(0,Configuration.gravity), EffectController(duration: 0.2,curve: Curves.decelerate),
    onComplete: ()=>current=BirdMovement.down));
    current=BirdMovement.up;
  }
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints, PositionComponent other) {
    super.onCollisionStart(intersectionPoints, other);
    debugPrint('col');
    gameOver();
  }

  void gameOver() {
    gameRef.pauseEngine();
  }

}