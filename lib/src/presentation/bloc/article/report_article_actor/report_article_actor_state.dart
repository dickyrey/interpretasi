part of 'report_article_actor_bloc.dart';

@freezed
class ReportArticleActorState with _$ReportArticleActorState {
  const factory ReportArticleActorState.initial() = _Initial;
  const factory ReportArticleActorState.loading() = _Loading;
  const factory ReportArticleActorState.error(String message) = _Error;
  const factory ReportArticleActorState.success() = _Success;
}
