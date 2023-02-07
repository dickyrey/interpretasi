// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_in_with_google_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignInWithGoogleActorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignIn value) signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignIn value)? signIn,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignIn value)? signIn,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithGoogleActorEventCopyWith<$Res> {
  factory $SignInWithGoogleActorEventCopyWith(SignInWithGoogleActorEvent value,
          $Res Function(SignInWithGoogleActorEvent) then) =
      _$SignInWithGoogleActorEventCopyWithImpl<$Res,
          SignInWithGoogleActorEvent>;
}

/// @nodoc
class _$SignInWithGoogleActorEventCopyWithImpl<$Res,
        $Val extends SignInWithGoogleActorEvent>
    implements $SignInWithGoogleActorEventCopyWith<$Res> {
  _$SignInWithGoogleActorEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_SignInCopyWith<$Res> {
  factory _$$_SignInCopyWith(_$_SignIn value, $Res Function(_$_SignIn) then) =
      __$$_SignInCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInCopyWithImpl<$Res>
    extends _$SignInWithGoogleActorEventCopyWithImpl<$Res, _$_SignIn>
    implements _$$_SignInCopyWith<$Res> {
  __$$_SignInCopyWithImpl(_$_SignIn _value, $Res Function(_$_SignIn) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignIn implements _SignIn {
  const _$_SignIn();

  @override
  String toString() {
    return 'SignInWithGoogleActorEvent.signIn()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignIn);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signIn,
  }) {
    return signIn();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? signIn,
  }) {
    return signIn?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SignIn value) signIn,
  }) {
    return signIn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SignIn value)? signIn,
  }) {
    return signIn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SignIn value)? signIn,
    required TResult orElse(),
  }) {
    if (signIn != null) {
      return signIn(this);
    }
    return orElse();
  }
}

abstract class _SignIn implements SignInWithGoogleActorEvent {
  const factory _SignIn() = _$_SignIn;
}

/// @nodoc
mixin _$SignInWithGoogleActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInProgress,
    required TResult Function(String message) signInFailure,
    required TResult Function() signInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInProgress,
    TResult? Function(String message)? signInFailure,
    TResult? Function()? signInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInProgress,
    TResult Function(String message)? signInFailure,
    TResult Function()? signInSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInProgress value) signInProgress,
    required TResult Function(_SignInFailure value) signInFailure,
    required TResult Function(_SignInSuccess value) signInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SignInProgress value)? signInProgress,
    TResult? Function(_SignInFailure value)? signInFailure,
    TResult? Function(_SignInSuccess value)? signInSuccess,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInProgress value)? signInProgress,
    TResult Function(_SignInFailure value)? signInFailure,
    TResult Function(_SignInSuccess value)? signInSuccess,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignInWithGoogleActorStateCopyWith<$Res> {
  factory $SignInWithGoogleActorStateCopyWith(SignInWithGoogleActorState value,
          $Res Function(SignInWithGoogleActorState) then) =
      _$SignInWithGoogleActorStateCopyWithImpl<$Res,
          SignInWithGoogleActorState>;
}

/// @nodoc
class _$SignInWithGoogleActorStateCopyWithImpl<$Res,
        $Val extends SignInWithGoogleActorState>
    implements $SignInWithGoogleActorStateCopyWith<$Res> {
  _$SignInWithGoogleActorStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitialCopyWith<$Res> {
  factory _$$_InitialCopyWith(
          _$_Initial value, $Res Function(_$_Initial) then) =
      __$$_InitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitialCopyWithImpl<$Res>
    extends _$SignInWithGoogleActorStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'SignInWithGoogleActorState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInProgress,
    required TResult Function(String message) signInFailure,
    required TResult Function() signInSuccess,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInProgress,
    TResult? Function(String message)? signInFailure,
    TResult? Function()? signInSuccess,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInProgress,
    TResult Function(String message)? signInFailure,
    TResult Function()? signInSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInProgress value) signInProgress,
    required TResult Function(_SignInFailure value) signInFailure,
    required TResult Function(_SignInSuccess value) signInSuccess,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SignInProgress value)? signInProgress,
    TResult? Function(_SignInFailure value)? signInFailure,
    TResult? Function(_SignInSuccess value)? signInSuccess,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInProgress value)? signInProgress,
    TResult Function(_SignInFailure value)? signInFailure,
    TResult Function(_SignInSuccess value)? signInSuccess,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SignInWithGoogleActorState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_SignInProgressCopyWith<$Res> {
  factory _$$_SignInProgressCopyWith(
          _$_SignInProgress value, $Res Function(_$_SignInProgress) then) =
      __$$_SignInProgressCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInProgressCopyWithImpl<$Res>
    extends _$SignInWithGoogleActorStateCopyWithImpl<$Res, _$_SignInProgress>
    implements _$$_SignInProgressCopyWith<$Res> {
  __$$_SignInProgressCopyWithImpl(
      _$_SignInProgress _value, $Res Function(_$_SignInProgress) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInProgress implements _SignInProgress {
  const _$_SignInProgress();

  @override
  String toString() {
    return 'SignInWithGoogleActorState.signInProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignInProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInProgress,
    required TResult Function(String message) signInFailure,
    required TResult Function() signInSuccess,
  }) {
    return signInProgress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInProgress,
    TResult? Function(String message)? signInFailure,
    TResult? Function()? signInSuccess,
  }) {
    return signInProgress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInProgress,
    TResult Function(String message)? signInFailure,
    TResult Function()? signInSuccess,
    required TResult orElse(),
  }) {
    if (signInProgress != null) {
      return signInProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInProgress value) signInProgress,
    required TResult Function(_SignInFailure value) signInFailure,
    required TResult Function(_SignInSuccess value) signInSuccess,
  }) {
    return signInProgress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SignInProgress value)? signInProgress,
    TResult? Function(_SignInFailure value)? signInFailure,
    TResult? Function(_SignInSuccess value)? signInSuccess,
  }) {
    return signInProgress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInProgress value)? signInProgress,
    TResult Function(_SignInFailure value)? signInFailure,
    TResult Function(_SignInSuccess value)? signInSuccess,
    required TResult orElse(),
  }) {
    if (signInProgress != null) {
      return signInProgress(this);
    }
    return orElse();
  }
}

