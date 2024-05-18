import 'package:bloc/bloc.dart';
import 'package:flourish/core/cubit/app_user_cubit.dart';
import 'package:flourish/features/auth/usecases/user_sign_in.dart';
import 'package:flourish/features/auth/usecases/user_sign_up.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserSignUp _userSignUp;
  final UserSignIn _userSignIn;
  final AppUserCubit _appUserCubit;
  AuthBloc(
      UserSignUp userSignUp, AppUserCubit appUserCubit, UserSignIn userSignIn)
      : _userSignUp = userSignUp,
        _appUserCubit = appUserCubit,
        _userSignIn = userSignIn,
        super(AuthInitial()) {
    on<AuthEvent>((event, emit) => emit(AuthLoading()));

    on<AuthSignUp>((event, emit) async {
      final signup_result = await _userSignUp(
          UserSignUpParams(event.email, event.password, event.name));

      signup_result.fold((l) {
        emit(AuthFailure(l.message));
      }, (r) {
        _appUserCubit.updateUser(r);
        emit(AuthSuccess());
      });
    });

    on<AuthSignIn>((event, emit) async {
      final signInResult =
          await _userSignIn(UserSignInParams(event.email, event.password));

      signInResult.fold((l) {
        print("FAILED");
        emit(AuthFailure(l.message));
      }, (r) {
        print("SUCCEEDED");
        _appUserCubit.updateUser(r);
        emit(AuthSuccess());
      });
    });
  }
}
