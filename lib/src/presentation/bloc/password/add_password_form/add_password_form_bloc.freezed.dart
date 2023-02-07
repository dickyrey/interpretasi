// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_password_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AddPasswordFormEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String password) password,
    required TResult Function(String repeatPassword) repeatPassword,
    required TResult Function() addPassword,
    required TResult Function() obscureText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String password)? password,
    TResult? Function(String repeatPassword)? repeatPassword,
    TResult? Function()? addPassword,
    TResult? Function()? obscureText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String password)? password,
    TResult Function(String repeatPassword)? repeatPassword,
    TResult Function()? addPassword,
    TResult Function()? obscureText,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Password value) password,
    required TResult Function(_RepeatPassword value) repeatPassword,
    required TResult Function(_AddPassword value) addPassword,
    required TResult Function(_ObscureText value) obscureText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Password value)? password,
    TResult? Function(_RepeatPassword value)? repeatPassword,
    TResult? Function(_AddPassword value)? addPassword,
    TResult? Function(_ObscureText value)? obscureText,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Password value)? password,
    TResult Function(_RepeatPassword value)? repeatPassword,
    TResult Function(_AddPassword value)? addPassword,
    TResult Function(_ObscureText value)? obscureText,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPasswordFormEventCopyWith<$Res> {
  factory $AddPasswordFormEventCopyWith(AddPasswordFormEvent value,
          $Res Function(AddPasswordFormEvent) then) =
      _$AddPasswordFormEventCopyWithImpl<$Res, AddPasswordFormEvent>;
}

/// @nodoc
class _$AddPasswordFormEventCopyWithImpl<$Res,
        $Val extends AddPasswordFormEvent>
    implements $AddPasswordFormEventCopyWith<$Res> {
  _$AddPasswordFormEventCopyWithImpl(this._value, this._then);

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
    extends _$AddPasswordFormEventCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'AddPasswordFormEvent.initial()';
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
    required TResult Function(String password) password,
    required TResult Function(String repeatPassword) repeatPassword,
    required TResult Function() addPassword,
    required TResult Function() obscureText,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String password)? password,
    TResult? Function(String repeatPassword)? repeatPassword,
    TResult? Function()? addPassword,
    TResult? Function()? obscureText,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String password)? password,
    TResult Function(String repeatPassword)? repeatPassword,
    TResult Function()? addPassword,
    TResult Function()? obscureText,
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
    required TResult Function(_Password value) password,
    required TResult Function(_RepeatPassword value) repeatPassword,
    required TResult Function(_AddPassword value) addPassword,
    required TResult Function(_ObscureText value) obscureText,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Password value)? password,
    TResult? Function(_RepeatPassword value)? repeatPassword,
    TResult? Function(_AddPassword value)? addPassword,
    TResult? Function(_ObscureText value)? obscureText,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Password value)? password,
    TResult Function(_RepeatPassword value)? repeatPassword,
    TResult Function(_AddPassword value)? addPassword,
    TResult Function(_ObscureText value)? obscureText,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements AddPasswordFormEvent {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_PasswordCopyWith<$Res> {
  factory _$$_PasswordCopyWith(
          _$_Password value, $Res Function(_$_Password) then) =
      __$$_PasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({String password});
}

/// @nodoc
class __$$_PasswordCopyWithImpl<$Res>
    extends _$AddPasswordFormEventCopyWithImpl<$Res, _$_Password>
    implements _$$_PasswordCopyWith<$Res> {
  __$$_PasswordCopyWithImpl(
      _$_Password _value, $Res Function(_$_Password) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
  }) {
    return _then(_$_Password(
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Password implements _Password {
  const _$_Password(this.password);

  @override
  final String password;

  @override
  String toString() {
    return 'AddPasswordFormEvent.password(password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Password &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PasswordCopyWith<_$_Password> get copyWith =>
      __$$_PasswordCopyWithImpl<_$_Password>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String password) password,
    required TResult Function(String repeatPassword) repeatPassword,
    required TResult Function() addPassword,
    required TResult Function() obscureText,
  }) {
    return password(this.password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String password)? password,
    TResult? Function(String repeatPassword)? repeatPassword,
    TResult? Function()? addPassword,
    TResult? Function()? obscureText,
  }) {
    return password?.call(this.password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String password)? password,
    TResult Function(String repeatPassword)? repeatPassword,
    TResult Function()? addPassword,
    TResult Function()? obscureText,
    required TResult orElse(),
  }) {
    if (password != null) {
      return password(this.password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Password value) password,
    required TResult Function(_RepeatPassword value) repeatPassword,
    required TResult Function(_AddPassword value) addPassword,
    required TResult Function(_ObscureText value) obscureText,
  }) {
    return password(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Password value)? password,
    TResult? Function(_RepeatPassword value)? repeatPassword,
    TResult? Function(_AddPassword value)? addPassword,
    TResult? Function(_ObscureText value)? obscureText,
  }) {
    return password?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Password value)? password,
    TResult Function(_RepeatPassword value)? repeatPassword,
    TResult Function(_AddPassword value)? addPassword,
    TResult Function(_ObscureText value)? obscureText,
    required TResult orElse(),
  }) {
    if (password != null) {
      return password(this);
    }
    return orElse();
  }
}

