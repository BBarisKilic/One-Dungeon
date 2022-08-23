import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/app/app.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

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

  group('App', () {
    testWidgets('renders App', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const App());
        await tester.pump();

        expect(find.byType(OneDungeonGamePage), findsOneWidget);
      });
    });
  });
}
