// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_article_drafted_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserArticleDraftedWatcherEvent {
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
abstract class $UserArticleDraftedWatcherEventCopyWith<$Res> {
  factory $UserArticleDraftedWatcherEventCopyWith(
          UserArticleDraftedWatcherEvent value,
          $Res Function(UserArticleDraftedWatcherEvent) then) =
      _$UserArticleDraftedWatcherEventCopyWithImpl<$Res,
          UserArticleDraftedWatcherEvent>;
}

/// @nodoc
class _$UserArticleDraftedWatcherEventCopyWithImpl<$Res,
        $Val extends UserArticleDraftedWatcherEvent>
    implements $UserArticleDraftedWatcherEventCopyWith<$Res> {
  _$UserArticleDraftedWatcherEventCopyWithImpl(this._value, this._then);

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
    extends _$UserArticleDraftedWatcherEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch();

  @override
  String toString() {
    return 'UserArticleDraftedWatcherEvent.fetch()';
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

abstract class _Fetch implements UserArticleDraftedWatcherEvent {
  const factory _Fetch() = _$_Fetch;
}

/// @nodoc
mixin _$UserArticleDraftedWatcherState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Article> get articleList => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int get totalItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserArticleDraftedWatcherStateCopyWith<UserArticleDraftedWatcherState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserArticleDraftedWatcherStateCopyWith<$Res> {
  factory $UserArticleDraftedWatcherStateCopyWith(
          UserArticleDraftedWatcherState value,
          $Res Function(UserArticleDraftedWatcherState) then) =
      _$UserArticleDraftedWatcherStateCopyWithImpl<$Res,
          UserArticleDraftedWatcherState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      List<Article> articleList,
      int? page,
      int totalItem});
}

/// @nodoc
class _$UserArticleDraftedWatcherStateCopyWithImpl<$Res,
        $Val extends UserArticleDraftedWatcherState>
    implements $UserArticleDraftedWatcherStateCopyWith<$Res> {
  _$UserArticleDraftedWatcherStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_UserArticleDraftedWatcherStateCopyWith<$Res>
    implements $UserArticleDraftedWatcherStateCopyWith<$Res> {
  factory _$$_UserArticleDraftedWatcherStateCopyWith(
          _$_UserArticleDraftedWatcherState value,
          $Res Function(_$_UserArticleDraftedWatcherState) then) =
      __$$_UserArticleDraftedWatcherStateCopyWithImpl<$Res>;
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
class __$$_UserArticleDraftedWatcherStateCopyWithImpl<$Res>
    extends _$UserArticleDraftedWatcherStateCopyWithImpl<$Res,
        _$_UserArticleDraftedWatcherState>
    implements _$$_UserArticleDraftedWatcherStateCopyWith<$Res> {
  __$$_UserArticleDraftedWatcherStateCopyWithImpl(
      _$_UserArticleDraftedWatcherState _value,
      $Res Function(_$_UserArticleDraftedWatcherState) _then)
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
    return _then(_$_UserArticleDraftedWatcherState(
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

class _$_UserArticleDraftedWatcherState
    implements _UserArticleDraftedWatcherState {
  const _$_UserArticleDraftedWatcherState(
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
    return 'UserArticleDraftedWatcherState(state: $state, message: $message, articleList: $articleList, page: $page, totalItem: $totalItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserArticleDraftedWatcherState &&
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
  _$$_UserArticleDraftedWatcherStateCopyWith<_$_UserArticleDraftedWatcherState>
      get copyWith => __$$_UserArticleDraftedWatcherStateCopyWithImpl<
          _$_UserArticleDraftedWatcherState>(this, _$identity);
}

abstract class _UserArticleDraftedWatcherState
    implements UserArticleDraftedWatcherState {
  const factory _UserArticleDraftedWatcherState(
      {required final RequestState state,
      required final String message,
      required final List<Article> articleList,
      required final int? page,
      required final int totalItem}) = _$_UserArticleDraftedWatcherState;

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
  _$$_UserArticleDraftedWatcherStateCopyWith<_$_UserArticleDraftedWatcherState>
      get copyWith => throw _privateConstructorUsedError;
}
