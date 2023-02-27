import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/usecases/comment_article/delete_comment.dart';

part 'delete_comment_actor_event.dart';
part 'delete_comment_actor_state.dart';
part 'delete_comment_actor_bloc.freezed.dart';

@injectable
class DeleteCommentActorBloc extends Bloc<DeleteCommentActorEvent, DeleteCommentActorState> {
  DeleteCommentActorBloc(this._deleteComment) : super(const DeleteCommentActorState.initial()) {
    on<DeleteCommentActorEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(const DeleteCommentActorState.initial());
        },
        delete: (event) async {
          final result = await _deleteComment.execute(
            id: event.id,
            userId: event.userId,
          );

          result.fold(
            (f) => emit(DeleteCommentActorState.error(f.message)),
            (_) => emit(const DeleteCommentActorState.success()),
          );
        },
      );
    });
  }
  final DeleteComment _deleteComment;
}
