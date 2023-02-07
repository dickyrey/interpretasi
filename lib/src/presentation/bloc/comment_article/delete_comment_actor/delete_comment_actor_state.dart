part of 'delete_comment_actor_bloc.dart';

@freezed
class DeleteCommentActorState with _$DeleteCommentActorState {
  const factory DeleteCommentActorState.initial() = _Initial;
  const factory DeleteCommentActorState.loading() = _Loading;
  const factory DeleteCommentActorState.error(String message) = _Error;
  const factory DeleteCommentActorState.success() = _Success;
}