abstract class _Password implements AddPasswordFormEvent {
  const factory _Password(final String password) = _$_Password;

  String get password;
  @JsonKey(ignore: true)
  _$$_PasswordCopyWith<_$_Password> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_RepeatPasswordCopyWith<$Res> {
  factory _$$_RepeatPasswordCopyWith(
          _$_RepeatPassword value, $Res Function(_$_RepeatPassword) then) =
      __$$_RepeatPasswordCopyWithImpl<$Res>;
  @useResult
  $Res call({String repeatPassword});
}

/// @nodoc
class __$$_RepeatPasswordCopyWithImpl<$Res>
    extends _$AddPasswordFormEventCopyWithImpl<$Res, _$_RepeatPassword>
    implements _$$_RepeatPasswordCopyWith<$Res> {
  __$$_RepeatPasswordCopyWithImpl(
      _$_RepeatPassword _value, $Res Function(_$_RepeatPassword) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? repeatPassword = null,
  }) {
    return _then(_$_RepeatPassword(
      null == repeatPassword
          ? _value.repeatPassword
          : repeatPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RepeatPassword implements _RepeatPassword {
  const _$_RepeatPassword(this.repeatPassword);

  @override
  final String repeatPassword;

  @override
  String toString() {
    return 'AddPasswordFormEvent.repeatPassword(repeatPassword: $repeatPassword)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RepeatPassword &&
            (identical(other.repeatPassword, repeatPassword) ||
                other.repeatPassword == repeatPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, repeatPassword);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RepeatPasswordCopyWith<_$_RepeatPassword> get copyWith =>
      __$$_RepeatPasswordCopyWithImpl<_$_RepeatPassword>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String password) password,
    required TResult Function(String repeatPassword) repeatPassword,
    required TResult Function() addPassword,
    required TResult Function() obscureText,
  }) {
    return repeatPassword(this.repeatPassword);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String password)? password,
    TResult? Function(String repeatPassword)? repeatPassword,
    TResult? Function()? addPassword,
    TResult? Function()? obscureText,
  }) {
    return repeatPassword?.call(this.repeatPassword);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String password)? password,
    TResult Function(String repeatPassword)? repeatPassword,
    TResult Function()? addPassword,
    TResult Function()? obscureText,
    required TResult orElse(),
  }) {
    if (repeatPassword != null) {
      return repeatPassword(this.repeatPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Password value) password,
    required TResult Function(_RepeatPassword value) repeatPassword,
    required TResult Function(_AddPassword value) addPassword,
    required TResult Function(_ObscureText value) obscureText,
  }) {
    return repeatPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Password value)? password,
    TResult? Function(_RepeatPassword value)? repeatPassword,
    TResult? Function(_AddPassword value)? addPassword,
    TResult? Function(_ObscureText value)? obscureText,
  }) {
    return repeatPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Password value)? password,
    TResult Function(_RepeatPassword value)? repeatPassword,
    TResult Function(_AddPassword value)? addPassword,
    TResult Function(_ObscureText value)? obscureText,
    required TResult orElse(),
  }) {
    if (repeatPassword != null) {
      return repeatPassword(this);
    }
    return orElse();
  }
}

abstract class _RepeatPassword implements AddPasswordFormEvent {
  const factory _RepeatPassword(final String repeatPassword) =
      _$_RepeatPassword;

