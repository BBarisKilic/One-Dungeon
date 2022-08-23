import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/about/about.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/how_to_play/how_to_play.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';
import 'package:one_dungeon/sound/sound.dart';

import '../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late OneDungeonAudioPlayer audioPlayer;

  setUpAll(() async {
    audioPlayer = OneDungeonAudioPlayer.test(
      playBackgroundAudio: (_, {double? volume}) async {},
      stopBackgroundAudio: () async {},
      playSingleAudio: (_, {double? volume}) async {},
      preCacheSingleAudio: (_) async {},
    );

    await di.initializeDependencies();

    await di.injector.unregister<OneDungeonAudioPlayer>();

    di.injector.registerFactory<OneDungeonAudioPlayer>(() => audioPlayer);
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('StartGameListener', () {
    testWidgets('renders StartGameListener', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(
          Stack(
            children: const [
              OneDungeonGameLoadedView(),
              MenuOverlay(),
            ],
          ),
        );
        await tester.pump();

        expect(find.byType(MenuButton), findsNWidgets(5));
      });
    });

    group('buttons', () {
      testWidgets('play works as expected', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpApp(
            Stack(
              children: const [
                OneDungeonGameLoadedView(),
                MenuOverlay(),
              ],
            ),
          );
          await tester.pump();

          await tester.tap(find.byKey(const Key('menuButton1')));

          expect(find.byType(SoundSettingsDialog), findsNothing);
        });
      });

      testWidgets('sound works as expected', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpApp(
            Stack(
              children: const [
                OneDungeonGameLoadedView(),
                MenuOverlay(),
              ],
            ),
          );
          await tester.pump();

          await tester.tap(find.byKey(const Key('menuButton2')));
          await tester.pumpAndSettle();

          expect(find.byType(SoundSettingsDialog), findsOneWidget);
        });
      });

      testWidgets('language works as expected', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpApp(
            Stack(
              children: const [
                OneDungeonGameLoadedView(),
                MenuOverlay(),
              ],
            ),
          );
          await tester.pump();

          await tester.tap(find.byKey(const Key('menuButton3')));
          await tester.pumpAndSettle();

          expect(find.byType(SoundSettingsDialog), findsNothing);
        });
      });

      testWidgets('how to play works as expected', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpApp(
            Stack(
              children: const [
                OneDungeonGameLoadedView(),
                MenuOverlay(),
              ],
            ),
          );
          await tester.pump();

          await tester.tap(find.byKey(const Key('menuButton4')));
          await tester.pumpAndSettle();

          expect(find.byType(HowToPlayDialog), findsOneWidget);
        });
      });

      testWidgets('about works as expected', (tester) async {
        await tester.runAsync(() async {
          await tester.pumpApp(
            Stack(
              children: const [
                OneDungeonGameLoadedView(),
                MenuOverlay(),
              ],
            ),
          );
          await tester.pump();

          await tester.tap(find.byKey(const Key('menuButton5')));
          await tester.pumpAndSettle();

          expect(find.byType(AboutGameDialog), findsOneWidget);
        });
      });
    });
  });
}
