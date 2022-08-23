import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/sound/sound.dart';
import 'package:sharp_toggle_switch/sharp_toggle_switch.dart';

import '../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await di.initializeDependencies();
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  group('SoundSettingsDialog', () {
    testWidgets('renders SoundSettingsDialog', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(const SoundSettingsDialog());
        await tester.pump();

        expect(find.byType(SharpToggleSwitch), findsNWidgets(2));
      });
    });
  });
}