abstract class _SignInProgress implements SignInWithGoogleActorState {
  const factory _SignInProgress() = _$_SignInProgress;
}

/// @nodoc
abstract class _$$_SignInFailureCopyWith<$Res> {
  factory _$$_SignInFailureCopyWith(
          _$_SignInFailure value, $Res Function(_$_SignInFailure) then) =
      __$$_SignInFailureCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_SignInFailureCopyWithImpl<$Res>
    extends _$SignInWithGoogleActorStateCopyWithImpl<$Res, _$_SignInFailure>
    implements _$$_SignInFailureCopyWith<$Res> {
  __$$_SignInFailureCopyWithImpl(
      _$_SignInFailure _value, $Res Function(_$_SignInFailure) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_SignInFailure(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignInFailure implements _SignInFailure {
  const _$_SignInFailure(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SignInWithGoogleActorState.signInFailure(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignInFailure &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignInFailureCopyWith<_$_SignInFailure> get copyWith =>
      __$$_SignInFailureCopyWithImpl<_$_SignInFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInProgress,
    required TResult Function(String message) signInFailure,
    required TResult Function() signInSuccess,
  }) {
    return signInFailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInProgress,
    TResult? Function(String message)? signInFailure,
    TResult? Function()? signInSuccess,
  }) {
    return signInFailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInProgress,
    TResult Function(String message)? signInFailure,
    TResult Function()? signInSuccess,
    required TResult orElse(),
  }) {
    if (signInFailure != null) {
      return signInFailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInProgress value) signInProgress,
    required TResult Function(_SignInFailure value) signInFailure,
    required TResult Function(_SignInSuccess value) signInSuccess,
  }) {
    return signInFailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SignInProgress value)? signInProgress,
    TResult? Function(_SignInFailure value)? signInFailure,
    TResult? Function(_SignInSuccess value)? signInSuccess,
  }) {
    return signInFailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInProgress value)? signInProgress,
    TResult Function(_SignInFailure value)? signInFailure,
    TResult Function(_SignInSuccess value)? signInSuccess,
    required TResult orElse(),
  }) {
    if (signInFailure != null) {
      return signInFailure(this);
    }
    return orElse();
  }
}

abstract class _SignInFailure implements SignInWithGoogleActorState {
  const factory _SignInFailure(final String message) = _$_SignInFailure;

  String get message;
  @JsonKey(ignore: true)
  _$$_SignInFailureCopyWith<_$_SignInFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignInSuccessCopyWith<$Res> {
  factory _$$_SignInSuccessCopyWith(
          _$_SignInSuccess value, $Res Function(_$_SignInSuccess) then) =
      __$$_SignInSuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignInSuccessCopyWithImpl<$Res>
    extends _$SignInWithGoogleActorStateCopyWithImpl<$Res, _$_SignInSuccess>
    implements _$$_SignInSuccessCopyWith<$Res> {
  __$$_SignInSuccessCopyWithImpl(
      _$_SignInSuccess _value, $Res Function(_$_SignInSuccess) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignInSuccess implements _SignInSuccess {
  const _$_SignInSuccess();

  @override
  String toString() {
    return 'SignInWithGoogleActorState.signInSuccess()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignInSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() signInProgress,
    required TResult Function(String message) signInFailure,
    required TResult Function() signInSuccess,
  }) {
    return signInSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? signInProgress,
    TResult? Function(String message)? signInFailure,
    TResult? Function()? signInSuccess,
  }) {
    return signInSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? signInProgress,
    TResult Function(String message)? signInFailure,
    TResult Function()? signInSuccess,
    required TResult orElse(),
  }) {
    if (signInSuccess != null) {
      return signInSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_SignInProgress value) signInProgress,
    required TResult Function(_SignInFailure value) signInFailure,
    required TResult Function(_SignInSuccess value) signInSuccess,
  }) {
    return signInSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_SignInProgress value)? signInProgress,
    TResult? Function(_SignInFailure value)? signInFailure,
    TResult? Function(_SignInSuccess value)? signInSuccess,
  }) {
    return signInSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_SignInProgress value)? signInProgress,
    TResult Function(_SignInFailure value)? signInFailure,
    TResult Function(_SignInSuccess value)? signInSuccess,
    required TResult orElse(),
  }) {
    if (signInSuccess != null) {
      return signInSuccess(this);
    }
    return orElse();
  }
}

abstract class _SignInSuccess implements SignInWithGoogleActorState {
  const factory _SignInSuccess() = _$_SignInSuccess;
}
