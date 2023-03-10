import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:interpretasi/src/common/enums.dart';
import 'package:interpretasi/src/domain/usecases/auth/resend_email_verification.dart';
import 'package:timer_count_down/timer_controller.dart';

part 'email_verification_form_event.dart';
part 'email_verification_form_state.dart';
part 'email_verification_form_bloc.freezed.dart';

@injectable
class EmailVerificationFormBloc
    extends Bloc<EmailVerificationFormEvent, EmailVerificationFormState> {
  EmailVerificationFormBloc(this._resend)
      : super(EmailVerificationFormState.initial()) {
    on<EmailVerificationFormEvent>((event, emit) async {
      await event.map(
        onFinished: (_) {
          emit(
            state.copyWith(
              isTimeoutDone: true,
            ),
          );
        },
        startTimeOut: (e) async {
          emit(
            state.copyWith(
              state: RequestState.loading,
              isSubmit: true,
            ),
          );
          final result = await _resend.execute();
          result.fold(
            (f) => emit(
              state.copyWith(
                state: RequestState.error,
                message: f.message,
                isSubmit: false,
              ),
            ),
            (_) => emit(
              state.copyWith(
                state: RequestState.loaded,
                isSubmit: false,
                isTimeoutDone: false,
              ),
            ),
          );
          e.controller.restart();
          emit(
            state.copyWith(
              isTimeoutDone: false,
              state: RequestState.empty,
              message: '',
            ),
          );
        },
      );
    });
  }
  final ResendEmailVerification _resend;
}
