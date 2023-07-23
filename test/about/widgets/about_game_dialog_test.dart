import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/about/about.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../helpers/helpers.dart';

void main() {
  TestWidgetsBinding.ensureInitialized();

  setUpAll(() async {
    await di.initializeDependencies();
    await di.injector.unregister<OneDungeonAudioPlayer>();
    di.injector.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('AboutGameDialog', () {
    testWidgets('renders AboutGameDialog', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(const AboutGameDialog());
        await tester.pump();

        expect(find.byType(MenuButton), findsOneWidget);
      });
    });
  });
}
