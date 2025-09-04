import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

part 'assets_manager_state.dart';

/// {@template assets_manager_cubit}
/// A cubit that manages the loading of assets for the game.
/// {@endtemplate}
class AssetsManagerCubit extends Cubit<AssetsManagerState> {
  /// {@macro assets_manager_cubit}
  AssetsManagerCubit({
    required OneDungeonGame game,
    required OneDungeonAudioPlayer audioPlayer,
  })  : _game = game,
        _audioPlayer = audioPlayer,
        _pendingAssetLoaders = <Future<void> Function()>[],
        super(const AssetsManagerState.initial());

  final OneDungeonGame _game;
  final OneDungeonAudioPlayer _audioPlayer;
  final List<Future<void> Function()> _pendingAssetLoaders;

  /// Loads all assets for the game.
  Future<void> load() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    _pendingAssetLoaders.addAll([
      ..._game.preLoadAssets(),
      ..._audioPlayer.preLoadAudios(_audioPlayer.preCacheSingleAudio),
    ]);

    if (!isClosed) {
      emit(state.copyWith(assetsCount: _pendingAssetLoaders.length));
    }

    unawaited(_triggerLoad());
  }

  Future<void> _triggerLoad() async {
    if (_pendingAssetLoaders.isEmpty) return;

    await Future<void>.delayed(const Duration(milliseconds: 100));

    final loadable = _pendingAssetLoaders.removeAt(0);
    await loadable();

    unawaited(_triggerLoad());

    if (!isClosed) emit(state.copyWith(loaded: state.loaded + 1));
  }
}
