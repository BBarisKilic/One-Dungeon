import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

abstract class TestWidgetsBinding {
  static void ensureInitialized() {
    TestWidgetsFlutterBinding.ensureInitialized();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(
      const MethodChannel('xyz.luan/audioplayers'),
      (_) => null,
    );
  }
}
