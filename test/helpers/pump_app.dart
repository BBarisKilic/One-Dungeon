import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/injector.dart' as di;
import 'package:one_dungeon/l10n/l10n.dart';
import 'package:one_dungeon/start_game/start_game.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(
    Widget widget, {
    AssetsManagerCubit? assetsManagerCubit,
  }) async {
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => di.injector<AssetsManagerCubit>()..load(),
          ),
          BlocProvider(create: (_) => di.injector<StartGameCubit>()),
        ],
        child: MaterialApp(
          theme: ThemeData(
            fontFamily: 'PressStart2P',
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                primary: GameColors.kButtonColor,
                shape: const RoundedRectangleBorder(),
                minimumSize: const Size(double.infinity, 0),
                padding: const EdgeInsets.symmetric(
                  vertical: GameLayout.kButtonPadding,
                ),
              ),
            ),
          ),
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
          ],
          supportedLocales: AppLocalizations.supportedLocales,
          home: widget,
        ),
      ),
    );
  }
}
