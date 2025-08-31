part of 'start_game_cubit.dart';

@freezed
sealed class StartGameState with _$StartGameState {
  const factory StartGameState.menu() = Menu;
  const factory StartGameState.play() = Play;
  const factory StartGameState.sound() = Sound;
  const factory StartGameState.language() = Language;
  const factory StartGameState.howToPlay() = HowToPlay;
  const factory StartGameState.about() = About;
}
