import 'package:flutter/material.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/l10n/l10n.dart';

/// {@template loading_page}
/// A loading page that displays a loading image and a progress bar.
/// {@endtemplate}
class LoadingPage extends StatelessWidget {
  /// {@macro loading_page}
  const LoadingPage({
    required double progress,
    super.key,
  }) : _progress = progress;

  final double _progress;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(GameAssets.loadingImage),
            const SizedBox(height: GameLayout.longVerticalSpace),
            Text(
              l10n.loadingText,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: GameLayout.verticalSpace),
            SizedBox(
              width: GameLayout.generalWidth,
              child: LinearProgressIndicator(
                value: _progress,
                backgroundColor: Colors.grey,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
