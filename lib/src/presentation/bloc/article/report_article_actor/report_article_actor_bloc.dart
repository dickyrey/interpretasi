import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:interpretasi/src/common/const.dart';
import 'package:interpretasi/src/domain/usecases/article/report_article.dart';

part 'report_article_actor_event.dart';
part 'report_article_actor_state.dart';
part 'report_article_actor_bloc.freezed.dart';

class ReportArticleActorBloc
    extends Bloc<ReportArticleActorEvent, ReportArticleActorState> {
  ReportArticleActorBloc(this._report) : super(const _Initial()) {
    on<ReportArticleActorEvent>((event, emit) async {
      await event.map(
        init: (_) {
          emit(const ReportArticleActorState.initial());
        },
        report: (event) async {
          emit(const ReportArticleActorState.loading());

          final id = event.id.replaceFirst(Const.unusedPath, '');
          final result = await _report.execute(id: id, reason: event.reason);
          result.fold(
            (f) => emit(ReportArticleActorState.error(f.message)),
            (_) => emit(const ReportArticleActorState.success()),
          );
        },
      );
    });
  }
  final ReportArticle _report;
}
