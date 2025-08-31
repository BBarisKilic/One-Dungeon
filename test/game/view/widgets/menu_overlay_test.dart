import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../../helpers/helpers.dart';

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

  group('MenuOverlay', () {
    testWidgets('renders MenuOverlay', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(const MenuOverlay());
        await tester.pump();

        expect(find.byType(MenuButton), findsNWidgets(5));
      });
    });
  });
}
