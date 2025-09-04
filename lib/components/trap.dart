import 'package:one_dungeon/components/components.dart';

/// {@template trap}
/// A trap that the player must avoid.
/// {@endtemplate}
final class Trap extends Danger {
  /// {@macro trap}
  Trap({required super.size, required super.position});
}
