// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'article_by_category_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ArticleByCategoryWatcherEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) changeIndex,
    required TResult Function(int id) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? changeIndex,
    TResult? Function(int id)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? changeIndex,
    TResult Function(int id)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeIndex value) changeIndex,
    required TResult Function(_Fetch value) fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeIndex value)? changeIndex,
    TResult? Function(_Fetch value)? fetch,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeIndex value)? changeIndex,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleByCategoryWatcherEventCopyWith<$Res> {
  factory $ArticleByCategoryWatcherEventCopyWith(
          ArticleByCategoryWatcherEvent value,
          $Res Function(ArticleByCategoryWatcherEvent) then) =
      _$ArticleByCategoryWatcherEventCopyWithImpl<$Res,
          ArticleByCategoryWatcherEvent>;
}

/// @nodoc
class _$ArticleByCategoryWatcherEventCopyWithImpl<$Res,
        $Val extends ArticleByCategoryWatcherEvent>
    implements $ArticleByCategoryWatcherEventCopyWith<$Res> {
  _$ArticleByCategoryWatcherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_ChangeIndexCopyWith<$Res> {
  factory _$$_ChangeIndexCopyWith(
          _$_ChangeIndex value, $Res Function(_$_ChangeIndex) then) =
      __$$_ChangeIndexCopyWithImpl<$Res>;
  @useResult
  $Res call({int index});
}

/// @nodoc
class __$$_ChangeIndexCopyWithImpl<$Res>
    extends _$ArticleByCategoryWatcherEventCopyWithImpl<$Res, _$_ChangeIndex>
    implements _$$_ChangeIndexCopyWith<$Res> {
  __$$_ChangeIndexCopyWithImpl(
      _$_ChangeIndex _value, $Res Function(_$_ChangeIndex) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = null,
  }) {
    return _then(_$_ChangeIndex(
      null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_ChangeIndex implements _ChangeIndex {
  const _$_ChangeIndex(this.index);

  @override
  final int index;

  @override
  String toString() {
    return 'ArticleByCategoryWatcherEvent.changeIndex(index: $index)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ChangeIndex &&
            (identical(other.index, index) || other.index == index));
  }

  @override
  int get hashCode => Object.hash(runtimeType, index);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ChangeIndexCopyWith<_$_ChangeIndex> get copyWith =>
      __$$_ChangeIndexCopyWithImpl<_$_ChangeIndex>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) changeIndex,
    required TResult Function(int id) fetch,
  }) {
    return changeIndex(index);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? changeIndex,
    TResult? Function(int id)? fetch,
  }) {
    return changeIndex?.call(index);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? changeIndex,
    TResult Function(int id)? fetch,
    required TResult orElse(),
  }) {
    if (changeIndex != null) {
      return changeIndex(index);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeIndex value) changeIndex,
    required TResult Function(_Fetch value) fetch,
  }) {
    return changeIndex(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeIndex value)? changeIndex,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return changeIndex?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeIndex value)? changeIndex,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (changeIndex != null) {
      return changeIndex(this);
    }
    return orElse();
  }
}

abstract class _ChangeIndex implements ArticleByCategoryWatcherEvent {
  const factory _ChangeIndex(final int index) = _$_ChangeIndex;

