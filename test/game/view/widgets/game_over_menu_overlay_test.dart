import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OneDungeonAudioPlayer audioPlayer;
  late TestGame game;

  setUpAll(() async {
    audioPlayer = OneDungeonAudioPlayer.test(
      playBackgroundAudio: (_, {double? volume}) async {},
      stopBackgroundAudio: () async {},
      playSingleAudio: (_, {double? volume}) async {},
      preCacheSingleAudio: (_) async {},
    );
    game = TestGame();

    await di.initializeDependencies();

    await di.injector.unregister<OneDungeonAudioPlayer>();
    await di.injector.unregister<OneDungeonGame>();

    di.injector.registerSingleton<OneDungeonAudioPlayer>(audioPlayer);
    di.injector.registerSingleton<OneDungeonGame>(game);
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('GameOverMenuOverlay', () {
    testWidgets('renders GameOverMenuOverlay', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(const GameOverMenuOverlay());
        await tester.pump();

        expect(find.byType(MenuButton), findsNWidgets(2));
      });
    });

    group('buttons', () {
      testWidgets('replay works as expected', (tester) async {
        await tester.runAsync(() async {
          final game = di.injector<OneDungeonGame>();

          await tester.pumpApp(const GameOverMenuOverlay());
          await tester.pump();

          game.audioPlayer = audioPlayer;

          await tester.tap(find.byKey(const Key('menuButton1')));

          expect(game.score, equals(0));
          expect(game.collectedStars, equals(0));
          expect(game.time, equals(0));
        });
      });

      testWidgets('exit to menu works as expected', (tester) async {
        await tester.runAsync(() async {
          final game = di.injector<OneDungeonGame>();

          await tester.pumpApp(const GameOverMenuOverlay());
          await tester.pump();

          game.overlays.addEntry(
            OneDungeonGame.menuOverlay,
            (context, game) => const SizedBox(),
          );

          expect(game.overlays.activeOverlays, isEmpty);

          await tester.tap(find.byKey(const Key('menuButton2')));

          expect(game.overlays.activeOverlays, [OneDungeonGame.menuOverlay]);
        });
      });
    });
  });
}
