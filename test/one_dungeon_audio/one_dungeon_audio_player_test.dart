// ignore_for_file: cascade_invocations

import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:one_dungeon/one_dungeon_audio/one_dungeon_audio_player.dart';

class _AudioPlayerTester {
  void playBackgroundAudio() {}
  void stopBackgroundAudio() {}
  void playSingleAudio() {}
  void preCacheSingleAudio() {}
}

class _MockAudioPlayerTester extends Mock implements _AudioPlayerTester {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late _MockAudioPlayerTester mockAudioPlayerTester;
  late OneDungeonAudioPlayer audioPlayer;

  setUpAll(() {
    mockAudioPlayerTester = _MockAudioPlayerTester();
    audioPlayer = OneDungeonAudioPlayer.test(
      playBackgroundAudio: (_, {double? volume}) async =>
          mockAudioPlayerTester.playBackgroundAudio(),
      stopBackgroundAudio: () async =>
          mockAudioPlayerTester.stopBackgroundAudio(),
      playSingleAudio: (_, {double? volume}) async =>
          mockAudioPlayerTester.playSingleAudio(),
      preCacheSingleAudio: (_) async =>
          mockAudioPlayerTester.preCacheSingleAudio(),
    );
  });

  group('OneDungeonAudioPlayer', () {
    group('sfx', () {
      test('descending plays as expected', () async {
        audioPlayer.isFirstRun = false;
        audioPlayer.isSfxActive = true;

        await audioPlayer.play(OneDungeonAudio.descending);

        verify(mockAudioPlayerTester.playSingleAudio).called(1);
      });

      test('jump plays as expected', () async {
        audioPlayer.isFirstRun = false;
        audioPlayer.isSfxActive = true;

        await audioPlayer.play(OneDungeonAudio.jump);

        verify(mockAudioPlayerTester.playSingleAudio).called(1);
      });

      test('landing plays as expected', () async {
        audioPlayer.isFirstRun = false;
        audioPlayer.isSfxActive = true;

        await audioPlayer.play(OneDungeonAudio.landing);

        verify(mockAudioPlayerTester.playSingleAudio).called(1);
      });

      test('pickUp plays as expected', () async {
        audioPlayer.isFirstRun = false;
        audioPlayer.isSfxActive = true;

        await audioPlayer.play(OneDungeonAudio.pickUp);

        verify(mockAudioPlayerTester.playSingleAudio).called(1);
      });

      test('pickUpStar plays as expected', () async {
        audioPlayer.isFirstRun = false;
        audioPlayer.isSfxActive = true;

        await audioPlayer.play(OneDungeonAudio.pickUpStar);

        verify(mockAudioPlayerTester.playSingleAudio).called(1);
      });

      test('select plays as expected', () async {
        audioPlayer.isFirstRun = false;
        audioPlayer.isSfxActive = true;

        await audioPlayer.play(OneDungeonAudio.select);

        verify(mockAudioPlayerTester.playSingleAudio).called(1);
      });

      test('success plays as expected', () async {
        audioPlayer.isFirstRun = false;
        audioPlayer.isSfxActive = true;

        await audioPlayer.play(OneDungeonAudio.success);

        verify(mockAudioPlayerTester.playSingleAudio).called(1);
      });
    });

    group('background music', () {
      test('plays as expected', () async {
        audioPlayer.isFirstRun = false;
        audioPlayer.isBackgroundMusicActive = true;

        await audioPlayer.play(OneDungeonAudio.backgroundMusic);

        verify(mockAudioPlayerTester.playBackgroundAudio).called(1);
      });

      test('stops as expected', () async {
        await audioPlayer.stop();

        verify(mockAudioPlayerTester.stopBackgroundAudio).called(1);
      });
    });
  });
}
