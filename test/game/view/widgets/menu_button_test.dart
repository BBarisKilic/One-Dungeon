import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    di.injector.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());

    await di.initializeDependencies();
  });

  tearDownAll(() async {
    await di.injector.reset();
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
