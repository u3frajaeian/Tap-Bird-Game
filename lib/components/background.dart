import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:tap_bird/game/Assets.dart';

import '../game/tap_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<TapBirdGame>{
  Background();
  @override
  Future<void> onLoad() async{
    final background=await Flame.images.load(Assets.background);
    size=gameRef.size;
    sprite=Sprite(background);
  }

}