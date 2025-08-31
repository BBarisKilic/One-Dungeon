import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/how_to_play/how_to_play.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../helpers/helpers.dart';

void main() {
  TestWidgetsBinding.ensureInitialized();

  setUpAll(() async {
    await injectDependencies();
    await getIt.unregister<OneDungeonAudioPlayer>();
    getIt.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
  });

  tearDownAll(() async {
    await getIt.reset();
  });

  group('HowToPlayDialog', () {
    testWidgets('renders HowToPlayDialog', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(const HowToPlayDialog());
        await tester.pump();

        expect(find.byType(MenuButton), findsOneWidget);
      });
    });
  });
}
