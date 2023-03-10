// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'email_verification_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$EmailVerificationFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onFinished,
    required TResult Function(CountdownController controller) startTimeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onFinished,
    TResult? Function(CountdownController controller)? startTimeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onFinished,
    TResult Function(CountdownController controller)? startTimeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnFinished value) onFinished,
    required TResult Function(_StartTimeOut value) startTimeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnFinished value)? onFinished,
    TResult? Function(_StartTimeOut value)? startTimeOut,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnFinished value)? onFinished,
    TResult Function(_StartTimeOut value)? startTimeOut,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationFormEventCopyWith<$Res> {
  factory $EmailVerificationFormEventCopyWith(EmailVerificationFormEvent value,
          $Res Function(EmailVerificationFormEvent) then) =
      _$EmailVerificationFormEventCopyWithImpl<$Res,
          EmailVerificationFormEvent>;
}

/// @nodoc
class _$EmailVerificationFormEventCopyWithImpl<$Res,
        $Val extends EmailVerificationFormEvent>
    implements $EmailVerificationFormEventCopyWith<$Res> {
  _$EmailVerificationFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_OnFinishedCopyWith<$Res> {
  factory _$$_OnFinishedCopyWith(
          _$_OnFinished value, $Res Function(_$_OnFinished) then) =
      __$$_OnFinishedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_OnFinishedCopyWithImpl<$Res>
    extends _$EmailVerificationFormEventCopyWithImpl<$Res, _$_OnFinished>
    implements _$$_OnFinishedCopyWith<$Res> {
  __$$_OnFinishedCopyWithImpl(
      _$_OnFinished _value, $Res Function(_$_OnFinished) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_OnFinished implements _OnFinished {
  const _$_OnFinished();

  @override
  String toString() {
    return 'EmailVerificationFormEvent.onFinished()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_OnFinished);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onFinished,
    required TResult Function(CountdownController controller) startTimeOut,
  }) {
    return onFinished();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onFinished,
    TResult? Function(CountdownController controller)? startTimeOut,
  }) {
    return onFinished?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onFinished,
    TResult Function(CountdownController controller)? startTimeOut,
    required TResult orElse(),
  }) {
    if (onFinished != null) {
      return onFinished();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnFinished value) onFinished,
    required TResult Function(_StartTimeOut value) startTimeOut,
  }) {
    return onFinished(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnFinished value)? onFinished,
    TResult? Function(_StartTimeOut value)? startTimeOut,
  }) {
    return onFinished?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnFinished value)? onFinished,
    TResult Function(_StartTimeOut value)? startTimeOut,
    required TResult orElse(),
  }) {
    if (onFinished != null) {
      return onFinished(this);
    }
    return orElse();
  }
}

abstract class _OnFinished implements EmailVerificationFormEvent {
  const factory _OnFinished() = _$_OnFinished;
}

/// @nodoc
abstract class _$$_StartTimeOutCopyWith<$Res> {
  factory _$$_StartTimeOutCopyWith(
          _$_StartTimeOut value, $Res Function(_$_StartTimeOut) then) =
      __$$_StartTimeOutCopyWithImpl<$Res>;
  @useResult
  $Res call({CountdownController controller});
}

/// @nodoc
class __$$_StartTimeOutCopyWithImpl<$Res>
    extends _$EmailVerificationFormEventCopyWithImpl<$Res, _$_StartTimeOut>
    implements _$$_StartTimeOutCopyWith<$Res> {
  __$$_StartTimeOutCopyWithImpl(
      _$_StartTimeOut _value, $Res Function(_$_StartTimeOut) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? controller = null,
  }) {
    return _then(_$_StartTimeOut(
      null == controller
          ? _value.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as CountdownController,
    ));
  }
}

/// @nodoc

class _$_StartTimeOut implements _StartTimeOut {
  const _$_StartTimeOut(this.controller);

  @override
  final CountdownController controller;

