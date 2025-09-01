import 'package:flame/components.dart';
import 'package:flame_behaviors/flame_behaviors.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

extension on Duration {
  String format() => '$this'.split('.')[0].padLeft(8, '0');
}

class TimeChangeBehavior extends Behavior<TimeEntity>
    with HasGameReference<OneDungeonGame> {
  @override
  void update(double dt) {
    game.time += dt;

    final time = Duration(seconds: game.time.round()).format();

    parent.textComponent.text = '${game.l10n?.timeText} $time';

    super.update(dt);
  }
}
