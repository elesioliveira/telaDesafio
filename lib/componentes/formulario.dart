// ignore_for_file: await_only_futures

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;
import 'package:tela_desafio/componentes/paleta_cores.dart';
import 'package:tela_desafio/metodos/formulario.dart';

class SignInFormulario extends StatefulWidget {
  const SignInFormulario({super.key});

  @override
  State<SignInFormulario> createState() => _SignInFormularioState();
}

class _SignInFormularioState extends State<SignInFormulario> {
  final ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  final ValueNotifier<bool> logando = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> estaLogando() async {
    logando.value = !logando.value;
    await Future.delayed(const Duration(seconds: 2));
    logando.value = !logando.value;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: TextFormField(
                controller: _usernameController,
                validator: (value) => userName(value),
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                  hintText: 'Enter email or username',
                ),
                keyboardType: TextInputType.text,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: ListenableBuilder(
                listenable: passwordVisible,
                builder: (context, child) {
                  return TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 4) {
                        return 'minimun caracter';
                      }
                      return null;
                    },
                    obscureText: passwordVisible.value,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        color: passwordVisible.value
                            ? Colors.red.withOpacity(0.5)
                            : Colors.red,
                        onPressed: () {
                          passwordVisible.value = !passwordVisible.value;
                        },
                        icon: passwordVisible.value
                            ? const Icon(Icons.visibility_rounded)
                            : const Icon(Icons.visibility_off_rounded),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          SizedBox(
            child: Center(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.01,
                      height: MediaQuery.sizeOf(context).height * 0.01,
                      child: Checkbox(
                        checkColor: Colors.white,
                        activeColor: Colors.red,
                        value: timeDilation != 1.0,
                        onChanged: (bool? value) {
                          setState(
                            () {
                              timeDilation = value! ? 3.0 : 1.0;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.1,
                  ),
                  SizedBox(
                    child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: ListenableBuilder(
              listenable: logando,
              builder: (context, child) {
                return GestureDetector(
                  onTap: logando.value
                      ? null
                      : () async {
                          if (_formKey.currentState?.validate() ?? false) {
                            await estaLogando();
                            String username = _usernameController.text;
                            String password = _passwordController.text;

                            print('Username: $username, Password: $password');
                          }
                        },
                  child: ListenableBuilder(
                    listenable: logando,
                    builder: (context, child) {
                      return Container(
                        width: MediaQuery.sizeOf(context).width * 0.73,
                        height: MediaQuery.sizeOf(context).height * 0.05,
                        decoration: BoxDecoration(
                          color: logando.value ? Colors.grey : Colors.red,
                          borderRadius: const BorderRadius.all(
                            Radius.circular(30),
                          ),
                        ),
                        child: ListenableBuilder(
                            listenable: logando,
                            builder: (context, child) {
                              return Center(
                                child: logando.value
                                    ? const CircularProgressIndicator(
                                        color: Colors.white,
                                        strokeWidth: 2,
                                      )
                                    : Text(
                                        'Sign In',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w300,
                                          color: Colors.white,
                                          fontSize: MediaQuery.sizeOf(context)
                                                  .height *
                                              0.03,
                                        ),
                                      ),
                              );
                            }),
                      );
                    },
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

class SignUpFormulario extends StatefulWidget {
  const SignUpFormulario({super.key});

  @override
  State<SignUpFormulario> createState() => _SignUpFormularioState();
}

class _SignUpFormularioState extends State<SignUpFormulario> {
  final ValueNotifier<bool> passwordVisible = ValueNotifier(true);
  final ValueNotifier<bool> confirmPasswordVisible = ValueNotifier(true);
  final ValueNotifier<bool> logando = ValueNotifier(false);
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  Future<void> estaLogando() async {
    logando.value = !logando.value;
    await Future.delayed(const Duration(seconds: 2));
    logando.value = !logando.value;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: TextFormField(
                controller: _usernameController,
                validator: (value) => userName(value),
                decoration: const InputDecoration(
                  hintText: 'Enter email or username',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: ListenableBuilder(
                listenable: passwordVisible,
                builder: (context, child) {
                  return TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }

                      if (value.length < 4) {
                        return 'minimun caracter';
                      }

                      if (_passwordController.text ==
                          _confirmPasswordController.text) {
                        return null;
                      } else {
                        return 'different passwords';
                      }
                    },
                    obscureText: passwordVisible.value,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: 'Password',
                      suffixIcon: IconButton(
                        color: passwordVisible.value
                            ? Colors.red.withOpacity(0.5)
                            : Colors.red,
                        onPressed: () {
                          passwordVisible.value = !passwordVisible.value;
                        },
                        icon: passwordVisible.value
                            ? const Icon(Icons.visibility_rounded)
                            : const Icon(Icons.visibility_off_rounded),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: ListenableBuilder(
                listenable: confirmPasswordVisible,
                builder: (context, child) {
                  return TextFormField(
                    controller: _confirmPasswordController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 4) {
                        return 'minimun caracter';
                      }
                      if (_passwordController.text ==
                          _confirmPasswordController.text) {
                        return null;
                      } else {
                        return 'different passwords';
                      }
                    },
                    obscureText: confirmPasswordVisible.value,
                    decoration: InputDecoration(
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                      ),
                      hintText: 'Confirm Password',
                      suffixIcon: IconButton(
                        color: confirmPasswordVisible.value
                            ? Colors.red.withOpacity(0.5)
                            : Colors.red,
                        onPressed: () {
                          confirmPasswordVisible.value =
                              !confirmPasswordVisible.value;
                        },
                        icon: confirmPasswordVisible.value
                            ? const Icon(Icons.visibility_rounded)
                            : const Icon(Icons.visibility_off_rounded),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.73,
              height: MediaQuery.sizeOf(context).height * 0.05,
              decoration: const BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: Center(
                  child: Center(
                child: ListenableBuilder(
                  listenable: logando,
                  builder: (context, child) {
                    return GestureDetector(
                      onTap: logando.value
                          ? null
                          : () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                await estaLogando();
                                String username = _usernameController.text;
                                String password = _passwordController.text;

                                print(
                                    'Username: $username, Password: $password');
                              }
                            },
                      child: ListenableBuilder(
                        listenable: logando,
                        builder: (context, child) {
                          return Container(
                            width: MediaQuery.sizeOf(context).width * 0.73,
                            height: MediaQuery.sizeOf(context).height * 0.05,
                            decoration: BoxDecoration(
                              color: logando.value
                                  ? Colors.grey
                                  : PaletaDeCores.vermelho,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: ListenableBuilder(
                                listenable: logando,
                                builder: (context, child) {
                                  return Center(
                                    child: logando.value
                                        ? const CircularProgressIndicator(
                                            color: Colors.white,
                                            strokeWidth: 2,
                                          )
                                        : Text(
                                            'Sign Up',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              color: Colors.white,
                                              fontSize:
                                                  MediaQuery.sizeOf(context)
                                                          .height *
                                                      0.03,
                                            ),
                                          ),
                                  );
                                }),
                          );
                        },
                      ),
                    );
                  },
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}

class CarregandoFormulario extends StatefulWidget {
  const CarregandoFormulario({super.key});

  @override
  State<CarregandoFormulario> createState() => _CarregandoFormularioState();
}

class _CarregandoFormularioState extends State<CarregandoFormulario> {
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: TextFormField(
                decoration:
                    const InputDecoration(hintText: 'Enter email or username'),
                keyboardType: TextInputType.emailAddress,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_rounded),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Center(
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.visibility_rounded),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Container(
              width: MediaQuery.sizeOf(context).width * 0.73,
              height: MediaQuery.sizeOf(context).height * 0.05,
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
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: MediaQuery.sizeOf(context).height * 0.03),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
