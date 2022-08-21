import 'package:freezed_annotation/freezed_annotation.dart';

part 'boy_state.freezed.dart';

@freezed
abstract class BoyState with _$BoyState {
  const factory BoyState.idle() = _Idle;
  const factory BoyState.run() = _Run;
  const factory BoyState.jump() = _Jump;
}