  String get repeatPassword;
  @JsonKey(ignore: true)
  _$$_RepeatPasswordCopyWith<_$_RepeatPassword> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_AddPasswordCopyWith<$Res> {
  factory _$$_AddPasswordCopyWith(
          _$_AddPassword value, $Res Function(_$_AddPassword) then) =
      __$$_AddPasswordCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_AddPasswordCopyWithImpl<$Res>
    extends _$AddPasswordFormEventCopyWithImpl<$Res, _$_AddPassword>
    implements _$$_AddPasswordCopyWith<$Res> {
  __$$_AddPasswordCopyWithImpl(
      _$_AddPassword _value, $Res Function(_$_AddPassword) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_AddPassword implements _AddPassword {
  const _$_AddPassword();

  @override
  String toString() {
    return 'AddPasswordFormEvent.addPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_AddPassword);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String password) password,
    required TResult Function(String repeatPassword) repeatPassword,
    required TResult Function() addPassword,
    required TResult Function() obscureText,
  }) {
    return addPassword();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String password)? password,
    TResult? Function(String repeatPassword)? repeatPassword,
    TResult? Function()? addPassword,
    TResult? Function()? obscureText,
  }) {
    return addPassword?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String password)? password,
    TResult Function(String repeatPassword)? repeatPassword,
    TResult Function()? addPassword,
    TResult Function()? obscureText,
    required TResult orElse(),
  }) {
    if (addPassword != null) {
      return addPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Password value) password,
    required TResult Function(_RepeatPassword value) repeatPassword,
    required TResult Function(_AddPassword value) addPassword,
    required TResult Function(_ObscureText value) obscureText,
  }) {
    return addPassword(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Password value)? password,
    TResult? Function(_RepeatPassword value)? repeatPassword,
    TResult? Function(_AddPassword value)? addPassword,
    TResult? Function(_ObscureText value)? obscureText,
  }) {
    return addPassword?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Password value)? password,
    TResult Function(_RepeatPassword value)? repeatPassword,
    TResult Function(_AddPassword value)? addPassword,
    TResult Function(_ObscureText value)? obscureText,
    required TResult orElse(),
  }) {
    if (addPassword != null) {
      return addPassword(this);
    }
    return orElse();
  }
}

abstract class _AddPassword implements AddPasswordFormEvent {
  const factory _AddPassword() = _$_AddPassword;
}

/// @nodoc
abstract class _$$_ObscureTextCopyWith<$Res> {
  factory _$$_ObscureTextCopyWith(
          _$_ObscureText value, $Res Function(_$_ObscureText) then) =
      __$$_ObscureTextCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_ObscureTextCopyWithImpl<$Res>
    extends _$AddPasswordFormEventCopyWithImpl<$Res, _$_ObscureText>
    implements _$$_ObscureTextCopyWith<$Res> {
  __$$_ObscureTextCopyWithImpl(
      _$_ObscureText _value, $Res Function(_$_ObscureText) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_ObscureText implements _ObscureText {
  const _$_ObscureText();

  @override
  String toString() {
    return 'AddPasswordFormEvent.obscureText()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_ObscureText);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(String password) password,
    required TResult Function(String repeatPassword) repeatPassword,
    required TResult Function() addPassword,
    required TResult Function() obscureText,
  }) {
    return obscureText();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(String password)? password,
    TResult? Function(String repeatPassword)? repeatPassword,
    TResult? Function()? addPassword,
    TResult? Function()? obscureText,
  }) {
    return obscureText?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(String password)? password,
    TResult Function(String repeatPassword)? repeatPassword,
    TResult Function()? addPassword,
    TResult Function()? obscureText,
    required TResult orElse(),
  }) {
    if (obscureText != null) {
      return obscureText();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Password value) password,
    required TResult Function(_RepeatPassword value) repeatPassword,
    required TResult Function(_AddPassword value) addPassword,
    required TResult Function(_ObscureText value) obscureText,
  }) {
    return obscureText(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Password value)? password,
    TResult? Function(_RepeatPassword value)? repeatPassword,
    TResult? Function(_AddPassword value)? addPassword,
    TResult? Function(_ObscureText value)? obscureText,
  }) {
    return obscureText?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Password value)? password,
    TResult Function(_RepeatPassword value)? repeatPassword,
    TResult Function(_AddPassword value)? addPassword,
    TResult Function(_ObscureText value)? obscureText,
    required TResult orElse(),
  }) {
    if (obscureText != null) {
      return obscureText(this);
    }
    return orElse();
  }
}

