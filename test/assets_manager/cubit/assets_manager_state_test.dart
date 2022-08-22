import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';

void main() {
  group('AssetsManagerState', () {
    test('can be instantiated', () {
      expect(const AssetsManagerState.initial(), isNotNull);
    });

    test('has the correct initial state', () {
      expect(
        const AssetsManagerState.initial(),
        equals(
          const AssetsManagerState(assetsCount: 0, loaded: 0),
        ),
      );
    });

    group('progress', () {
      test('returns 0 when no asset is loaded', () {
        expect(
          const AssetsManagerState(assetsCount: 2, loaded: 0).progress,
          equals(0),
        );
      });

      test('returns the correct value when some assets are loaded', () {
        expect(
          const AssetsManagerState(assetsCount: 2, loaded: 1).progress,
          equals(0.5),
        );
      });

      test('returns 1 when all assets are loaded', () {
        expect(
          const AssetsManagerState(assetsCount: 3, loaded: 3).progress,
          equals(1),
        );
      });
    });

    group('copyWith', () {
      test('returns a copy with the updated assetsCount', () {
        expect(
          const AssetsManagerState(assetsCount: 0, loaded: 0)
              .copyWith(assetsCount: 4),
          equals(const AssetsManagerState(assetsCount: 4, loaded: 0)),
        );
      });

      test('returns a copy with the updated loaded', () {
        expect(
          const AssetsManagerState(assetsCount: 5, loaded: 1)
              .copyWith(loaded: 2),
          equals(const AssetsManagerState(assetsCount: 5, loaded: 2)),
        );
      });
    });

    test('supports value comparison', () {
      expect(
        const AssetsManagerState(assetsCount: 0, loaded: 0),
        equals(const AssetsManagerState(assetsCount: 0, loaded: 0)),
      );

      expect(
        const AssetsManagerState(assetsCount: 1, loaded: 0),
        isNot(equals(const AssetsManagerState(assetsCount: 0, loaded: 0))),
      );
    });
  });
}
