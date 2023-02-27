import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/domain/usecases/article/report_article.dart';
import 'package:interpretasi/src/domain/usecases/author/report_author.dart';
import 'package:interpretasi/src/domain/usecases/comment_article/report_comment.dart';

part 'report_actor_event.dart';
part 'report_actor_state.dart';
part 'report_actor_bloc.freezed.dart';

@injectable
class ReportActorBloc extends Bloc<ReportActorEvent, ReportActorState> {
  ReportActorBloc({
    required this.article,
    required this.author,
    required this.comment,
  }) : super(const _Initial()) {
    on<ReportActorEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(const ReportActorState.initial());
        },
        reportArticle: (event) async {
          emit(const ReportActorState.loading());

          final result = await article.execute(
            id: event.id,
            reason: event.reason,
          );
          result.fold(
            (f) => emit(ReportActorState.error(f.message)),
            (_) => emit(const ReportActorState.success()),
          );
        },
        reportAuthor: (event) async {
          emit(const ReportActorState.loading());

          final result = await author.execute(
            id: event.id,
            reason: event.reason,
          );
          result.fold(
            (f) => emit(ReportActorState.error(f.message)),
            (_) => emit(const ReportActorState.success()),
          );
        },
        reportComment: (event) async {
          emit(const ReportActorState.loading());

          final result = await comment.execute(
            articleId: event.url,
            commentId: event.commentId,
            reason: event.reason,
          );
          result.fold(
            (f) => emit(ReportActorState.error(f.message)),
            (_) => emit(const ReportActorState.success()),
          );
        },
      );
    });
  }
  final ReportArticle article;
  final ReportAuthor author;
  final ReportComment comment;
}
