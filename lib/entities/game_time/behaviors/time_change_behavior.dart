import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

extension on Duration {
  String format() => '$this'.split('.')[0].padLeft(8, '0');
}

class TimeChangeBehavior extends Behavior<GameTime>
    with HasGameRef<OneDungeonGame> {
  @override
  void update(double dt) {
    gameRef.time += dt;

    final time = Duration(seconds: gameRef.time.round()).format();

    parent.textComponent.text = 'Time: $time';

    super.update(dt);
  }
}
