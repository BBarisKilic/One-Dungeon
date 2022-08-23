import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:one_dungeon/game/game.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio.dart';

part 'assets_manager_state.dart';

class AssetsManagerCubit extends Cubit<AssetsManagerState> {
  AssetsManagerCubit({
    required OneDungeonGame game,
    required OneDungeonAudioPlayer audioPlayer,
  })  : _game = game,
        _audioPlayer = audioPlayer,
        super(const AssetsManagerState.initial());

  final OneDungeonGame _game;
  final OneDungeonAudioPlayer _audioPlayer;
  final _loadables = <Future<void> Function()>[];

  Future<void> load() async {
    await Future<void>.delayed(const Duration(seconds: 1));

    _loadables.addAll([
      ..._game.preLoadAssets(),
      ..._audioPlayer.preLoadAudios(_audioPlayer.preCacheSingleAudio),
    ]);

    if (!isClosed) emit(state.copyWith(assetsCount: _loadables.length));

    unawaited(_triggerLoad());
  }

  Future<void> _triggerLoad() async {
    if (_loadables.isEmpty) return;

    await Future<void>.delayed(const Duration(milliseconds: 100));

    final loadable = _loadables.removeAt(0);
    await loadable();

    unawaited(_triggerLoad());

    if (!isClosed) emit(state.copyWith(loaded: state.loaded + 1));
  }
}
