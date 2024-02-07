import 'dart:math';

import 'package:flame/components.dart';
import 'package:tap_bird/components/pipe.dart';
import 'package:tap_bird/game/configuration.dart';
import 'package:tap_bird/game/pipe_position.dart';
import 'package:tap_bird/game/tap_bird_game.dart';

class PipeGroup extends PositionComponent with HasGameRef<TapBirdGame>{
  PipeGroup();
  final _random =Random();
  @override
  Future<void> onLoad() async {
    position.x=gameRef.size.x;

    final heightMinusGround=gameRef.size.y-Configuration.groundHeight;
    final spaceBetweenPipes=100+_random.nextDouble()*(heightMinusGround/4);
    final centerY=spaceBetweenPipes+_random.nextDouble()*(heightMinusGround-spaceBetweenPipes);
    addAll([Pipe(pipePosition: PipePosition.top, height: centerY-spaceBetweenPipes/2),
      Pipe(pipePosition: PipePosition.bottom, height: heightMinusGround-(centerY+spaceBetweenPipes/2))]);
  }
  @override
  void update(double dt) {
    super.update(dt);
    position.x-=Configuration.gameSpeed*dt;
    if(position.x< -50){
      removeFromParent();

    }
  }
}