// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_article_moderated_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserArticleModeratedWatcherEvent {
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
abstract class $UserArticleModeratedWatcherEventCopyWith<$Res> {
  factory $UserArticleModeratedWatcherEventCopyWith(
          UserArticleModeratedWatcherEvent value,
          $Res Function(UserArticleModeratedWatcherEvent) then) =
      _$UserArticleModeratedWatcherEventCopyWithImpl<$Res,
          UserArticleModeratedWatcherEvent>;
}

/// @nodoc
class _$UserArticleModeratedWatcherEventCopyWithImpl<$Res,
        $Val extends UserArticleModeratedWatcherEvent>
    implements $UserArticleModeratedWatcherEventCopyWith<$Res> {
  _$UserArticleModeratedWatcherEventCopyWithImpl(this._value, this._then);

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
    extends _$UserArticleModeratedWatcherEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch();

  @override
  String toString() {
    return 'UserArticleModeratedWatcherEvent.fetch()';
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

abstract class _Fetch implements UserArticleModeratedWatcherEvent {
  const factory _Fetch() = _$_Fetch;
}

/// @nodoc
mixin _$UserArticleModeratedWatcherState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  List<Article> get articleList => throw _privateConstructorUsedError;
  int? get page => throw _privateConstructorUsedError;
  int get totalItem => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserArticleModeratedWatcherStateCopyWith<UserArticleModeratedWatcherState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserArticleModeratedWatcherStateCopyWith<$Res> {
  factory $UserArticleModeratedWatcherStateCopyWith(
          UserArticleModeratedWatcherState value,
          $Res Function(UserArticleModeratedWatcherState) then) =
      _$UserArticleModeratedWatcherStateCopyWithImpl<$Res,
          UserArticleModeratedWatcherState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      List<Article> articleList,
      int? page,
      int totalItem});
}

/// @nodoc
class _$UserArticleModeratedWatcherStateCopyWithImpl<$Res,
        $Val extends UserArticleModeratedWatcherState>
    implements $UserArticleModeratedWatcherStateCopyWith<$Res> {
  _$UserArticleModeratedWatcherStateCopyWithImpl(this._value, this._then);

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
abstract class _$$_UserArticleModeratedWatcherStateCopyWith<$Res>
    implements $UserArticleModeratedWatcherStateCopyWith<$Res> {
  factory _$$_UserArticleModeratedWatcherStateCopyWith(
          _$_UserArticleModeratedWatcherState value,
          $Res Function(_$_UserArticleModeratedWatcherState) then) =
      __$$_UserArticleModeratedWatcherStateCopyWithImpl<$Res>;
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
class __$$_UserArticleModeratedWatcherStateCopyWithImpl<$Res>
    extends _$UserArticleModeratedWatcherStateCopyWithImpl<$Res,
        _$_UserArticleModeratedWatcherState>
    implements _$$_UserArticleModeratedWatcherStateCopyWith<$Res> {
  __$$_UserArticleModeratedWatcherStateCopyWithImpl(
      _$_UserArticleModeratedWatcherState _value,
      $Res Function(_$_UserArticleModeratedWatcherState) _then)
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
    return _then(_$_UserArticleModeratedWatcherState(
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

class _$_UserArticleModeratedWatcherState
    implements _UserArticleModeratedWatcherState {
  const _$_UserArticleModeratedWatcherState(
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
    return 'UserArticleModeratedWatcherState(state: $state, message: $message, articleList: $articleList, page: $page, totalItem: $totalItem)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserArticleModeratedWatcherState &&
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
  _$$_UserArticleModeratedWatcherStateCopyWith<
          _$_UserArticleModeratedWatcherState>
      get copyWith => __$$_UserArticleModeratedWatcherStateCopyWithImpl<
          _$_UserArticleModeratedWatcherState>(this, _$identity);
}

abstract class _UserArticleModeratedWatcherState
    implements UserArticleModeratedWatcherState {
  const factory _UserArticleModeratedWatcherState(
      {required final RequestState state,
      required final String message,
      required final List<Article> articleList,
      required final int? page,
      required final int totalItem}) = _$_UserArticleModeratedWatcherState;

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
  _$$_UserArticleModeratedWatcherStateCopyWith<
          _$_UserArticleModeratedWatcherState>
      get copyWith => throw _privateConstructorUsedError;
}
