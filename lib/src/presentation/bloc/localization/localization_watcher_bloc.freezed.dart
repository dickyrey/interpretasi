// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localization_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LocalizationWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(Locale locale) select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(Locale locale)? select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(Locale locale)? select,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Select value) select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Select value)? select,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Select value)? select,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationWatcherEventCopyWith<$Res> {
  factory $LocalizationWatcherEventCopyWith(LocalizationWatcherEvent value,
          $Res Function(LocalizationWatcherEvent) then) =
      _$LocalizationWatcherEventCopyWithImpl<$Res, LocalizationWatcherEvent>;
}

/// @nodoc
class _$LocalizationWatcherEventCopyWithImpl<$Res,
        $Val extends LocalizationWatcherEvent>
    implements $LocalizationWatcherEventCopyWith<$Res> {
  _$LocalizationWatcherEventCopyWithImpl(this._value, this._then);

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
    extends _$LocalizationWatcherEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'LocalizationWatcherEvent.init()';
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
    required TResult Function(Locale locale) select,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(Locale locale)? select,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(Locale locale)? select,
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
    required TResult Function(_Select value) select,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Select value)? select,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Select value)? select,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements LocalizationWatcherEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_SelectCopyWith<$Res> {
  factory _$$_SelectCopyWith(_$_Select value, $Res Function(_$_Select) then) =
      __$$_SelectCopyWithImpl<$Res>;
  @useResult
  $Res call({Locale locale});
}

/// @nodoc
class __$$_SelectCopyWithImpl<$Res>
    extends _$LocalizationWatcherEventCopyWithImpl<$Res, _$_Select>
    implements _$$_SelectCopyWith<$Res> {
  __$$_SelectCopyWithImpl(_$_Select _value, $Res Function(_$_Select) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? locale = null,
  }) {
    return _then(_$_Select(
      null == locale
          ? _value.locale
          : locale // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _$_Select implements _Select {
  const _$_Select(this.locale);

  @override
  final Locale locale;

  @override
  String toString() {
    return 'LocalizationWatcherEvent.select(locale: $locale)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Select &&
            (identical(other.locale, locale) || other.locale == locale));
  }

  @override
  int get hashCode => Object.hash(runtimeType, locale);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SelectCopyWith<_$_Select> get copyWith =>
      __$$_SelectCopyWithImpl<_$_Select>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(Locale locale) select,
  }) {
    return select(locale);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(Locale locale)? select,
  }) {
    return select?.call(locale);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(Locale locale)? select,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(locale);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_Select value) select,
  }) {
    return select(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_Select value)? select,
  }) {
    return select?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_Select value)? select,
    required TResult orElse(),
  }) {
    if (select != null) {
      return select(this);
    }
    return orElse();
  }
}

abstract class _Select implements LocalizationWatcherEvent {
  const factory _Select(final Locale locale) = _$_Select;

  Locale get locale;
  @JsonKey(ignore: true)
  _$$_SelectCopyWith<_$_Select> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LocalizationWatcherState {
  Locale get selectedLocale => throw _privateConstructorUsedError;
  List<Locale> get supportedLocales => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LocalizationWatcherStateCopyWith<LocalizationWatcherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocalizationWatcherStateCopyWith<$Res> {
  factory $LocalizationWatcherStateCopyWith(LocalizationWatcherState value,
          $Res Function(LocalizationWatcherState) then) =
      _$LocalizationWatcherStateCopyWithImpl<$Res, LocalizationWatcherState>;
  @useResult
  $Res call({Locale selectedLocale, List<Locale> supportedLocales});
}

/// @nodoc
class _$LocalizationWatcherStateCopyWithImpl<$Res,
        $Val extends LocalizationWatcherState>
    implements $LocalizationWatcherStateCopyWith<$Res> {
  _$LocalizationWatcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLocale = null,
    Object? supportedLocales = null,
  }) {
    return _then(_value.copyWith(
      selectedLocale: null == selectedLocale
          ? _value.selectedLocale
          : selectedLocale // ignore: cast_nullable_to_non_nullable
              as Locale,
      supportedLocales: null == supportedLocales
          ? _value.supportedLocales
          : supportedLocales // ignore: cast_nullable_to_non_nullable
              as List<Locale>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LocalizationWatcherStateCopyWith<$Res>
    implements $LocalizationWatcherStateCopyWith<$Res> {
  factory _$$_LocalizationWatcherStateCopyWith(
          _$_LocalizationWatcherState value,
          $Res Function(_$_LocalizationWatcherState) then) =
      __$$_LocalizationWatcherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Locale selectedLocale, List<Locale> supportedLocales});
}

/// @nodoc
class __$$_LocalizationWatcherStateCopyWithImpl<$Res>
    extends _$LocalizationWatcherStateCopyWithImpl<$Res,
        _$_LocalizationWatcherState>
    implements _$$_LocalizationWatcherStateCopyWith<$Res> {
  __$$_LocalizationWatcherStateCopyWithImpl(_$_LocalizationWatcherState _value,
      $Res Function(_$_LocalizationWatcherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedLocale = null,
    Object? supportedLocales = null,
  }) {
    return _then(_$_LocalizationWatcherState(
      selectedLocale: null == selectedLocale
          ? _value.selectedLocale
          : selectedLocale // ignore: cast_nullable_to_non_nullable
              as Locale,
      supportedLocales: null == supportedLocales
          ? _value._supportedLocales
          : supportedLocales // ignore: cast_nullable_to_non_nullable
              as List<Locale>,
    ));
  }
}

/// @nodoc

class _$_LocalizationWatcherState implements _LocalizationWatcherState {
  const _$_LocalizationWatcherState(
      {required this.selectedLocale,
      required final List<Locale> supportedLocales})
      : _supportedLocales = supportedLocales;

  @override
  final Locale selectedLocale;
  final List<Locale> _supportedLocales;
  @override
  List<Locale> get supportedLocales {
    if (_supportedLocales is EqualUnmodifiableListView)
      return _supportedLocales;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_supportedLocales);
  }

  @override
  String toString() {
    return 'LocalizationWatcherState(selectedLocale: $selectedLocale, supportedLocales: $supportedLocales)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LocalizationWatcherState &&
            (identical(other.selectedLocale, selectedLocale) ||
                other.selectedLocale == selectedLocale) &&
            const DeepCollectionEquality()
                .equals(other._supportedLocales, _supportedLocales));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedLocale,
      const DeepCollectionEquality().hash(_supportedLocales));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LocalizationWatcherStateCopyWith<_$_LocalizationWatcherState>
      get copyWith => __$$_LocalizationWatcherStateCopyWithImpl<
          _$_LocalizationWatcherState>(this, _$identity);
}

abstract class _LocalizationWatcherState implements LocalizationWatcherState {
  const factory _LocalizationWatcherState(
          {required final Locale selectedLocale,
          required final List<Locale> supportedLocales}) =
      _$_LocalizationWatcherState;

  @override
  Locale get selectedLocale;
  @override
  List<Locale> get supportedLocales;
  @override
  @JsonKey(ignore: true)
  _$$_LocalizationWatcherStateCopyWith<_$_LocalizationWatcherState>
      get copyWith => throw _privateConstructorUsedError;
}
