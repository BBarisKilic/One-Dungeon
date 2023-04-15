import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_game_cubit.freezed.dart';
part 'start_game_state.dart';

class StartGameCubit extends Cubit<StartGameState> {
  StartGameCubit() : super(const StartGameState.menu());

  void onPlayPressed() {
    emit(const StartGameState.play());
    _reset();
  }

  void onSoundPressed() {
    emit(const StartGameState.sound());
    _reset();
  }

  void onLanguagePressed() {
    emit(const StartGameState.language());
    _reset();
  }

  void onHowToPlayPressed() {
    emit(const StartGameState.howToPlay());
    _reset();
  }

  void onAboutPressed() {
    emit(const StartGameState.about());
    _reset();
  }

  void _reset() => emit(const StartGameState.menu());
}
