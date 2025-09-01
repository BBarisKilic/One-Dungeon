import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_de.dart' deferred as app_localizations_de;
import 'app_localizations_en.dart' deferred as app_localizations_en;

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('de'),
    Locale('en')
  ];

  /// The name of the game
  ///
  /// In en, this message translates to:
  /// **'One Dungeon'**
  String get gameTitle;

  /// Text that will be shown on Loading Page
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loadingText;

  /// Text that will be shown on Menu Overlay
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get playText;

  /// Text that will be shown on Menu Overlay
  ///
  /// In en, this message translates to:
  /// **'Sound'**
  String get soundText;

  /// Text that will be shown on Menu Overlay
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get languageText;

  /// Text that will be shown on Menu Overlay
  ///
  /// In en, this message translates to:
  /// **'How To Play'**
  String get howToPlayText;

  /// Text that will be shown on Sound Settings Dialog
  ///
  /// In en, this message translates to:
  /// **'In the game, we have the character named “Dundee”. You can move him with the buttons W, A and D. \n\n\n\nW : jump \n\nA : left move \n\nD : right move \n\n\n\nThe goal in the game is to pass the Dungeon as soon as possible and get the highest score. Collected stars contribute to raising the endgame score. Come on, we\'ll be waiting for you at the end of the Dungeon!'**
  String get howToPlayDetailText;

  /// Text that will be shown on Menu Overlay
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutText;

  /// Text that will be shown on Dialog
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get backText;

  /// Text that will be shown on About Dialog
  ///
  /// In en, this message translates to:
  /// **'One Dungeon developed during the Midyear 2022 Flame Game Jam. It is a 1-Bit style game, consists of one level, runs only on one platform, and, lastly, it is a one dungeon game.\n\nAre you interested in developing a game more than playing a game? Then do not hesitate to check out the GitHub repository of the game. One Dungeon is open source and available publicly.\n\nThe game is powered by Flame Engine and Flutter. Flame is a minimalist Flutter game engine that provides a nice set of somewhat independent modules you can choose.\n\nIn the source code, you will see tested and %100 covered clean code. The project has been created using Very Good CLI. Also used Flame Behaviors package that applies separation of concerns to game logic in the form of Entities and Behaviors. Other packages worth mentioning are Bloc, Equatable, Freezed, GetIt and Mocktail.\n\nLastly,  One Dungeon supports localizations, and English and German languages are already available.'**
  String get aboutDetailText;

  /// Text that will be shown on Replay Dialog
  ///
  /// In en, this message translates to:
  /// **'Game over!'**
  String get gameOverText;

  /// Text that will be shown on Replay Dialog
  ///
  /// In en, this message translates to:
  /// **'Your score:'**
  String get yourScoreText;

  /// Text that will be shown on Replay Dialog
  ///
  /// In en, this message translates to:
  /// **'Replay'**
  String get replayText;

  /// Text that will be shown on Replay Dialog
  ///
  /// In en, this message translates to:
  /// **'Exit to Menu'**
  String get exitToMenuText;

  /// Text that will be shown on Sound Settings Dialog
  ///
  /// In en, this message translates to:
  /// **'On'**
  String get onText;

  /// Text that will be shown on Sound Settings Dialog
  ///
  /// In en, this message translates to:
  /// **'Off'**
  String get offText;

  /// Text that will be shown on Sound Settings Dialog
  ///
  /// In en, this message translates to:
  /// **'Music:'**
  String get backgroundMusicText;

  /// Text that will be shown on Sound Settings Dialog
  ///
  /// In en, this message translates to:
  /// **'SFX:'**
  String get sfxText;

  /// Text that will be shown in Time Sprite
  ///
  /// In en, this message translates to:
  /// **'Time:'**
  String get timeText;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return lookupAppLocalizations(locale);
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['de', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

Future<AppLocalizations> lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'de':
      return app_localizations_de
          .loadLibrary()
          .then((dynamic _) => app_localizations_de.AppLocalizationsDe());
    case 'en':
      return app_localizations_en
          .loadLibrary()
          .then((dynamic _) => app_localizations_en.AppLocalizationsEn());
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
