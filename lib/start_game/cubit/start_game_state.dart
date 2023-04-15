part of 'start_game_cubit.dart';

@freezed
class StartGameState with _$StartGameState {
  const factory StartGameState.menu() = _Menu;
  const factory StartGameState.play() = _Play;
  const factory StartGameState.sound() = _Sound;
  const factory StartGameState.language() = _Language;
  const factory StartGameState.howToPlay() = _HowToPlay;
  const factory StartGameState.about() = _About;
}
