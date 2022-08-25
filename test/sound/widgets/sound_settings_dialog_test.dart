import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';
import 'package:one_dungeon/sound/sound.dart';
import 'package:sharp_toggle_switch/sharp_toggle_switch.dart';

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

    di.injector.registerSingleton<OneDungeonAudioPlayer>(audioPlayer);
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('SoundSettingsDialog', () {
    testWidgets('renders SoundSettingsDialog', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(const SoundSettingsDialog());
        await tester.pump();

        expect(find.byType(SoundSettingsDialog), findsNWidgets(1));
      });
    });

    testWidgets('renders two SharpToggleSwitch', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(const SoundSettingsDialog());
        await tester.pump();

        expect(find.byType(SharpToggleSwitch), findsNWidgets(2));
      });
    });

    testWidgets('background music SharpToggleSwitch works as expected',
        (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(const SoundSettingsDialog());
        await tester.pump();

        expect(audioPlayer.isBackgroundMusicActive, isFalse);

        await tester.tap(find.byType(GestureDetector).at(1));

        expect(audioPlayer.isBackgroundMusicActive, isTrue);

        await tester.tap(find.byType(GestureDetector).at(0));

        expect(audioPlayer.isBackgroundMusicActive, isFalse);
      });
    });

    testWidgets('sfx SharpToggleSwitch works as expected', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(const SoundSettingsDialog());
        await tester.pump();

        expect(audioPlayer.isSfxActive, isFalse);

        await tester.tap(find.byType(GestureDetector).at(3));

        expect(audioPlayer.isSfxActive, isTrue);

        await tester.tap(find.byType(GestureDetector).at(2));

        expect(audioPlayer.isSfxActive, isFalse);
      });
    });
  });
}
