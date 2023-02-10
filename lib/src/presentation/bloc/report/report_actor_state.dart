part of 'report_actor_bloc.dart';

@freezed
class ReportActorState with _$ReportActorState {
  const factory ReportActorState.initial() = _Initial;
  const factory ReportActorState.loading() = _Loading;
  const factory ReportActorState.error(String message) = _Error;
  const factory ReportActorState.success() = _Success;
}
