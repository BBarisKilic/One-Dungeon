import 'package:flutter/material.dart';
import 'package:one_dungeon/constants/constants.dart';
import 'package:one_dungeon/l10n/l10n.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key, required double progress})
      : _progress = progress;

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
            Image.asset(GameAssets.kLoadingImage),
            const SizedBox(height: GameLayout.kLongVerticalSpace),
            Text(
              l10n.loadingText,
              style: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: GameLayout.kVerticalSpace),
            SizedBox(
              width: GameLayout.kGeneralWidth,
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
