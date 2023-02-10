// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_actor_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportActorEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String id, String reason) reportArticle,
    required TResult Function(int id, String reason) reportAuthor,
    required TResult Function(String url, int commentId, String reason)
        reportComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String id, String reason)? reportArticle,
    TResult? Function(int id, String reason)? reportAuthor,
    TResult? Function(String url, int commentId, String reason)? reportComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String id, String reason)? reportArticle,
    TResult Function(int id, String reason)? reportAuthor,
    TResult Function(String url, int commentId, String reason)? reportComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ReportArticle value) reportArticle,
    required TResult Function(_ReportAuthor value) reportAuthor,
    required TResult Function(_ReportComment value) reportComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ReportArticle value)? reportArticle,
    TResult? Function(_ReportAuthor value)? reportAuthor,
    TResult? Function(_ReportComment value)? reportComment,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ReportArticle value)? reportArticle,
    TResult Function(_ReportAuthor value)? reportAuthor,
    TResult Function(_ReportComment value)? reportComment,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportActorEventCopyWith<$Res> {
  factory $ReportActorEventCopyWith(
          ReportActorEvent value, $Res Function(ReportActorEvent) then) =
      _$ReportActorEventCopyWithImpl<$Res, ReportActorEvent>;
}

/// @nodoc
class _$ReportActorEventCopyWithImpl<$Res, $Val extends ReportActorEvent>
    implements $ReportActorEventCopyWith<$Res> {
  _$ReportActorEventCopyWithImpl(this._value, this._then);

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
    extends _$ReportActorEventCopyWithImpl<$Res, _$_Init>
    implements _$$_InitCopyWith<$Res> {
  __$$_InitCopyWithImpl(_$_Init _value, $Res Function(_$_Init) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Init implements _Init {
  const _$_Init();

  @override
  String toString() {
    return 'ReportActorEvent.init()';
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
    required TResult Function(String id, String reason) reportArticle,
    required TResult Function(int id, String reason) reportAuthor,
    required TResult Function(String url, int commentId, String reason)
        reportComment,
  }) {
    return init();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String id, String reason)? reportArticle,
    TResult? Function(int id, String reason)? reportAuthor,
    TResult? Function(String url, int commentId, String reason)? reportComment,
  }) {
    return init?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String id, String reason)? reportArticle,
    TResult Function(int id, String reason)? reportAuthor,
    TResult Function(String url, int commentId, String reason)? reportComment,
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
    required TResult Function(_ReportArticle value) reportArticle,
    required TResult Function(_ReportAuthor value) reportAuthor,
    required TResult Function(_ReportComment value) reportComment,
  }) {
    return init(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ReportArticle value)? reportArticle,
    TResult? Function(_ReportAuthor value)? reportAuthor,
    TResult? Function(_ReportComment value)? reportComment,
  }) {
    return init?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ReportArticle value)? reportArticle,
    TResult Function(_ReportAuthor value)? reportAuthor,
    TResult Function(_ReportComment value)? reportComment,
    required TResult orElse(),
  }) {
    if (init != null) {
      return init(this);
    }
    return orElse();
  }
}

abstract class _Init implements ReportActorEvent {
  const factory _Init() = _$_Init;
}

/// @nodoc
abstract class _$$_ReportArticleCopyWith<$Res> {
  factory _$$_ReportArticleCopyWith(
          _$_ReportArticle value, $Res Function(_$_ReportArticle) then) =
      __$$_ReportArticleCopyWithImpl<$Res>;
  @useResult
  $Res call({String id, String reason});
}

