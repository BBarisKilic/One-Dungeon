// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get gameTitle => 'One Dungeon';

  @override
  String get loadingText => 'Wird geladen...';

  @override
  String get playText => 'Spielen';

  @override
  String get soundText => 'Audio';

  @override
  String get languageText => 'Sprache';

  @override
  String get howToPlayText => 'Spielanleitung';

  @override
  String get howToPlayDetailText =>
      'In the game, we have the character named “Dundee”. You can move him with the buttons W, A and D. \n\n\n\nW : jump \n\nA : left move \n\nD : right move \n\n\n\nThe goal in the game is to pass the Dungeon as soon as possible and get the highest score. Collected stars contribute to raising the endgame score. Come on, we\'ll be waiting for you at the end of the Dungeon!';

  @override
  String get aboutText => 'Über';

  @override
  String get backText => 'Zurücklegen';

  @override
  String get aboutDetailText =>
      'One Dungeon wurde während Midyear 2022 Flame Game Jam entwickelt. One Dungeon ist ein 1-Bit Art Spiel, dass aus 2 Abschnitten besteht und nur auf einer Plattform gelaufen wird. Zuletzt ist es ein Ein-Dungeon-Spiel.\n\nSind Sie mehr daran interessiert, ein Spiel zu entwickeln, als ein Spiel zu spielen? Dann zögern Sie nicht, sich mal das GitHub-Repository des Spiels anzusehen. One Dungeon ist Open Source und öffentlich verfügbar.\n\nDas Spiel wird von Flame Engine und Flutter angetrieben. Flame ist eine minimalistische Flutter-Spiel-Engine, die eine schöne Reihe von etwas unabhängigen Modulen bietet, die Sie auswählen können.\n\nIm Quellcode sehen Sie getesteten und zu 100 % abgedeckten sauberen Code. Das Projekt wurde mit Very Good CLI erstellt. Außerdem wurde das Flame Behaviors-Paket verwendet, das die Trennung von Bedenken auf die Spiellogik in Form von Entitäten und Verhaltensweisen anwendet. Andere erwähnenswerte Pakete sind Bloc, Equatable, Freezed, GetIt, Mocktail.\n\nSchließlich unterstützt One Dungeon Lokalisierungen. Die Englische und Deutsche Sprachen sind bereits verfügbar.';

  @override
  String get gameOverText => 'Game over!';

  @override
  String get yourScoreText => 'Dein Ergebnis:';

  @override
  String get replayText => 'Wiederholen';

  @override
  String get exitToMenuText => 'Zum Menü Zurückkehren';

  @override
  String get onText => 'Ein';

  @override
  String get offText => 'Aus';

  @override
  String get backgroundMusicText => 'Musik:';

  @override
  String get sfxText => 'SFX:';

  @override
  String get timeText => 'Zeit:';
}
