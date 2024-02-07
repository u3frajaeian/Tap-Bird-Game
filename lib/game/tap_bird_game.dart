import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:tap_bird/components/background.dart';
import 'package:tap_bird/components/bird.dart';
import 'package:tap_bird/components/ground.dart';
import 'package:tap_bird/components/pipe_group.dart';
import 'package:tap_bird/game/configuration.dart';

class TapBirdGame extends FlameGame with TapDetector,HasCollisionDetection {
  late Bird bird;
  Timer interval = Timer(Configuration.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    debugMode=true;
    addAll([Background(),
      Ground(),
      bird = Bird(),
      PipeGroup()]);
    interval.onTick=()=>add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
  }
  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }
}