/// @nodoc
class __$$_ReportArticleCopyWithImpl<$Res>
    extends _$ReportActorEventCopyWithImpl<$Res, _$_ReportArticle>
    implements _$$_ReportArticleCopyWith<$Res> {
  __$$_ReportArticleCopyWithImpl(
      _$_ReportArticle _value, $Res Function(_$_ReportArticle) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reason = null,
  }) {
    return _then(_$_ReportArticle(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReportArticle implements _ReportArticle {
  const _$_ReportArticle({required this.id, required this.reason});

  @override
  final String id;
  @override
  final String reason;

  @override
  String toString() {
    return 'ReportActorEvent.reportArticle(id: $id, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportArticle &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportArticleCopyWith<_$_ReportArticle> get copyWith =>
      __$$_ReportArticleCopyWithImpl<_$_ReportArticle>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String id, String reason) reportArticle,
    required TResult Function(int id, String reason) reportAuthor,
    required TResult Function(String url, int commentId, String reason)
        reportComment,
  }) {
    return reportArticle(id, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String id, String reason)? reportArticle,
    TResult? Function(int id, String reason)? reportAuthor,
    TResult? Function(String url, int commentId, String reason)? reportComment,
  }) {
    return reportArticle?.call(id, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String id, String reason)? reportArticle,
    TResult Function(int id, String reason)? reportAuthor,
    TResult Function(String url, int commentId, String reason)? reportComment,
    required TResult orElse(),
  }) {
    if (reportArticle != null) {
      return reportArticle(id, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ReportArticle value) reportArticle,
    required TResult Function(_ReportAuthor value) reportAuthor,
    required TResult Function(_ReportComment value) reportComment,
  }) {
    return reportArticle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ReportArticle value)? reportArticle,
    TResult? Function(_ReportAuthor value)? reportAuthor,
    TResult? Function(_ReportComment value)? reportComment,
  }) {
    return reportArticle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ReportArticle value)? reportArticle,
    TResult Function(_ReportAuthor value)? reportAuthor,
    TResult Function(_ReportComment value)? reportComment,
    required TResult orElse(),
  }) {
    if (reportArticle != null) {
      return reportArticle(this);
    }
    return orElse();
  }
}

abstract class _ReportArticle implements ReportActorEvent {
  const factory _ReportArticle(
      {required final String id,
      required final String reason}) = _$_ReportArticle;

  String get id;
  String get reason;
  @JsonKey(ignore: true)
  _$$_ReportArticleCopyWith<_$_ReportArticle> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportAuthorCopyWith<$Res> {
  factory _$$_ReportAuthorCopyWith(
          _$_ReportAuthor value, $Res Function(_$_ReportAuthor) then) =
      __$$_ReportAuthorCopyWithImpl<$Res>;
  @useResult
  $Res call({int id, String reason});
}

/// @nodoc
class __$$_ReportAuthorCopyWithImpl<$Res>
    extends _$ReportActorEventCopyWithImpl<$Res, _$_ReportAuthor>
    implements _$$_ReportAuthorCopyWith<$Res> {
  __$$_ReportAuthorCopyWithImpl(
      _$_ReportAuthor _value, $Res Function(_$_ReportAuthor) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reason = null,
  }) {
    return _then(_$_ReportAuthor(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReportAuthor implements _ReportAuthor {
  const _$_ReportAuthor({required this.id, required this.reason});

  @override
  final int id;
  @override
  final String reason;

  @override
  String toString() {
    return 'ReportActorEvent.reportAuthor(id: $id, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportAuthor &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportAuthorCopyWith<_$_ReportAuthor> get copyWith =>
      __$$_ReportAuthorCopyWithImpl<_$_ReportAuthor>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String id, String reason) reportArticle,
    required TResult Function(int id, String reason) reportAuthor,
    required TResult Function(String url, int commentId, String reason)
        reportComment,
  }) {
    return reportAuthor(id, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String id, String reason)? reportArticle,
    TResult? Function(int id, String reason)? reportAuthor,
    TResult? Function(String url, int commentId, String reason)? reportComment,
  }) {
    return reportAuthor?.call(id, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String id, String reason)? reportArticle,
    TResult Function(int id, String reason)? reportAuthor,
    TResult Function(String url, int commentId, String reason)? reportComment,
    required TResult orElse(),
  }) {
    if (reportAuthor != null) {
      return reportAuthor(id, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ReportArticle value) reportArticle,
    required TResult Function(_ReportAuthor value) reportAuthor,
    required TResult Function(_ReportComment value) reportComment,
  }) {
    return reportAuthor(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ReportArticle value)? reportArticle,
    TResult? Function(_ReportAuthor value)? reportAuthor,
    TResult? Function(_ReportComment value)? reportComment,
  }) {
    return reportAuthor?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ReportArticle value)? reportArticle,
    TResult Function(_ReportAuthor value)? reportAuthor,
    TResult Function(_ReportComment value)? reportComment,
    required TResult orElse(),
  }) {
    if (reportAuthor != null) {
      return reportAuthor(this);
    }
    return orElse();
  }
}

