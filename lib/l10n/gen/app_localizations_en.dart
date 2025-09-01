// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get gameTitle => 'One Dungeon';

  @override
  String get loadingText => 'Loading...';

  @override
  String get playText => 'Play';

  @override
  String get soundText => 'Sound';

  @override
  String get languageText => 'Language';

  @override
  String get howToPlayText => 'How To Play';

  @override
  String get howToPlayDetailText =>
      'In the game, we have the character named “Dundee”. You can move him with the buttons W, A and D. \n\n\n\nW : jump \n\nA : left move \n\nD : right move \n\n\n\nThe goal in the game is to pass the Dungeon as soon as possible and get the highest score. Collected stars contribute to raising the endgame score. Come on, we\'ll be waiting for you at the end of the Dungeon!';

  @override
  String get aboutText => 'About';

  @override
  String get backText => 'Back';

  @override
  String get aboutDetailText =>
      'One Dungeon developed during the Midyear 2022 Flame Game Jam. It is a 1-Bit style game, consists of one level, runs only on one platform, and, lastly, it is a one dungeon game.\n\nAre you interested in developing a game more than playing a game? Then do not hesitate to check out the GitHub repository of the game. One Dungeon is open source and available publicly.\n\nThe game is powered by Flame Engine and Flutter. Flame is a minimalist Flutter game engine that provides a nice set of somewhat independent modules you can choose.\n\nIn the source code, you will see tested and %100 covered clean code. The project has been created using Very Good CLI. Also used Flame Behaviors package that applies separation of concerns to game logic in the form of Entities and Behaviors. Other packages worth mentioning are Bloc, Equatable, Freezed, GetIt and Mocktail.\n\nLastly,  One Dungeon supports localizations, and English and German languages are already available.';

  @override
  String get gameOverText => 'Game over!';

  @override
  String get yourScoreText => 'Your score:';

  @override
  String get replayText => 'Replay';

  @override
  String get exitToMenuText => 'Exit to Menu';

  @override
  String get onText => 'On';

  @override
  String get offText => 'Off';

  @override
  String get backgroundMusicText => 'Music:';

  @override
  String get sfxText => 'SFX:';

  @override
  String get timeText => 'Time:';
}
