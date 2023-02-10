import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/domain/usecases/article/report_article.dart';
import 'package:interpretasi/src/domain/usecases/author/report_author.dart';

part 'report_actor_event.dart';
part 'report_actor_state.dart';
part 'report_actor_bloc.freezed.dart';

class ReportActorBloc extends Bloc<ReportActorEvent, ReportActorState> {
  ReportActorBloc({
    required this.article,
    required this.author,
  }) : super(const _Initial()) {
    on<ReportActorEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(const ReportActorState.initial());
        },
        reportArticle: (event) async {
          emit(const ReportActorState.loading());

          final id = event.id.replaceFirst(Const.unusedPath, '');
          final result = await article.execute(id: id, reason: event.reason);
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
      );
    });
  }
  final ReportArticle article;
  final ReportAuthor author;
}
