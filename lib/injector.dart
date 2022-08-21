import 'package:get_it/get_it.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';
import 'package:one_dungeon/start_game/cubit/start_game_cubit.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector
    ..registerLazySingleton<OneDungeonAudioPlayer>(OneDungeonAudioPlayer.new)
    ..registerLazySingleton<OneDungeonGame>(
      () => OneDungeonGame(audioPlayer: injector()),
    )
    ..registerFactory<AssetsManagerCubit>(
      () => AssetsManagerCubit(
        game: injector(),
        audioPlayer: injector(),
      ),
    )
    ..registerFactory<StartGameCubit>(StartGameCubit.new);
}
