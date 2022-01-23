import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:sparrow_news_app/repositories/authentication_repository.dart';
import 'package:sparrow_news_app/utils/app_strings.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticationRepository _authenticationRepository;
  LoginBloc()
      : _authenticationRepository =
            AuthenticationRepository(FirebaseAuth.instance),
        super(LoginInitial()) {
    on<LoginAnonymouslyEvent>((event, emit) async {
      try {
        emit(LoginLoadingState());
        final isLoggedIn =
            await _authenticationRepository.signInUserAnonymously();

        isLoggedIn
            ? emit(LoginSuccessfulState())
            : emit(LoginFailureState(message: AppStrings.canNotLogin));
      } catch (e) {
        emit(LoginFailureState(message: AppStrings.unknownErrorOccurred));
        if (kDebugMode) {
          print("LoginBloc | LoginAnonymouslyEvent: $e");
        }
      }
    });
  }
}
