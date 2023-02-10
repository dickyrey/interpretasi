part of 'report_actor_bloc.dart';

@freezed
class ReportActorEvent with _$ReportActorEvent {
  const factory ReportActorEvent.init() = _Init;

  const factory ReportActorEvent.reportArticle({
    required String id,
    required String reason,
  }) = _ReportArticle;

  const factory ReportActorEvent.reportAuthor({
    required int id,
    required String reason,
  }) = _ReportAuthor;

  const factory ReportActorEvent.reportComment({
    required String url,
    required int commentId,
    required String reason,
  }) = _ReportComment;
}
