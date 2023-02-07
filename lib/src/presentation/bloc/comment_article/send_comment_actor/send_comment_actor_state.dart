part of 'send_comment_actor_bloc.dart';

@freezed
class SendCommentActorState with _$SendCommentActorState {
  const factory SendCommentActorState.initial() = _Initial;
  const factory SendCommentActorState.loading() = _Loading;
  const factory SendCommentActorState.error(String msg) = _Error;
  const factory SendCommentActorState.success() = _Success;
}
