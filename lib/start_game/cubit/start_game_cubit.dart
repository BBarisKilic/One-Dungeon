import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'start_game_state.dart';
part 'start_game_cubit.freezed.dart';

class StartGameCubit extends Cubit<StartGameState> {
  StartGameCubit() : super(const StartGameState.initial());

  void onPlayPressed() => emit(const StartGameState.play());

  void onSoundPressed() => emit(const StartGameState.sound());

  void onLanguagePressed() => emit(const StartGameState.language());

  void onHowToPlayPressed() => emit(const StartGameState.howToPlay());

  void onAboutPressed() => emit(const StartGameState.about());

  void setBackToInitial() => emit(const StartGameState.initial());
}
