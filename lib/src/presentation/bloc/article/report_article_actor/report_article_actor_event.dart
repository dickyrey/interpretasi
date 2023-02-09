part of 'report_article_actor_bloc.dart';

@freezed
class ReportArticleActorEvent with _$ReportArticleActorEvent {
  const factory ReportArticleActorEvent.init() = _Init;
  const factory ReportArticleActorEvent.report({
    required String id,
    required String reason,
  }) = _Report;
}
