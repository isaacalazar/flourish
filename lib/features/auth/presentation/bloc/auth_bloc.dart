import 'package:bloc/bloc.dart';
import 'package:flourish/features/auth/usecases/sign_user_in.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;

  AuthBloc(UserSignUp userSignUp)
      : _userSignUp = userSignUp,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(AuthLoading()));

    on<AuthSignUp>((event, emit) async {
      final signup_result = await _userSignUp(
          UserSignUpParams(event.email, event.password, event.name));

      signup_result.fold((l) {
        emit(AuthFailure(l.message));
      }, (r) {
        emit(AuthSuccess());
      });
    });
  }
}
