// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ForgotPasswordFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String val) email,
    required TResult Function() send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String val)? email,
    TResult? Function()? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String val)? email,
    TResult Function()? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Email value) email,
    required TResult Function(_Send value) send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Email value)? email,
    TResult? Function(_Send value)? send,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Email value)? email,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordFormEventCopyWith<$Res> {
  factory $ForgotPasswordFormEventCopyWith(ForgotPasswordFormEvent value,
          $Res Function(ForgotPasswordFormEvent) then) =
      _$ForgotPasswordFormEventCopyWithImpl<$Res, ForgotPasswordFormEvent>;
}

/// @nodoc
class _$ForgotPasswordFormEventCopyWithImpl<$Res,
        $Val extends ForgotPasswordFormEvent>
    implements $ForgotPasswordFormEventCopyWith<$Res> {
  _$ForgotPasswordFormEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_InitCopyWith<$Res> {
  factory _$$_InitCopyWith(_$_Init value, $Res Function(_$_Init) then) =
      __$$_InitCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_InitCopyWithImpl<$Res>
    extends _$ForgotPasswordFormEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'ForgotPasswordFormEvent.init()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Init);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String val) email,
    required TResult Function() send,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String val)? email,
    TResult? Function()? send,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String val)? email,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Email value) email,
    required TResult Function(_Send value) send,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Email value)? email,
    TResult? Function(_Send value)? send,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Email value)? email,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements ForgotPasswordFormEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_EmailCopyWith<$Res> {
  factory _$$_EmailCopyWith(_$_Email value, $Res Function(_$_Email) then) =
      __$$_EmailCopyWithImpl<$Res>;
  @useResult
  $Res call({String val});
}

/// @nodoc
class __$$_EmailCopyWithImpl<$Res>
    extends _$ForgotPasswordFormEventCopyWithImpl<$Res, _$_Email>
    implements _$$_EmailCopyWith<$Res> {
  __$$_EmailCopyWithImpl(_$_Email _value, $Res Function(_$_Email) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? val = null,
  }) {
    return _then(_$_Email(
      null == val
          ? _value.val
          : val // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Email implements _Email {
  const _$_Email(this.val);

  @override
  final String val;

  @override
  String toString() {
    return 'ForgotPasswordFormEvent.email(val: $val)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Email &&
            (identical(other.val, val) || other.val == val));
  }

  @override
  int get hashCode => Object.hash(runtimeType, val);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_EmailCopyWith<_$_Email> get copyWith =>
      __$$_EmailCopyWithImpl<_$_Email>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String val) email,
    required TResult Function() send,
  }) {
    return email(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String val)? email,
    TResult? Function()? send,
  }) {
    return email?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String val)? email,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (email != null) {
      return email(val);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Email value) email,
    required TResult Function(_Send value) send,
  }) {
    return email(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Email value)? email,
    TResult? Function(_Send value)? send,
  }) {
    return email?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Email value)? email,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (email != null) {
      return email(this);
    }
    return orElse();
  }
}

abstract class _Email implements ForgotPasswordFormEvent {
  const factory _Email(final String val) = _$_Email;

  String get val;
  @JsonKey(ignore: true)
  _$$_EmailCopyWith<_$_Email> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SendCopyWith<$Res> {
  factory _$$_SendCopyWith(_$_Send value, $Res Function(_$_Send) then) =
      __$$_SendCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SendCopyWithImpl<$Res>
    extends _$ForgotPasswordFormEventCopyWithImpl<$Res, _$_Send>
    implements _$$_SendCopyWith<$Res> {
  __$$_SendCopyWithImpl(_$_Send _value, $Res Function(_$_Send) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Send implements _Send {
  const _$_Send();

  @override
  String toString() {
    return 'ForgotPasswordFormEvent.send()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Send);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String val) email,
    required TResult Function() send,
  }) {
    return send();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String val)? email,
    TResult? Function()? send,
  }) {
    return send?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String val)? email,
    TResult Function()? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Email value) email,
    required TResult Function(_Send value) send,
  }) {
    return send(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Email value)? email,
    TResult? Function(_Send value)? send,
  }) {
    return send?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Email value)? email,
    TResult Function(_Send value)? send,
    required TResult orElse(),
  }) {
    if (send != null) {
      return send(this);
    }
    return orElse();
  }
}

abstract class _Send implements ForgotPasswordFormEvent {
  const factory _Send() = _$_Send;
}

/// @nodoc
mixin _$ForgotPasswordFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordFormStateCopyWith<ForgotPasswordFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordFormStateCopyWith<$Res> {
  factory $ForgotPasswordFormStateCopyWith(ForgotPasswordFormState value,
          $Res Function(ForgotPasswordFormState) then) =
      _$ForgotPasswordFormStateCopyWithImpl<$Res, ForgotPasswordFormState>;
  @useResult
  $Res call({RequestState state, String message, String email, bool isSubmit});
}

/// @nodoc
class _$ForgotPasswordFormStateCopyWithImpl<$Res,
        $Val extends ForgotPasswordFormState>
    implements $ForgotPasswordFormStateCopyWith<$Res> {
  _$ForgotPasswordFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? email = null,
    Object? isSubmit = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordFormStateCopyWith<$Res>
    implements $ForgotPasswordFormStateCopyWith<$Res> {
  factory _$$_ForgotPasswordFormStateCopyWith(_$_ForgotPasswordFormState value,
          $Res Function(_$_ForgotPasswordFormState) then) =
      __$$_ForgotPasswordFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message, String email, bool isSubmit});
}

/// @nodoc
class __$$_ForgotPasswordFormStateCopyWithImpl<$Res>
    extends _$ForgotPasswordFormStateCopyWithImpl<$Res,
        _$_ForgotPasswordFormState>
    implements _$$_ForgotPasswordFormStateCopyWith<$Res> {
  __$$_ForgotPasswordFormStateCopyWithImpl(_$_ForgotPasswordFormState _value,
      $Res Function(_$_ForgotPasswordFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? email = null,
    Object? isSubmit = null,
  }) {
    return _then(_$_ForgotPasswordFormState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordFormState implements _ForgotPasswordFormState {
  const _$_ForgotPasswordFormState(
      {required this.state,
      required this.message,
      required this.email,
      required this.isSubmit});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final String email;
  @override
  final bool isSubmit;

  @override
  String toString() {
    return 'ForgotPasswordFormState(state: $state, message: $message, email: $email, isSubmit: $isSubmit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordFormState &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, email, isSubmit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordFormStateCopyWith<_$_ForgotPasswordFormState>
      get copyWith =>
          __$$_ForgotPasswordFormStateCopyWithImpl<_$_ForgotPasswordFormState>(
              this, _$identity);
}

abstract class _ForgotPasswordFormState implements ForgotPasswordFormState {
  const factory _ForgotPasswordFormState(
      {required final RequestState state,
      required final String message,
      required final String email,
      required final bool isSubmit}) = _$_ForgotPasswordFormState;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  String get email;
  @override
  bool get isSubmit;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordFormStateCopyWith<_$_ForgotPasswordFormState>
      get copyWith => throw _privateConstructorUsedError;
}
