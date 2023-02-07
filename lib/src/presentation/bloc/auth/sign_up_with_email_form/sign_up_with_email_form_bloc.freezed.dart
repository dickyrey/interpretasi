// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_with_email_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SignUpWithEmailFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String val) email,
    required TResult Function() signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String val)? email,
    TResult? Function()? signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String val)? email,
    TResult Function()? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Email value) email,
    required TResult Function(_SignUp value) signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Email value)? email,
    TResult? Function(_SignUp value)? signUp,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Email value)? email,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpWithEmailFormEventCopyWith<$Res> {
  factory $SignUpWithEmailFormEventCopyWith(SignUpWithEmailFormEvent value,
          $Res Function(SignUpWithEmailFormEvent) then) =
      _$SignUpWithEmailFormEventCopyWithImpl<$Res, SignUpWithEmailFormEvent>;
}

/// @nodoc
class _$SignUpWithEmailFormEventCopyWithImpl<$Res,
        $Val extends SignUpWithEmailFormEvent>
    implements $SignUpWithEmailFormEventCopyWith<$Res> {
  _$SignUpWithEmailFormEventCopyWithImpl(this._value, this._then);

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
    extends _$SignUpWithEmailFormEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'SignUpWithEmailFormEvent.init()';
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
    required TResult Function() signUp,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String val)? email,
    TResult? Function()? signUp,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String val)? email,
    TResult Function()? signUp,
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
    required TResult Function(_SignUp value) signUp,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Email value)? email,
    TResult? Function(_SignUp value)? signUp,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Email value)? email,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements SignUpWithEmailFormEvent {
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
    extends _$SignUpWithEmailFormEventCopyWithImpl<$Res, _$_Email>
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
    return 'SignUpWithEmailFormEvent.email(val: $val)';
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
    required TResult Function() signUp,
  }) {
    return email(val);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String val)? email,
    TResult? Function()? signUp,
  }) {
    return email?.call(val);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String val)? email,
    TResult Function()? signUp,
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
    required TResult Function(_SignUp value) signUp,
  }) {
    return email(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Email value)? email,
    TResult? Function(_SignUp value)? signUp,
  }) {
    return email?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Email value)? email,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (email != null) {
      return email(this);
    }
    return orElse();
  }
}

abstract class _Email implements SignUpWithEmailFormEvent {
  const factory _Email(final String val) = _$_Email;

  String get val;
  @JsonKey(ignore: true)
  _$$_EmailCopyWith<_$_Email> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SignUpCopyWith<$Res> {
  factory _$$_SignUpCopyWith(_$_SignUp value, $Res Function(_$_SignUp) then) =
      __$$_SignUpCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SignUpCopyWithImpl<$Res>
    extends _$SignUpWithEmailFormEventCopyWithImpl<$Res, _$_SignUp>
    implements _$$_SignUpCopyWith<$Res> {
  __$$_SignUpCopyWithImpl(_$_SignUp _value, $Res Function(_$_SignUp) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_SignUp implements _SignUp {
  const _$_SignUp();

  @override
  String toString() {
    return 'SignUpWithEmailFormEvent.signUp()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_SignUp);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String val) email,
    required TResult Function() signUp,
  }) {
    return signUp();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String val)? email,
    TResult? Function()? signUp,
  }) {
    return signUp?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String val)? email,
    TResult Function()? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Email value) email,
    required TResult Function(_SignUp value) signUp,
  }) {
    return signUp(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Email value)? email,
    TResult? Function(_SignUp value)? signUp,
  }) {
    return signUp?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Email value)? email,
    TResult Function(_SignUp value)? signUp,
    required TResult orElse(),
  }) {
    if (signUp != null) {
      return signUp(this);
    }
    return orElse();
  }
}

abstract class _SignUp implements SignUpWithEmailFormEvent {
  const factory _SignUp() = _$_SignUp;
}

/// @nodoc
mixin _$SignUpWithEmailFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SignUpWithEmailFormStateCopyWith<SignUpWithEmailFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SignUpWithEmailFormStateCopyWith<$Res> {
  factory $SignUpWithEmailFormStateCopyWith(SignUpWithEmailFormState value,
          $Res Function(SignUpWithEmailFormState) then) =
      _$SignUpWithEmailFormStateCopyWithImpl<$Res, SignUpWithEmailFormState>;
  @useResult
  $Res call({RequestState state, String message, bool isSubmit, String email});
}

/// @nodoc
class _$SignUpWithEmailFormStateCopyWithImpl<$Res,
        $Val extends SignUpWithEmailFormState>
    implements $SignUpWithEmailFormStateCopyWith<$Res> {
  _$SignUpWithEmailFormStateCopyWithImpl(this._value, this._then);

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
    Object? email = null,
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SignUpWithEmailFormStateCopyWith<$Res>
    implements $SignUpWithEmailFormStateCopyWith<$Res> {
  factory _$$_SignUpWithEmailFormStateCopyWith(
          _$_SignUpWithEmailFormState value,
          $Res Function(_$_SignUpWithEmailFormState) then) =
      __$$_SignUpWithEmailFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({RequestState state, String message, bool isSubmit, String email});
}

/// @nodoc
class __$$_SignUpWithEmailFormStateCopyWithImpl<$Res>
    extends _$SignUpWithEmailFormStateCopyWithImpl<$Res,
        _$_SignUpWithEmailFormState>
    implements _$$_SignUpWithEmailFormStateCopyWith<$Res> {
  __$$_SignUpWithEmailFormStateCopyWithImpl(_$_SignUpWithEmailFormState _value,
      $Res Function(_$_SignUpWithEmailFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? isSubmit = null,
    Object? email = null,
  }) {
    return _then(_$_SignUpWithEmailFormState(
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
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_SignUpWithEmailFormState implements _SignUpWithEmailFormState {
  const _$_SignUpWithEmailFormState(
      {required this.state,
      required this.message,
      required this.isSubmit,
      required this.email});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final bool isSubmit;
  @override
  final String email;

  @override
  String toString() {
    return 'SignUpWithEmailFormState(state: $state, message: $message, isSubmit: $isSubmit, email: $email)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SignUpWithEmailFormState &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit) &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, isSubmit, email);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SignUpWithEmailFormStateCopyWith<_$_SignUpWithEmailFormState>
      get copyWith => __$$_SignUpWithEmailFormStateCopyWithImpl<
          _$_SignUpWithEmailFormState>(this, _$identity);
}

abstract class _SignUpWithEmailFormState implements SignUpWithEmailFormState {
  const factory _SignUpWithEmailFormState(
      {required final RequestState state,
      required final String message,
      required final bool isSubmit,
      required final String email}) = _$_SignUpWithEmailFormState;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  bool get isSubmit;
  @override
  String get email;
  @override
  @JsonKey(ignore: true)
  _$$_SignUpWithEmailFormStateCopyWith<_$_SignUpWithEmailFormState>
      get copyWith => throw _privateConstructorUsedError;
}
