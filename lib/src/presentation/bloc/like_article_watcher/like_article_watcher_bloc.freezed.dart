// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'like_article_watcher_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LikeArticleWatcherEvent {
  String get id => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetch,
    required TResult Function(String id) like,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetch,
    TResult? Function(String id)? like,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetch,
    TResult Function(String id)? like,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Like value) like,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Like value)? like,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Like value)? like,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LikeArticleWatcherEventCopyWith<LikeArticleWatcherEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeArticleWatcherEventCopyWith<$Res> {
  factory $LikeArticleWatcherEventCopyWith(LikeArticleWatcherEvent value,
          $Res Function(LikeArticleWatcherEvent) then) =
      _$LikeArticleWatcherEventCopyWithImpl<$Res, LikeArticleWatcherEvent>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$LikeArticleWatcherEventCopyWithImpl<$Res,
        $Val extends LikeArticleWatcherEvent>
    implements $LikeArticleWatcherEventCopyWith<$Res> {
  _$LikeArticleWatcherEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FetchCopyWith<$Res>
    implements $LikeArticleWatcherEventCopyWith<$Res> {
  factory _$$_FetchCopyWith(_$_Fetch value, $Res Function(_$_Fetch) then) =
      __$$_FetchCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_FetchCopyWithImpl<$Res>
    extends _$LikeArticleWatcherEventCopyWithImpl<$Res, _$_Fetch>
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
              as String,
    ));
  }
}

/// @nodoc

class _$_Fetch implements _Fetch {
  const _$_Fetch(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'LikeArticleWatcherEvent.fetch(id: $id)';
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
    required TResult Function(String id) fetch,
    required TResult Function(String id) like,
  }) {
    return fetch(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetch,
    TResult? Function(String id)? like,
  }) {
    return fetch?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetch,
    TResult Function(String id)? like,
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
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Like value) like,
  }) {
    return fetch(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Like value)? like,
  }) {
    return fetch?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Like value)? like,
    required TResult orElse(),
  }) {
    if (fetch != null) {
      return fetch(this);
    }
    return orElse();
  }
}

abstract class _Fetch implements LikeArticleWatcherEvent {
  const factory _Fetch(final String id) = _$_Fetch;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_FetchCopyWith<_$_Fetch> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_LikeCopyWith<$Res>
    implements $LikeArticleWatcherEventCopyWith<$Res> {
  factory _$$_LikeCopyWith(_$_Like value, $Res Function(_$_Like) then) =
      __$$_LikeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$_LikeCopyWithImpl<$Res>
    extends _$LikeArticleWatcherEventCopyWithImpl<$Res, _$_Like>
    implements _$$_LikeCopyWith<$Res> {
  __$$_LikeCopyWithImpl(_$_Like _value, $Res Function(_$_Like) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$_Like(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Like implements _Like {
  const _$_Like(this.id);

  @override
  final String id;

  @override
  String toString() {
    return 'LikeArticleWatcherEvent.like(id: $id)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Like &&
            (identical(other.id, id) || other.id == id));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LikeCopyWith<_$_Like> get copyWith =>
      __$$_LikeCopyWithImpl<_$_Like>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String id) fetch,
    required TResult Function(String id) like,
  }) {
    return like(id);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String id)? fetch,
    TResult? Function(String id)? like,
  }) {
    return like?.call(id);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String id)? fetch,
    TResult Function(String id)? like,
    required TResult orElse(),
  }) {
    if (like != null) {
      return like(id);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Fetch value) fetch,
    required TResult Function(_Like value) like,
  }) {
    return like(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Fetch value)? fetch,
    TResult? Function(_Like value)? like,
  }) {
    return like?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Fetch value)? fetch,
    TResult Function(_Like value)? like,
    required TResult orElse(),
  }) {
    if (like != null) {
      return like(this);
    }
    return orElse();
  }
}