  @override
  String toString() {
    return 'EmailVerificationFormEvent.startTimeOut(controller: $controller)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_StartTimeOut &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, controller);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_StartTimeOutCopyWith<_$_StartTimeOut> get copyWith =>
      __$$_StartTimeOutCopyWithImpl<_$_StartTimeOut>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onFinished,
    required TResult Function(CountdownController controller) startTimeOut,
  }) {
    return startTimeOut(controller);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onFinished,
    TResult? Function(CountdownController controller)? startTimeOut,
  }) {
    return startTimeOut?.call(controller);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onFinished,
    TResult Function(CountdownController controller)? startTimeOut,
    required TResult orElse(),
  }) {
    if (startTimeOut != null) {
      return startTimeOut(controller);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_OnFinished value) onFinished,
    required TResult Function(_StartTimeOut value) startTimeOut,
  }) {
    return startTimeOut(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_OnFinished value)? onFinished,
    TResult? Function(_StartTimeOut value)? startTimeOut,
  }) {
    return startTimeOut?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_OnFinished value)? onFinished,
    TResult Function(_StartTimeOut value)? startTimeOut,
    required TResult orElse(),
  }) {
    if (startTimeOut != null) {
      return startTimeOut(this);
    }
    return orElse();
  }
}

abstract class _StartTimeOut implements EmailVerificationFormEvent {
  const factory _StartTimeOut(final CountdownController controller) =
      _$_StartTimeOut;

  CountdownController get controller;
  @JsonKey(ignore: true)
  _$$_StartTimeOutCopyWith<_$_StartTimeOut> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$EmailVerificationFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;
  bool get isTimeoutDone => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $EmailVerificationFormStateCopyWith<EmailVerificationFormState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EmailVerificationFormStateCopyWith<$Res> {
  factory $EmailVerificationFormStateCopyWith(EmailVerificationFormState value,
          $Res Function(EmailVerificationFormState) then) =
      _$EmailVerificationFormStateCopyWithImpl<$Res,
          EmailVerificationFormState>;
  @useResult
  $Res call(
      {RequestState state, String message, bool isSubmit, bool isTimeoutDone});
}

/// @nodoc
class _$EmailVerificationFormStateCopyWithImpl<$Res,
        $Val extends EmailVerificationFormState>
    implements $EmailVerificationFormStateCopyWith<$Res> {
  _$EmailVerificationFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? isTimeoutDone = null,
  }) {
    return _then(_value.copyWith(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeoutDone: null == isTimeoutDone
          ? _value.isTimeoutDone
          : isTimeoutDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_EmailVerificationFormStateCopyWith<$Res>
    implements $EmailVerificationFormStateCopyWith<$Res> {
  factory _$$_EmailVerificationFormStateCopyWith(
          _$_EmailVerificationFormState value,
          $Res Function(_$_EmailVerificationFormState) then) =
      __$$_EmailVerificationFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state, String message, bool isSubmit, bool isTimeoutDone});
}

/// @nodoc
class __$$_EmailVerificationFormStateCopyWithImpl<$Res>
    extends _$EmailVerificationFormStateCopyWithImpl<$Res,
        _$_EmailVerificationFormState>
    implements _$$_EmailVerificationFormStateCopyWith<$Res> {
  __$$_EmailVerificationFormStateCopyWithImpl(
      _$_EmailVerificationFormState _value,
      $Res Function(_$_EmailVerificationFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? isTimeoutDone = null,
  }) {
    return _then(_$_EmailVerificationFormState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
      isTimeoutDone: null == isTimeoutDone
          ? _value.isTimeoutDone
          : isTimeoutDone // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_EmailVerificationFormState implements _EmailVerificationFormState {
  const _$_EmailVerificationFormState(
      {required this.state,
      required this.message,
      required this.isSubmit,
      required this.isTimeoutDone});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final bool isSubmit;
  @override
  final bool isTimeoutDone;

  @override
  String toString() {
    return 'EmailVerificationFormState(state: $state, message: $message, isSubmit: $isSubmit, isTimeoutDone: $isTimeoutDone)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_EmailVerificationFormState &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            (identical(other.isTimeoutDone, isTimeoutDone) ||
                other.isTimeoutDone == isTimeoutDone));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, state, message, isSubmit, isTimeoutDone);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailVerificationFormStateCopyWith<_$_EmailVerificationFormState>
      get copyWith => __$$_EmailVerificationFormStateCopyWithImpl<
          _$_EmailVerificationFormState>(this, _$identity);
}

abstract class _EmailVerificationFormState
    implements EmailVerificationFormState {
  const factory _EmailVerificationFormState(
      {required final RequestState state,
      required final String message,
      required final bool isSubmit,
      required final bool isTimeoutDone}) = _$_EmailVerificationFormState;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  bool get isSubmit;
  @override
  bool get isTimeoutDone;
  @override
  @JsonKey(ignore: true)
  _$$_EmailVerificationFormStateCopyWith<_$_EmailVerificationFormState>
      get copyWith => throw _privateConstructorUsedError;
}
