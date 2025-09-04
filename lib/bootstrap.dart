import 'dart:async';
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flame/flame.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';
import 'package:one_dungeon/start_game/start_game.dart';

/// An instance of GetIt, used for dependency injection throughout the app.
final GetIt getIt = GetIt.instance;

/// A custom [BlocObserver] that logs state changes and errors.
class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

/// Bootstraps the application by initializing necessary services and running
/// the provided [builder] function to create the root widget.
Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = AppBlocObserver();

  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait(
    [
      Flame.device.fullScreen(),
      Flame.device.setLandscape(),
      injectDependencies(),
    ],
  ).onError((error, stackTrace) => [log('$error', stackTrace: stackTrace)]);

  runApp(await builder());
}

/// Injects dependencies into the GetIt service locator.
Future<void> injectDependencies() async {
  getIt
    ..registerSingleton<OneDungeonAudioPlayer>(OneDungeonAudioPlayer())
    ..registerSingleton<OneDungeonGame>(OneDungeonGame())
    ..registerFactory<AssetsManagerCubit>(
      () => AssetsManagerCubit(
        game: getIt<OneDungeonGame>(),
        audioPlayer: getIt<OneDungeonAudioPlayer>(),
      ),
    )
    ..registerFactory<StartGameCubit>(StartGameCubit.new);
}
