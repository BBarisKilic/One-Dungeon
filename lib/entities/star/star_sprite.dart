import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/game/game.dart';

/// {@template star_sprite}
/// Sprite animation of the star entity.
/// {@endtemplate}
class StarSprite extends SpriteAnimationComponent
    with HasGameReference<OneDungeonGame> {
  /// {@macro star_sprite}
  StarSprite({
    required Vector2 textureSize,
  })  : _textureSize = textureSize,
        super(size: textureSize);

  final Vector2 _textureSize;

  @override
  Future<void>? onLoad() async {
    final starImage = Flame.images.fromCache(GameAssets.starSprite);

    animation = SpriteAnimation.fromFrameData(
      starImage,
      SpriteAnimationData.sequenced(
        amount: 3,
        stepTime: 0.15,
        textureSize: _textureSize,
      ),
    );

    return super.onLoad();
  }
}