  int get index;
  @JsonKey(ignore: true)
  _$$_ChangeIndexCopyWith<_$_ChangeIndex> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @useResult
  $Res call({int id});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$ArticleByCategoryWatcherEventCopyWithImpl<$Res, _$_Fetch>
    implements _$$_FetchCopyWith<$Res> {
  __$$_FetchCopyWithImpl(_$_Fetch _value, $Res Function(_$_Fetch) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_Fetch(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(this.id);

  @override
  final int id;

  @override
  String toString() {
    return 'ArticleByCategoryWatcherEvent.fetch(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Fetch &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      __$$_FetchCopyWithImpl<_$_Fetch>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int index) changeIndex,
    required TResult Function(int id) fetch,
  }) {
    return fetch(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int index)? changeIndex,
    TResult? Function(int id)? fetch,
  }) {
    return fetch?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int index)? changeIndex,
    TResult Function(int id)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_ChangeIndex value) changeIndex,
    required TResult Function(_Fetch value) fetch,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_ChangeIndex value)? changeIndex,
    TResult? Function(_Fetch value)? fetch,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_ChangeIndex value)? changeIndex,
    TResult Function(_Fetch value)? fetch,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements ArticleByCategoryWatcherEvent {
  const factory _Fetch(final int id) = _$_Fetch;

  int get id;
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ArticleByCategoryWatcherState {
  RequestState get state => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  int get index => throw _privateConstructorUsedError;
  int get selectedCategoryId => throw _privateConstructorUsedError;
  List<Article> get articleList => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ArticleByCategoryWatcherStateCopyWith<ArticleByCategoryWatcherState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ArticleByCategoryWatcherStateCopyWith<$Res> {
  factory $ArticleByCategoryWatcherStateCopyWith(
          ArticleByCategoryWatcherState value,
          $Res Function(ArticleByCategoryWatcherState) then) =
      _$ArticleByCategoryWatcherStateCopyWithImpl<$Res,
          ArticleByCategoryWatcherState>;
  @useResult
  $Res call(
      {RequestState state,
      String message,
      int index,
      int selectedCategoryId,
      List<Article> articleList});
}

/// @nodoc
class _$ArticleByCategoryWatcherStateCopyWithImpl<$Res,
        $Val extends ArticleByCategoryWatcherState>
    implements $ArticleByCategoryWatcherStateCopyWith<$Res> {
  _$ArticleByCategoryWatcherStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? index = null,
    Object? selectedCategoryId = null,
    Object? articleList = null,
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
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategoryId: null == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      articleList: null == articleList
          ? _value.articleList
          : articleList // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ArticleByCategoryWatcherStateCopyWith<$Res>
    implements $ArticleByCategoryWatcherStateCopyWith<$Res> {
  factory _$$_ArticleByCategoryWatcherStateCopyWith(
          _$_ArticleByCategoryWatcherState value,
          $Res Function(_$_ArticleByCategoryWatcherState) then) =
      __$$_ArticleByCategoryWatcherStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {RequestState state,
      String message,
      int index,
      int selectedCategoryId,
      List<Article> articleList});
}

/// @nodoc
class __$$_ArticleByCategoryWatcherStateCopyWithImpl<$Res>
    extends _$ArticleByCategoryWatcherStateCopyWithImpl<$Res,
        _$_ArticleByCategoryWatcherState>
    implements _$$_ArticleByCategoryWatcherStateCopyWith<$Res> {
  __$$_ArticleByCategoryWatcherStateCopyWithImpl(
      _$_ArticleByCategoryWatcherState _value,
      $Res Function(_$_ArticleByCategoryWatcherState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? state = null,
    Object? message = null,
    Object? index = null,
    Object? selectedCategoryId = null,
    Object? articleList = null,
  }) {
    return _then(_$_ArticleByCategoryWatcherState(
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as RequestState,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      selectedCategoryId: null == selectedCategoryId
          ? _value.selectedCategoryId
          : selectedCategoryId // ignore: cast_nullable_to_non_nullable
              as int,
      articleList: null == articleList
          ? _value._articleList
          : articleList // ignore: cast_nullable_to_non_nullable
              as List<Article>,
    ));
  }
}

/// @nodoc

class _$_ArticleByCategoryWatcherState
    implements _ArticleByCategoryWatcherState {
  const _$_ArticleByCategoryWatcherState(
      {required this.state,
      required this.message,
      required this.index,
      required this.selectedCategoryId,
      required final List<Article> articleList})
      : _articleList = articleList;

  @override
  final RequestState state;
  @override
  final String message;
  @override
  final int index;
  @override
  final int selectedCategoryId;
  final List<Article> _articleList;
  @override
  List<Article> get articleList {
    if (_articleList is EqualUnmodifiableListView) return _articleList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articleList);
  }

  @override
  String toString() {
    return 'ArticleByCategoryWatcherState(state: $state, message: $message, index: $index, selectedCategoryId: $selectedCategoryId, articleList: $articleList)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ArticleByCategoryWatcherState &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.selectedCategoryId, selectedCategoryId) ||
                other.selectedCategoryId == selectedCategoryId) &&
            const DeepCollectionEquality()
                .equals(other._articleList, _articleList));
  }

  @override
  int get hashCode => Object.hash(runtimeType, state, message, index,
      selectedCategoryId, const DeepCollectionEquality().hash(_articleList));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ArticleByCategoryWatcherStateCopyWith<_$_ArticleByCategoryWatcherState>
      get copyWith => __$$_ArticleByCategoryWatcherStateCopyWithImpl<
          _$_ArticleByCategoryWatcherState>(this, _$identity);
}

abstract class _ArticleByCategoryWatcherState
    implements ArticleByCategoryWatcherState {
  const factory _ArticleByCategoryWatcherState(
          {required final RequestState state,
          required final String message,
          required final int index,
          required final int selectedCategoryId,
          required final List<Article> articleList}) =
      _$_ArticleByCategoryWatcherState;

  @override
  RequestState get state;
  @override
  String get message;
  @override
  int get index;
  @override
  int get selectedCategoryId;
  @override
  List<Article> get articleList;
  @override
  @JsonKey(ignore: true)
  _$$_ArticleByCategoryWatcherStateCopyWith<_$_ArticleByCategoryWatcherState>
      get copyWith => throw _privateConstructorUsedError;
}
