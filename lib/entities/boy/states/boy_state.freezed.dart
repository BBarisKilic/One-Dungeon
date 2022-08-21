// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'boy_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$BoyState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() jump,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? jump,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? jump,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Run value) run,
    required TResult Function(_Jump value) jump,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Run value)? run,
    TResult Function(_Jump value)? jump,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Run value)? run,
    TResult Function(_Jump value)? jump,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoyStateCopyWith<$Res> {
  factory $BoyStateCopyWith(BoyState value, $Res Function(BoyState) then) =
      _$BoyStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$BoyStateCopyWithImpl<$Res> implements $BoyStateCopyWith<$Res> {
  _$BoyStateCopyWithImpl(this._value, this._then);

  final BoyState _value;
  // ignore: unused_field
  final $Res Function(BoyState) _then;
}

/// @nodoc
abstract class _$$_IdleCopyWith<$Res> {
  factory _$$_IdleCopyWith(_$_Idle value, $Res Function(_$_Idle) then) =
      __$$_IdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_IdleCopyWithImpl<$Res> extends _$BoyStateCopyWithImpl<$Res>
    implements _$$_IdleCopyWith<$Res> {
  __$$_IdleCopyWithImpl(_$_Idle _value, $Res Function(_$_Idle) _then)
      : super(_value, (v) => _then(v as _$_Idle));

  @override
  _$_Idle get _value => super._value as _$_Idle;
}

/// @nodoc

class _$_Idle implements _Idle {
  const _$_Idle();

  @override
  String toString() {
    return 'BoyState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() jump,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? jump,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? jump,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Run value) run,
    required TResult Function(_Jump value) jump,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Run value)? run,
    TResult Function(_Jump value)? jump,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Run value)? run,
    TResult Function(_Jump value)? jump,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }
}

abstract class _Idle implements BoyState {
  const factory _Idle() = _$_Idle;
}

/// @nodoc
abstract class _$$_RunCopyWith<$Res> {
  factory _$$_RunCopyWith(_$_Run value, $Res Function(_$_Run) then) =
      __$$_RunCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_RunCopyWithImpl<$Res> extends _$BoyStateCopyWithImpl<$Res>
    implements _$$_RunCopyWith<$Res> {
  __$$_RunCopyWithImpl(_$_Run _value, $Res Function(_$_Run) _then)
      : super(_value, (v) => _then(v as _$_Run));

  @override
  _$_Run get _value => super._value as _$_Run;
}

/// @nodoc

class _$_Run implements _Run {
  const _$_Run();

  @override
  String toString() {
    return 'BoyState.run()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Run);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() jump,
  }) {
    return run();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? jump,
  }) {
    return run?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? jump,
    required TResult orElse(),
  }) {
    if (run != null) {
      return run();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Run value) run,
    required TResult Function(_Jump value) jump,
  }) {
    return run(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Run value)? run,
    TResult Function(_Jump value)? jump,
  }) {
    return run?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Run value)? run,
    TResult Function(_Jump value)? jump,
    required TResult orElse(),
  }) {
    if (run != null) {
      return run(this);
    }
    return orElse();
  }
}

abstract class _Run implements BoyState {
  const factory _Run() = _$_Run;
}

/// @nodoc
abstract class _$$_JumpCopyWith<$Res> {
  factory _$$_JumpCopyWith(_$_Jump value, $Res Function(_$_Jump) then) =
      __$$_JumpCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_JumpCopyWithImpl<$Res> extends _$BoyStateCopyWithImpl<$Res>
    implements _$$_JumpCopyWith<$Res> {
  __$$_JumpCopyWithImpl(_$_Jump _value, $Res Function(_$_Jump) _then)
      : super(_value, (v) => _then(v as _$_Jump));

  @override
  _$_Jump get _value => super._value as _$_Jump;
}

/// @nodoc

class _$_Jump implements _Jump {
  const _$_Jump();

  @override
  String toString() {
    return 'BoyState.jump()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Jump);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function() run,
    required TResult Function() jump,
  }) {
    return jump();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? jump,
  }) {
    return jump?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function()? run,
    TResult Function()? jump,
    required TResult orElse(),
  }) {
    if (jump != null) {
      return jump();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Idle value) idle,
    required TResult Function(_Run value) run,
    required TResult Function(_Jump value) jump,
  }) {
    return jump(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Run value)? run,
    TResult Function(_Jump value)? jump,
  }) {
    return jump?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Idle value)? idle,
    TResult Function(_Run value)? run,
    TResult Function(_Jump value)? jump,
    required TResult orElse(),
  }) {
    if (jump != null) {
      return jump(this);
    }
    return orElse();
  }
}

abstract class _Jump implements BoyState {
  const factory _Jump() = _$_Jump;
}
