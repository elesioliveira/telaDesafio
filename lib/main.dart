import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tela_desafio/Bloc/signOrSignUp/screen_cubit.dart';
import 'package:tela_desafio/Bloc/signOrSignUp/screen_state.dart';
import 'package:tela_desafio/componentes/formulario.dart';
import 'package:tela_desafio/componentes/paleta_cores.dart';
import 'package:tela_desafio/componentes/redes_sociais_login.dart';
import 'package:tela_desafio/componentes/signin_or_signup.dart';
import 'componentes/logo_headbar.dart';

void main() {
  debugPaintSizeEnabled = false;

  debugPaintBaselinesEnabled = false;

  debugPaintLayerBordersEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginOrSignUpScreen(),
      child: MaterialApp(
        theme: ThemeData(
          primaryColor: PaletaDeCores.vermelho,
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  late final LoginOrSignUpScreen cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<LoginOrSignUpScreen>(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          // mainAxisSize: MainAxisSize.max,
          children: [
            const Positioned(
              top: -450,
              right: -20,
              left: -20,
              child: Logo(),
            ),
            Positioned(
              top: 160,
              right: -5,
              left: -5,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 20, bottom: 50),
                child: Container(
                  height: MediaQuery.sizeOf(context).height / 1.5,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(35, 158, 158, 158),
                        blurRadius: 8,
                        spreadRadius: 15,
                        offset: Offset(0.0, 0.0),
                      )
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      BlocBuilder(
                          bloc: cubit,
                          builder: (context, state) {
                            if (state is InitialScreen) {
                              return SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.08,
                                child: const SignIn(),
                              );
                            } else if (state is LoadingScreen) {
                              return SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.08,
                                child: const Carregando(),
                              );
                            } else if (state is SignInScreen) {
                              return SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.08,
                                child: const SignIn(),
                              );
                            } else if (state is SignUpScreen) {
                              return SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.08,
                                child: const SignUp(),
                              );
                            } else {
                              return SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.8,
                                height:
                                    MediaQuery.sizeOf(context).height * 0.08,
                                child: const SignIn(),
                              );
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder(
                        bloc: cubit,
                        builder: (context, state) {
                          if (state is InitialScreen) {
                            return const SignInFormulario();
                          } else if (state is LoadingScreen) {
                            return const CarregandoFormulario();
                          } else if (state is SignInScreen) {
                            return const SignInFormulario();
                          } else if (state is SignUpScreen) {
                            return const SignUpFormulario();
                          } else {
                            return const SignInFormulario();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 1,
                            width: MediaQuery.sizeOf(context).width * 0.01,
                            color: Colors.grey,
                          ),
                          const Text('OR'),
                          Container(
                            height: 1,
                            width: MediaQuery.sizeOf(context).width * 0.01,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      const IconsLogin(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