abstract class _ObscureText implements AddPasswordFormEvent {
  const factory _ObscureText() = _$_ObscureText;
}

/// @nodoc
mixin _$AddPasswordFormState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get repeatPassword => throw _privateConstructorUsedError;
  bool get obscureText => throw _privateConstructorUsedError;
  bool get isSubmit => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPasswordFormStateCopyWith<AddPasswordFormState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPasswordFormStateCopyWith<$Res> {
  factory $AddPasswordFormStateCopyWith(AddPasswordFormState value,
          $Res Function(AddPasswordFormState) then) =
      _$AddPasswordFormStateCopyWithImpl<$Res, AddPasswordFormState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String password,
      String repeatPassword,
      bool obscureText,
      bool isSubmit});
}

/// @nodoc
class _$AddPasswordFormStateCopyWithImpl<$Res,
        $Val extends AddPasswordFormState>
    implements $AddPasswordFormStateCopyWith<$Res> {
  _$AddPasswordFormStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? password = null,
    Object? repeatPassword = null,
    Object? obscureText = null,
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
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      repeatPassword: null == repeatPassword
          ? _value.repeatPassword
          : repeatPassword // ignore: cast_nullable_to_non_nullable
              as String,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AddPasswordFormStateCopyWith<$Res>
    implements $AddPasswordFormStateCopyWith<$Res> {
  factory _$$_AddPasswordFormStateCopyWith(_$_AddPasswordFormState value,
          $Res Function(_$_AddPasswordFormState) then) =
      __$$_AddPasswordFormStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      String password,
      String repeatPassword,
      bool obscureText,
      bool isSubmit});
}

/// @nodoc
class __$$_AddPasswordFormStateCopyWithImpl<$Res>
    extends _$AddPasswordFormStateCopyWithImpl<$Res, _$_AddPasswordFormState>
    implements _$$_AddPasswordFormStateCopyWith<$Res> {
  __$$_AddPasswordFormStateCopyWithImpl(_$_AddPasswordFormState _value,
      $Res Function(_$_AddPasswordFormState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? password = null,
    Object? repeatPassword = null,
    Object? obscureText = null,
    Object? isSubmit = null,
  }) {
    return _then(_$_AddPasswordFormState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      repeatPassword: null == repeatPassword
          ? _value.repeatPassword
          : repeatPassword // ignore: cast_nullable_to_non_nullable
              as String,
      obscureText: null == obscureText
          ? _value.obscureText
          : obscureText // ignore: cast_nullable_to_non_nullable
              as bool,
      isSubmit: null == isSubmit
          ? _value.isSubmit
          : isSubmit // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AddPasswordFormState implements _AddPasswordFormState {
  const _$_AddPasswordFormState(
      {required this.state,
      required this.message,
      required this.password,
      required this.repeatPassword,
      required this.obscureText,
      required this.isSubmit});

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final String password;
  @override
  final String repeatPassword;
  @override
  final bool obscureText;
  @override
  final bool isSubmit;

  @override
  String toString() {
    return 'AddPasswordFormState(state: $state, message: $message, password: $password, repeatPassword: $repeatPassword, obscureText: $obscureText, isSubmit: $isSubmit)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AddPasswordFormState &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.repeatPassword, repeatPassword) ||
                other.repeatPassword == repeatPassword) &&
            (identical(other.obscureText, obscureText) ||
                other.obscureText == obscureText) &&
            (identical(other.isSubmit, isSubmit) ||
                other.isSubmit == isSubmit));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, password,
      repeatPassword, obscureText, isSubmit);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AddPasswordFormStateCopyWith<_$_AddPasswordFormState> get copyWith =>
      __$$_AddPasswordFormStateCopyWithImpl<_$_AddPasswordFormState>(
          this, _$identity);
}

abstract class _AddPasswordFormState implements AddPasswordFormState {
  const factory _AddPasswordFormState(
      {required final RequestState state,
      required final String message,
      required final String password,
      required final String repeatPassword,
      required final bool obscureText,
      required final bool isSubmit}) = _$_AddPasswordFormState;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  String get password;
  @override
  String get repeatPassword;
  @override
  bool get obscureText;
  @override
  bool get isSubmit;
  @override
  @JsonKey(ignore: true)
  _$$_AddPasswordFormStateCopyWith<_$_AddPasswordFormState> get copyWith =>
      throw _privateConstructorUsedError;
}
