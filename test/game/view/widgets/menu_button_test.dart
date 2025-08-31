import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
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

  group('MenuButton', () {
    testWidgets('renders MenuButton', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(
          MenuButton(
            onPressed: () {},
            text: '',
          ),
        );
        await tester.pump();

        expect(find.byType(ElevatedButton), findsOneWidget);
      });
    });

    testWidgets('buttons works as expected', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(
          MenuButton(
            onPressed: () {},
            text: '',
          ),
        );

        final gesture =
            await tester.createGesture(kind: PointerDeviceKind.mouse);
        await gesture.addPointer(location: Offset.zero);
        addTearDown(gesture.removePointer);
        await tester.pump();
        await gesture.moveTo(tester.getCenter(find.byType(ElevatedButton)));
        await tester.pumpAndSettle();

        final finder = find.byType(ElevatedButton);
        final widget = tester.widget(finder) as ElevatedButton;

        expect(widget.child, const TypeMatcher<Text>());
      });
    });
  });
}
