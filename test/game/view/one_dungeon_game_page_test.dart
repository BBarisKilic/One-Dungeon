import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../helpers/helpers.dart';

class _MockAssetsManagerCubit extends MockCubit<AssetsManagerState>
    implements AssetsManagerCubit {}

void main() {
  TestWidgetsBinding.ensureInitialized();

  late AssetsManagerCubit mockAssetsManagerCubit;

  setUpAll(() async {
    await di.initializeDependencies();
    await di.injector.unregister<OneDungeonAudioPlayer>();
    di.injector.registerSingleton<OneDungeonAudioPlayer>(TestAudioPlayer());
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

    testWidgets('keep focus on game when mouse hovers over it', (tester) async {
      arrangeState(const AssetsManagerState(assetsCount: 1, loaded: 1));
      arrangeLoad();

      await tester.pumpApp(const OneDungeonGamePage());
      await tester.pump();

      final game = di.injector<OneDungeonGame>();

      game.focusNode.unfocus();
      await tester.pump();

      expect(game.focusNode.hasFocus, isFalse);

      final gesture = await tester.createGesture(kind: PointerDeviceKind.mouse);
      await gesture.addPointer(location: Offset.zero);
      addTearDown(gesture.removePointer);

      final gameSize = game.size / 2;
      await gesture.moveTo(Offset(gameSize.x, gameSize.y));
      await tester.pump();

      expect(game.focusNode.hasFocus, isTrue);
    });
  });
}
