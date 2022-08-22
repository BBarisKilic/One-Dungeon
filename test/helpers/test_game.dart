import 'package:one_dungeon/game/game.dart';

class TestGame extends OneDungeonGame {
  TestGame() : super();

  @override
  Future<void>? onLoad() async {
    final futures = [
      ...preLoadAssets(),
    ];

    await Future.wait<void>(
      futures.map((loadableBuilder) => loadableBuilder()).toList(),
    );

    return super.onLoad();
  }
}
