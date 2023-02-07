part of 'auth_watcher_bloc.dart';

@freezed
class AuthWatcherEvent with _$AuthWatcherEvent {
  const factory AuthWatcherEvent.check() = _Check;
  const factory AuthWatcherEvent.signOut() = _SignOut;
}
