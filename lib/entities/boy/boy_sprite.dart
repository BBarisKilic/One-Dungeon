import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/entities/entities.dart';
import 'package:one_dungeon/game/game.dart';

/// {@template boy_sprite}
/// Sprit of the boy entity.
/// {@endtemplate}
class BoySprite extends SpriteAnimationGroupComponent<BoyState>
    with HasGameReference<OneDungeonGame> {
  /// {@macro boy_sprite}
  BoySprite({
    required Vector2 textureSize,
    BoyState state = const BoyState.idle(),
  })  : _state = state,
        _textureSize = textureSize,
        super(size: textureSize / 2);

  final BoyState _state;
  final Vector2 _textureSize;

  @override
  Future<void>? onLoad() async {
    final idleImage = Flame.images.fromCache(GameAssets.boyIdleSprite);
    final runImage = Flame.images.fromCache(GameAssets.boyRunSprite);
    final jumpImage = Flame.images.fromCache(GameAssets.boyJumpSprite);

    final idle = SpriteAnimation.fromFrameData(
      idleImage,
      SpriteAnimationData.sequenced(
        amount: 4,
        stepTime: 0.1,
        textureSize: _textureSize,
      ),
    );

    final run = SpriteAnimation.fromFrameData(
      runImage,
      SpriteAnimationData.sequenced(
        amount: 5,
        stepTime: 0.08,
        textureSize: _textureSize,
      ),
    );

    final jump = SpriteAnimation.fromFrameData(
      jumpImage,
      SpriteAnimationData.sequenced(
        amount: 2,
        stepTime: 0.12,
        textureSize: _textureSize,
      ),
    );

    animations = {
      const BoyState.idle(): idle,
      const BoyState.run(): run,
      const BoyState.jump(): jump,
    };

    current = _state;

    return super.onLoad();
  }

  /// Updates the current state.
  void updateState({required BoyState state}) {
    if (current != state) current = state;
  }
}
