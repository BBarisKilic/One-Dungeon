import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/app/app.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() async {
    await di.initializeDependencies();
  });

  tearDown(() async {
    await di.injector.reset();
  });

  group('App', () {
    testWidgets('renders OneDungeonGamePage', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpWidget(const App());
        await tester.pump();

        expect(find.byType(OneDungeonGamePage), findsOneWidget);
      });
    });
  });
}
