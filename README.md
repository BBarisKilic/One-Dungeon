# <p align="center">One Dungeon</p>

![One Dungeon Gameplay][header_gif]

<div align="center">

[![one_dungeon][build_status_badge]][workflow_link]
![coverage][coverage_badge]
[![style: very good analysis][very_good_analysis_badge]][very_good_analysis_link]
[![License: MIT][license_badge]][license_link]

</div>

One Dungeon developed during the [Midyear 2022 Flame Game Jam][flame_game_jam_link]. It consists of one level and is a 1-Bit-style platformer game.

Playable on [GitHub][github_playable_link] and [itch.io][itch_io_playable_link] through a web browser.

---

## How to Play 🎮

In the game, we have the character named _**Dundee**_. You can move him with the buttons **W**, **A** and **D**.

**<p align="center">W : _Jump_</p>**

**<p align="center">A : _Left Move_</p>**

**<p align="center">D : _Right Move_</p>**

The goal in the game is to pass the Dungeon as soon as possible and get the highest score. Collected stars contribute to raising the endgame score. Come on, we'll be waiting for you at the end of the Dungeon!

![How to Play][how_to_play_png]

---

## Getting Started 🚀

This project contains 3 flavors:

- development
- staging
- production

To run the desired flavor either use the launch configuration in VSCode/Android Studio or use the following commands:

```sh
# Development
$ flutter run --flavor development --target lib/main_development.dart

# Staging
$ flutter run --flavor staging --target lib/main_staging.dart

# Production
$ flutter run --flavor production --target lib/main_production.dart
```

_\*One Dungeon works on Web._

![Game Play][game_play_gif]

---

## Running Tests 🧪

To run all unit and widget tests use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml coverage/lcov.info -o coverage/

# Open Coverage Report
$ open coverage/index.html
```

![Loading][loading_gif]

---

## Working with Translations 🌐

This project relies on [flutter_localizations][flutter_localizations_link] and follows the [official internationalization guide for Flutter][internationalization_link].

### Adding Strings

1. To add a new localizable string, open the `app_en.arb` file at `lib/l10n/arb/app_en.arb`.

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    }
}
```

2. Then add a new key/value and description

```arb
{
    "@@locale": "en",
    "counterAppBarTitle": "Counter",
    "@counterAppBarTitle": {
        "description": "Text shown in the AppBar of the Counter Page"
    },
    "helloWorld": "Hello World",
    "@helloWorld": {
        "description": "Hello World Text"
    }
}
```

3. Use the new string

```dart
import 'package:one_dungeon/l10n/l10n.dart';

@override
Widget build(BuildContext context) {
  final l10n = context.l10n;
  return Text(l10n.helloWorld);
}
```

### Adding Supported Locales

Update the `CFBundleLocalizations` array in the `Info.plist` at `ios/Runner/Info.plist` to include the new locale.

```xml
    ...

    <key>CFBundleLocalizations</key>
	<array>
		<string>en</string>
		<string>de</string>
	</array>

    ...
```

### Adding Translations

1. For each supported locale, add a new ARB file in `lib/l10n/arb`.

```
├── l10n
│   ├── arb
│   │   ├── app_de.arb
│   │   └── app_en.arb
```

2. Add the translated strings to each `.arb` file:

`app_en.arb`

```arb
{
    "@@locale": "en",
    "gameTitle": "One Dungeon",
    "@gameTitle": {
        "description": "The name of the game"
    }
}
```

`app_de.arb`

```arb
{
    "@@locale": "de",
    "gameTitle": "One Dungeon",
    "@gameTitle": {
        "description": "Der Name des Spiels"
    }
}
```

---

## More 📌

The game is powered by [Flame Engine][flame_engine_link] and [Flutter][flutter_link]. Flame is a minimalist Flutter game engine that provides a nice set of somewhat independent modules you can choose.

In the source code, you will see _tested_ and _%100 covered clean code_. The project has been created using [Very Good CLI][very_good_cli_link]. Also used [Flame Behaviors][flame_behaviors_link] package that applies separation of concerns to game logic in the form of _Entities_ and _Behaviors_. Other packages worth mentioning are [Bloc][bloc_link], [Equatable][equatable_link], [Freezed][freezed_link], [GetIt][get_it_link] and [Mocktail][mocktail_link].

![About][about_png]

---

## Credits 🌹

- [Monochrome Caves][monochrome_caves_link] by **Adam Saltsman**

- [Black and White 2D Character][black_and_white_character_link] by **hey_jeff**

- [Background Music and SFX][free_sfx_link] by **Kronbits**

- [Press Start 2P Font][press_start_2p_link] by **Google**

---

## Feature Requests and Bugs 🐛

Please file feature requests and bugs at the [issue tracker][issues_link].

---
## Maintainers 🏭

- [Bulent Baris Kilic][bbk_github_link]

![Game Over][game_over_png]

[coverage_badge]: coverage_badge.svg
[flutter_localizations_link]: https://api.flutter.dev/flutter/flutter_localizations/flutter_localizations-library.html
[internationalization_link]: https://flutter.dev/docs/development/accessibility-and-localization/internationalization
[license_badge]: https://img.shields.io/badge/license-MIT-blue.svg
[license_link]: https://opensource.org/licenses/MIT
[very_good_analysis_badge]: https://img.shields.io/badge/style-very_good_analysis-B22C89.svg
[very_good_analysis_link]: https://pub.dev/packages/very_good_analysis
[very_good_cli_link]: https://github.com/VeryGoodOpenSource/very_good_cli
[build_status_badge]: https://github.com/BBarisKilic/One-Dungeon/actions/workflows/main.yaml/badge.svg
[workflow_link]: https://github.com/BBarisKilic/One-Dungeon/actions/workflows/main.yaml
[header_gif]: art/gameplay_2.gif
[how_to_play_png]: art/how_to_play.png
[game_play_gif]: art/gameplay_1.gif
[loading_gif]: art/loading_page_and_menu.gif
[about_png]: art/about.png
[game_over_png]: art/game_over.png
[flame_game_jam_link]: https://itch.io/jam/2nd-flame-game-jam
[flame_engine_link]: https://flame-engine.org
[flutter_link]: https://flutter.dev
[flame_behaviors_link]: https://github.com/VeryGoodOpenSource/flame_behaviors
[bloc_link]: https://github.com/felangel/bloc/tree/master/packages/bloc
[equatable_link]: https://github.com/felangel/equatable
[freezed_link]: https://github.com/rrousselGit/freezed
[get_it_link]:https://github.com/fluttercommunity/get_it
[mocktail_link]: https://github.com/felangel/mocktail
[monochrome_caves_link]: https://adamatomic.itch.io/mc-caves
[black_and_white_character_link]: https://hey-jeff.itch.io/black-and-white-character
[free_sfx_link]: https://kronbits.itch.io/freesfx
[press_start_2p_link]: https://fonts.google.com/specimen/Press+Start+2P
[issues_link]: https://github.com/BBarisKilic/One-Dungeon/issues
[bbk_github_link]: https://github.com/BBarisKilic
[github_playable_link]: https://bbariskilic.github.io/One-Dungeon
[itch_io_playable_link]: https://bbk-games.itch.io/one-dungeon