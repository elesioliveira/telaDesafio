import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tela_desafio/Bloc/signOrSignUp/screen_cubit.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  late final LoginOrSignUpScreen cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<LoginOrSignUpScreen>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 30,
          child: GestureDetector(
            onTap: () {
              cubit.signUpScreen();
            },
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(width: 0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width * 0.07),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: MediaQuery.sizeOf(context).width * 0.05),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 30,
          child: Container(
            width: 150,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                'Sign In',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.sizeOf(context).width * 0.05),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late final LoginOrSignUpScreen cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<LoginOrSignUpScreen>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 30,
          child: GestureDetector(
            onTap: () {
              cubit.signInScreen();
            },
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.sizeOf(context).width * 0.07),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                      fontSize: MediaQuery.sizeOf(context).width * 0.05,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          child: Container(
            width: 150,
            height: 50,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(30),
              ),
            ),
            child: Center(
              child: Text(
                'Sign Up',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: MediaQuery.sizeOf(context).width * 0.05,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Carregando extends StatefulWidget {
  const Carregando({super.key});

  @override
  State<Carregando> createState() => _CarregandoState();
}

class _CarregandoState extends State<Carregando> {
  late final LoginOrSignUpScreen cubit;
  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<LoginOrSignUpScreen>(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          left: 30,
          child: Opacity(
            opacity: 0,
            child: Container(
              width: 150,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0.2),
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(
                      right: MediaQuery.sizeOf(context).width * 0.07),
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: MediaQuery.sizeOf(context).width * 0.05,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          right: 30,
          child: Opacity(
            opacity: 0,
            child: Container(
              width: 150,
              height: 50,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Center(
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.sizeOf(context).width * 0.05,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
