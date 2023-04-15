import 'package:get_it/get_it.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';
import 'package:one_dungeon/start_game/start_game.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector
    ..registerSingleton<OneDungeonAudioPlayer>(OneDungeonAudioPlayer())
    ..registerSingleton<OneDungeonGame>(OneDungeonGame())
    ..registerFactory<AssetsManagerCubit>(
      () => AssetsManagerCubit(
        game: injector(),
        audioPlayer: injector(),
      ),
    )
    ..registerFactory<StartGameCubit>(StartGameCubit.new);
}
