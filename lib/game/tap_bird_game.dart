import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/input.dart';
import 'package:flame/src/text/renderers/text_renderer.dart';
import 'package:tap_bird/components/background.dart';
import 'package:tap_bird/components/bird.dart';
import 'package:tap_bird/components/ground.dart';
import 'package:tap_bird/components/pipe_group.dart';
import 'package:tap_bird/game/configuration.dart';

class TapBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Configuration.pipeInterval, repeat: true);
  bool isHit = false;

  @override
  Future<void> onLoad() async {
    debugMode = true;
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      score = buildScore(),
    ]);
    interval.onTick = () => add(PipeGroup());
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text='Score: ${bird.score}';
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  TextComponent buildScore() {
    return TextComponent(text: 'Score: 0', position: Vector2(size.x / 2, size.y / 2 * 0.2), anchor: Anchor.center);
  }
}
