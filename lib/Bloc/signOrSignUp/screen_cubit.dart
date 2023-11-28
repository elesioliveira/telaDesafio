import 'package:bloc/bloc.dart';

import 'package:tela_desafio/Bloc/signOrSignUp/screen_state.dart';

class LoginOrSignUpScreen extends Cubit<LoginOrSignUpState> {
  LoginOrSignUpScreen() : super(InitialScreen());

  Future<void> signInScreen() async {
    emit(LoadingScreen());
    await Future.delayed(const Duration(milliseconds: 2));
    emit(SignInScreen());
  }

  Future<void> signUpScreen() async {
    emit(LoadingScreen());
    await Future.delayed(const Duration(milliseconds: 2));
    emit(SignUpScreen());
  }
}