abstract class _ReportAuthor implements ReportActorEvent {
  const factory _ReportAuthor(
      {required final int id, required final String reason}) = _$_ReportAuthor;

  int get id;
  String get reason;
  @JsonKey(ignore: true)
  _$$_ReportAuthorCopyWith<_$_ReportAuthor> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_ReportCommentCopyWith<$Res> {
  factory _$$_ReportCommentCopyWith(
          _$_ReportComment value, $Res Function(_$_ReportComment) then) =
      __$$_ReportCommentCopyWithImpl<$Res>;
  @useResult
  $Res call({String url, int commentId, String reason});
}

/// @nodoc
class __$$_ReportCommentCopyWithImpl<$Res>
    extends _$ReportActorEventCopyWithImpl<$Res, _$_ReportComment>
    implements _$$_ReportCommentCopyWith<$Res> {
  __$$_ReportCommentCopyWithImpl(
      _$_ReportComment _value, $Res Function(_$_ReportComment) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = null,
    Object? commentId = null,
    Object? reason = null,
  }) {
    return _then(_$_ReportComment(
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      commentId: null == commentId
          ? _value.commentId
          : commentId // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_ReportComment implements _ReportComment {
  const _$_ReportComment(
      {required this.url, required this.commentId, required this.reason});

  @override
  final String url;
  @override
  final int commentId;
  @override
  final String reason;

  @override
  String toString() {
    return 'ReportActorEvent.reportComment(url: $url, commentId: $commentId, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReportComment &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.commentId, commentId) ||
                other.commentId == commentId) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url, commentId, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReportCommentCopyWith<_$_ReportComment> get copyWith =>
      __$$_ReportCommentCopyWithImpl<_$_ReportComment>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() init,
    required TResult Function(String id, String reason) reportArticle,
    required TResult Function(int id, String reason) reportAuthor,
    required TResult Function(String url, int commentId, String reason)
        reportComment,
  }) {
    return reportComment(url, commentId, reason);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? init,
    TResult? Function(String id, String reason)? reportArticle,
    TResult? Function(int id, String reason)? reportAuthor,
    TResult? Function(String url, int commentId, String reason)? reportComment,
  }) {
    return reportComment?.call(url, commentId, reason);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? init,
    TResult Function(String id, String reason)? reportArticle,
    TResult Function(int id, String reason)? reportAuthor,
    TResult Function(String url, int commentId, String reason)? reportComment,
    required TResult orElse(),
  }) {
    if (reportComment != null) {
      return reportComment(url, commentId, reason);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Init value) init,
    required TResult Function(_ReportArticle value) reportArticle,
    required TResult Function(_ReportAuthor value) reportAuthor,
    required TResult Function(_ReportComment value) reportComment,
  }) {
    return reportComment(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Init value)? init,
    TResult? Function(_ReportArticle value)? reportArticle,
    TResult? Function(_ReportAuthor value)? reportAuthor,
    TResult? Function(_ReportComment value)? reportComment,
  }) {
    return reportComment?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Init value)? init,
    TResult Function(_ReportArticle value)? reportArticle,
    TResult Function(_ReportAuthor value)? reportAuthor,
    TResult Function(_ReportComment value)? reportComment,
    required TResult orElse(),
  }) {
    if (reportComment != null) {
      return reportComment(this);
    }
    return orElse();
  }
}

