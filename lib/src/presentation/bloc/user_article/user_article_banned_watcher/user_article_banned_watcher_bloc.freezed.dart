// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_article_banned_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserArticleBannedWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserArticleBannedWatcherEventCopyWith<$Res> {
  factory $UserArticleBannedWatcherEventCopyWith(
          UserArticleBannedWatcherEvent value,
          $Res Function(UserArticleBannedWatcherEvent) then) =
      _$UserArticleBannedWatcherEventCopyWithImpl<$Res,
          UserArticleBannedWatcherEvent>;
}

/// @nodoc
class _$UserArticleBannedWatcherEventCopyWithImpl<$Res,
        $Val extends UserArticleBannedWatcherEvent>
    implements $UserArticleBannedWatcherEventCopyWith<$Res> {
  _$UserArticleBannedWatcherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$UserArticleBannedWatcherEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch();

  @override
  String toString() {
    return 'UserArticleBannedWatcherEvent.fetch()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Fetch);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetch,
  }) {
    return fetch();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? fetch,
  }) {
    return fetch?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements UserArticleBannedWatcherEvent {
  const factory _Fetch() = _$_Fetch;
}

/// @nodoc
mixin _$UserArticleBannedWatcherState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Article> get articleList => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int get totalItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserArticleBannedWatcherStateCopyWith<UserArticleBannedWatcherState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserArticleBannedWatcherStateCopyWith<$Res> {
  factory $UserArticleBannedWatcherStateCopyWith(
          UserArticleBannedWatcherState value,
          $Res Function(UserArticleBannedWatcherState) then) =
      _$UserArticleBannedWatcherStateCopyWithImpl<$Res,
          UserArticleBannedWatcherState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      List<Article> articleList,
      int? page,
      int totalItem});
}

/// @nodoc
class _$UserArticleBannedWatcherStateCopyWithImpl<$Res,
        $Val extends UserArticleBannedWatcherState>
    implements $UserArticleBannedWatcherStateCopyWith<$Res> {
  _$UserArticleBannedWatcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? articleList = null,
    Object? page = freezed,
    Object? totalItem = null,
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
      articleList: null == articleList
          ? _value.articleList
          : articleList // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      totalItem: null == totalItem
          ? _value.totalItem
          : totalItem // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserArticleBannedWatcherStateCopyWith<$Res>
    implements $UserArticleBannedWatcherStateCopyWith<$Res> {
  factory _$$_UserArticleBannedWatcherStateCopyWith(
          _$_UserArticleBannedWatcherState value,
          $Res Function(_$_UserArticleBannedWatcherState) then) =
      __$$_UserArticleBannedWatcherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      List<Article> articleList,
      int? page,
      int totalItem});
}

/// @nodoc
class __$$_UserArticleBannedWatcherStateCopyWithImpl<$Res>
    extends _$UserArticleBannedWatcherStateCopyWithImpl<$Res,
        _$_UserArticleBannedWatcherState>
    implements _$$_UserArticleBannedWatcherStateCopyWith<$Res> {
  __$$_UserArticleBannedWatcherStateCopyWithImpl(
      _$_UserArticleBannedWatcherState _value,
      $Res Function(_$_UserArticleBannedWatcherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? articleList = null,
    Object? page = freezed,
    Object? totalItem = null,
  }) {
    return _then(_$_UserArticleBannedWatcherState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      articleList: null == articleList
          ? _value._articleList
          : articleList // ignore: cast_nullable_to_non_nullable
              as List<Article>,
      page: freezed == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int?,
      totalItem: null == totalItem
          ? _value.totalItem
          : totalItem // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_UserArticleBannedWatcherState
    implements _UserArticleBannedWatcherState {
  const _$_UserArticleBannedWatcherState(
      {required this.state,
      required this.message,
      required final List<Article> articleList,
      required this.page,
      required this.totalItem})
      : _articleList = articleList;

  @override
  final RequestState state;
  @override
  final String message;
  final List<Article> _articleList;
  @override
  List<Article> get articleList {
    if (_articleList is EqualUnmodifiableListView) return _articleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articleList);
  }

  @override
  final int? page;
  @override
  final int totalItem;

  @override
  String toString() {
    return 'UserArticleBannedWatcherState(state: $state, message: $message, articleList: $articleList, page: $page, totalItem: $totalItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserArticleBannedWatcherState &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            const DeepCollectionEquality()
                .equals(other._articleList, _articleList) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.totalItem, totalItem) ||
                other.totalItem == totalItem));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message,
      const DeepCollectionEquality().hash(_articleList), page, totalItem);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserArticleBannedWatcherStateCopyWith<_$_UserArticleBannedWatcherState>
      get copyWith => __$$_UserArticleBannedWatcherStateCopyWithImpl<
          _$_UserArticleBannedWatcherState>(this, _$identity);
}

abstract class _UserArticleBannedWatcherState
    implements UserArticleBannedWatcherState {
  const factory _UserArticleBannedWatcherState(
      {required final RequestState state,
      required final String message,
      required final List<Article> articleList,
      required final int? page,
      required final int totalItem}) = _$_UserArticleBannedWatcherState;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  List<Article> get articleList;
  @override
  int? get page;
  @override
  int get totalItem;
  @override
  @JsonKey(ignore: true)
  _$$_UserArticleBannedWatcherStateCopyWith<_$_UserArticleBannedWatcherState>
      get copyWith => throw _privateConstructorUsedError;
}
