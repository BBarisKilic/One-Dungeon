import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;

import '../../helpers/helpers.dart';

class _MockAssetsManagerCubit extends MockCubit<AssetsManagerState>
    implements AssetsManagerCubit {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockAssetsManagerCubit mockAssetsManagerCubit;

  setUpAll(() async {
    await di.initializeDependencies();
  });

  setUp(() async {
    mockAssetsManagerCubit = _MockAssetsManagerCubit();

    await di.injector.unregister<AssetsManagerCubit>();

    di.injector
        .registerFactory<AssetsManagerCubit>(() => mockAssetsManagerCubit);
  });

  tearDown(() async {
    await mockAssetsManagerCubit.close();
  });

  tearDownAll(() async {
    await di.injector.reset();
  });

  void arrangeState(AssetsManagerState state) {
    when(() => mockAssetsManagerCubit.state).thenReturn(state);
  }

  void arrangeLoad() {
    when(() => mockAssetsManagerCubit.load()).thenAnswer((_) async {});
  }

  group('OneDungeonGamePage', () {
    testWidgets('renders LoadingPage', (tester) async {
      await tester.runAsync(() async {
        arrangeState(const AssetsManagerState.initial());
        arrangeLoad();

        await tester.pumpApp(const OneDungeonGamePage());
        await tester.pump();

        expect(find.byType(LoadingPage), findsOneWidget);
      });
    });

    testWidgets('renders OneDungeonGameLoadedView', (tester) async {
      await tester.runAsync(() async {
        arrangeState(const AssetsManagerState(assetsCount: 1, loaded: 1));
        arrangeLoad();

        await tester.pumpApp(const OneDungeonGamePage());
        await tester.pump();

        expect(find.byType(OneDungeonGameLoadedView), findsOneWidget);
      });
    });
  });
}
