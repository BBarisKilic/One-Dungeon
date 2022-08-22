import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

import '../../helpers/helpers.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late TestGame game;
  late OneDungeonAudioPlayer audioPlayer;
  late AssetsManagerCubit assetsManagerCubit;

  setUpAll(() async {
    game = TestGame();
    audioPlayer = OneDungeonAudioPlayer.test(
      playBackgroundAudio: (_, {double? volume}) async {},
      stopBackgroundAudio: () async {},
      playSingleAudio: (_, {double? volume}) async {},
      preCacheSingleAudio: (_) async {},
    );
    assetsManagerCubit =
        AssetsManagerCubit(game: game, audioPlayer: audioPlayer);
  });

  tearDownAll(() {
    assetsManagerCubit.close();
  });

  group('AssetsManagerCubit', () {
    test('initial state has 0 assetsCount', () {
      expect(assetsManagerCubit.state.assetsCount, equals(0));
    });

    test('initial state has 0 loaded', () {
      expect(assetsManagerCubit.state.loaded, equals(0));
    });

    test('initial state has 0 progress', () {
      expect(assetsManagerCubit.state.progress, equals(0));
    });

    test('initial state is loading assets', () {
      expect(assetsManagerCubit.state.isLoading, isTrue);
    });

    blocTest<AssetsManagerCubit, AssetsManagerState>(
      'loads all assets',
      build: () => assetsManagerCubit,
      act: (cubit) async => cubit.load(),
      wait: const Duration(seconds: 2),
      expect: () => const [
        AssetsManagerState(assetsCount: 13, loaded: 0),
        AssetsManagerState(assetsCount: 13, loaded: 1),
        AssetsManagerState(assetsCount: 13, loaded: 2),
        AssetsManagerState(assetsCount: 13, loaded: 3),
        AssetsManagerState(assetsCount: 13, loaded: 4),
        AssetsManagerState(assetsCount: 13, loaded: 5),
        AssetsManagerState(assetsCount: 13, loaded: 6),
        AssetsManagerState(assetsCount: 13, loaded: 7),
        AssetsManagerState(assetsCount: 13, loaded: 8),
        AssetsManagerState(assetsCount: 13, loaded: 9),
        AssetsManagerState(assetsCount: 13, loaded: 10),
        AssetsManagerState(assetsCount: 13, loaded: 11),
        AssetsManagerState(assetsCount: 13, loaded: 12),
        AssetsManagerState(assetsCount: 13, loaded: 13),
      ],
    );
  });
}
