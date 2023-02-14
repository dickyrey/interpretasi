import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/domain/usecases/comment_article/send_comment.dart';

part 'send_comment_actor_event.dart';
part 'send_comment_actor_state.dart';
part 'send_comment_actor_bloc.freezed.dart';

class SendCommentActorBloc
    extends Bloc<SendCommentActorEvent, SendCommentActorState> {
  SendCommentActorBloc(this._sendComment)
      : super(const SendCommentActorState.initial()) {
    on<SendCommentActorEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(const SendCommentActorState.initial());
        },
        sendComment: (event) async {
          final result = await _sendComment.execute(
            id: event.id,
            comment: event.comment,
          );

          result.fold(
            (f) => emit(SendCommentActorState.error(f.message)),
            (_) => emit(const SendCommentActorState.success()),
          );
        },
      );
    });
  }
  final SendComment _sendComment;
}
