import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:one_dungeon/assets_manager/assets_manager.dart';
import 'package:one_dungeon/bootstrap.dart';
import 'package:one_dungeon/l10n/l10n.dart';
import 'package:one_dungeon/start_game/start_game.dart';

extension PumpApp on WidgetTester {
  Future<void> pumpApp(Widget widget) async {
    return pumpWidget(
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (_) => getIt<AssetsManagerCubit>()..load(),
          ),
          BlocProvider(create: (_) => getIt<StartGameCubit>()),
        ],
        child: MaterialApp(
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
