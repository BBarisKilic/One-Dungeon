import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';
import 'package:one_dungeon/bootstrap.dart';

import '../../helpers/helpers.dart';

class _MockAssetsManagerCubit extends MockCubit<AssetsManagerState>
    implements AssetsManagerCubit {}

void main() {
  TestWidgetsBinding.ensureInitialized();

  late AssetsManagerCubit mockAssetsManagerCubit;

  setUpAll(() async {
    mockAssetsManagerCubit = _MockAssetsManagerCubit();

    await injectDependencies();
    await getIt.unregister<AssetsManagerCubit>();

    getIt.registerFactory<AssetsManagerCubit>(() => mockAssetsManagerCubit);
  });

  tearDownAll(() async {
    await getIt.reset();
  });

  void arrangeState(AssetsManagerState state) {
    when(() => mockAssetsManagerCubit.state).thenReturn(state);
  }

  group('LoadingPage', () {
    testWidgets('renders LinearProgressIndicator', (tester) async {
      await tester.runAsync(() async {
        await tester.pumpApp(const LoadingPage(progress: 0));

        expect(find.byType(LinearProgressIndicator), findsOneWidget);
      });
    });

    testWidgets('shows correct progress', (tester) async {
      await tester.runAsync(() async {
        arrangeState(const AssetsManagerState(assetsCount: 2, loaded: 1));

        await tester.pumpApp(
          LoadingPage(progress: mockAssetsManagerCubit.state.progress),
        );

        final finder = find.byType(LinearProgressIndicator);
        final linearProgressIndicator =
            finder.evaluate().single.widget as LinearProgressIndicator;

        expect(linearProgressIndicator.value, equals(0.5));
      });
    });
  });
}