abstract class _Like implements LikeArticleWatcherEvent {
  const factory _Like(final String id) = _$_Like;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$_LikeCopyWith<_$_Like> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$LikeArticleWatcherState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unliked,
    required TResult Function() liked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unliked,
    TResult? Function()? liked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unliked,
    TResult Function()? liked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unliked value) unliked,
    required TResult Function(_Liked value) liked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unliked value)? unliked,
    TResult? Function(_Liked value)? liked,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unliked value)? unliked,
    TResult Function(_Liked value)? liked,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LikeArticleWatcherStateCopyWith<$Res> {
  factory $LikeArticleWatcherStateCopyWith(LikeArticleWatcherState value,
          $Res Function(LikeArticleWatcherState) then) =
      _$LikeArticleWatcherStateCopyWithImpl<$Res, LikeArticleWatcherState>;
}

/// @nodoc
class _$LikeArticleWatcherStateCopyWithImpl<$Res,
        $Val extends LikeArticleWatcherState>
    implements $LikeArticleWatcherStateCopyWith<$Res> {
  _$LikeArticleWatcherStateCopyWithImpl(this._value, this._then);

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
    extends _$LikeArticleWatcherStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'LikeArticleWatcherState.initial()';
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
    required TResult Function() unliked,
    required TResult Function() liked,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unliked,
    TResult? Function()? liked,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unliked,
    TResult Function()? liked,
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
    required TResult Function(_Unliked value) unliked,
    required TResult Function(_Liked value) liked,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unliked value)? unliked,
    TResult? Function(_Liked value)? liked,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unliked value)? unliked,
    TResult Function(_Liked value)? liked,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements LikeArticleWatcherState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_UnlikedCopyWith<$Res> {
  factory _$$_UnlikedCopyWith(
          _$_Unliked value, $Res Function(_$_Unliked) then) =
      __$$_UnlikedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_UnlikedCopyWithImpl<$Res>
    extends _$LikeArticleWatcherStateCopyWithImpl<$Res, _$_Unliked>
    implements _$$_UnlikedCopyWith<$Res> {
  __$$_UnlikedCopyWithImpl(_$_Unliked _value, $Res Function(_$_Unliked) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Unliked implements _Unliked {
  const _$_Unliked();

  @override
  String toString() {
    return 'LikeArticleWatcherState.unliked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Unliked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unliked,
    required TResult Function() liked,
  }) {
    return unliked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unliked,
    TResult? Function()? liked,
  }) {
    return unliked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unliked,
    TResult Function()? liked,
    required TResult orElse(),
  }) {
    if (unliked != null) {
      return unliked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unliked value) unliked,
    required TResult Function(_Liked value) liked,
  }) {
    return unliked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unliked value)? unliked,
    TResult? Function(_Liked value)? liked,
  }) {
    return unliked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unliked value)? unliked,
    TResult Function(_Liked value)? liked,
    required TResult orElse(),
  }) {
    if (unliked != null) {
      return unliked(this);
    }
    return orElse();
  }
}

abstract class _Unliked implements LikeArticleWatcherState {
  const factory _Unliked() = _$_Unliked;
}

/// @nodoc
abstract class _$$_LikedCopyWith<$Res> {
  factory _$$_LikedCopyWith(_$_Liked value, $Res Function(_$_Liked) then) =
      __$$_LikedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LikedCopyWithImpl<$Res>
    extends _$LikeArticleWatcherStateCopyWithImpl<$Res, _$_Liked>
    implements _$$_LikedCopyWith<$Res> {
  __$$_LikedCopyWithImpl(_$_Liked _value, $Res Function(_$_Liked) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Liked implements _Liked {
  const _$_Liked();

  @override
  String toString() {
    return 'LikeArticleWatcherState.liked()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Liked);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() unliked,
    required TResult Function() liked,
  }) {
    return liked();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? unliked,
    TResult? Function()? liked,
  }) {
    return liked?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? unliked,
    TResult Function()? liked,
    required TResult orElse(),
  }) {
    if (liked != null) {
      return liked();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Unliked value) unliked,
    required TResult Function(_Liked value) liked,
  }) {
    return liked(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Unliked value)? unliked,
    TResult? Function(_Liked value)? liked,
  }) {
    return liked?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Unliked value)? unliked,
    TResult Function(_Liked value)? liked,
    required TResult orElse(),
  }) {
    if (liked != null) {
      return liked(this);
    }
    return orElse();
  }
}

abstract class _Liked implements LikeArticleWatcherState {
  const factory _Liked() = _$_Liked;
}