abstract class _ReportComment implements ReportActorEvent {
  const factory _ReportComment(
      {required final String url,
      required final int commentId,
      required final String reason}) = _$_ReportComment;

  String get url;
  int get commentId;
  String get reason;
  @JsonKey(ignore: true)
  _$$_ReportCommentCopyWith<_$_ReportComment> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReportActorState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReportActorStateCopyWith<$Res> {
  factory $ReportActorStateCopyWith(
          ReportActorState value, $Res Function(ReportActorState) then) =
      _$ReportActorStateCopyWithImpl<$Res, ReportActorState>;
}

/// @nodoc
class _$ReportActorStateCopyWithImpl<$Res, $Val extends ReportActorState>
    implements $ReportActorStateCopyWith<$Res> {
  _$ReportActorStateCopyWithImpl(this._value, this._then);

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
    extends _$ReportActorStateCopyWithImpl<$Res, _$_Initial>
    implements _$$_InitialCopyWith<$Res> {
  __$$_InitialCopyWithImpl(_$_Initial _value, $Res Function(_$_Initial) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ReportActorState.initial()';
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
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() success,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? success,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? success,
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
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements ReportActorState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc
abstract class _$$_LoadingCopyWith<$Res> {
  factory _$$_LoadingCopyWith(
          _$_Loading value, $Res Function(_$_Loading) then) =
      __$$_LoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_LoadingCopyWithImpl<$Res>
    extends _$ReportActorStateCopyWithImpl<$Res, _$_Loading>
    implements _$$_LoadingCopyWith<$Res> {
  __$$_LoadingCopyWithImpl(_$_Loading _value, $Res Function(_$_Loading) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Loading implements _Loading {
  const _$_Loading();

  @override
  String toString() {
    return 'ReportActorState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() success,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? success,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements ReportActorState {
  const factory _Loading() = _$_Loading;
}

/// @nodoc
abstract class _$$_ErrorCopyWith<$Res> {
  factory _$$_ErrorCopyWith(_$_Error value, $Res Function(_$_Error) then) =
      __$$_ErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$_ErrorCopyWithImpl<$Res>
    extends _$ReportActorStateCopyWithImpl<$Res, _$_Error>
    implements _$$_ErrorCopyWith<$Res> {
  __$$_ErrorCopyWithImpl(_$_Error _value, $Res Function(_$_Error) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$_Error(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Error implements _Error {
  const _$_Error(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ReportActorState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Error &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      __$$_ErrorCopyWithImpl<_$_Error>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() success,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? success,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _Error implements ReportActorState {
  const factory _Error(final String message) = _$_Error;

  String get message;
  @JsonKey(ignore: true)
  _$$_ErrorCopyWith<_$_Error> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_SuccessCopyWith<$Res> {
  factory _$$_SuccessCopyWith(
          _$_Success value, $Res Function(_$_Success) then) =
      __$$_SuccessCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_SuccessCopyWithImpl<$Res>
    extends _$ReportActorStateCopyWithImpl<$Res, _$_Success>
    implements _$$_SuccessCopyWith<$Res> {
  __$$_SuccessCopyWithImpl(_$_Success _value, $Res Function(_$_Success) _then)
      : super(_value, _then);
}

/// @nodoc

class _$_Success implements _Success {
  const _$_Success();

  @override
  String toString() {
    return 'ReportActorState.success()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Success);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(String message) error,
    required TResult Function() success,
  }) {
    return success();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(String message)? error,
    TResult? Function()? success,
  }) {
    return success?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(String message)? error,
    TResult Function()? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Error value) error,
    required TResult Function(_Success value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Error value)? error,
    TResult? Function(_Success value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Error value)? error,
    TResult Function(_Success value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class _Success implements ReportActorState {
  const factory _Success() = _$_Success;
}
