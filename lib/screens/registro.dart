import 'package:flutter/material.dart';
import 'package:login_app/providers/login_form_provider.dart';
import 'package:provider/provider.dart';

import '../services/services.dart';

class RegistroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ChangeNotifierProvider(
            create: (_) => LoginF_Provider(), child: _RegistroPage()),
      ),
    );
  }
}

class _RegistroPage extends StatelessWidget {
  _RegistroPage({super.key});
  final TextEditingController _nickController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginF_Provider>(context);
    final size = MediaQuery.of(context).size;
    return Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DecoratedBox(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 96, 108, 93)),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  width: size.width * 0.80,
                  height: size.height * 0.13,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/GOT_Logo.png'),
                          fit: BoxFit.contain)),
                ),
                // Container(
                //   width: size.width * 0.80,
                //   height: size.height * 0.05,
                //   alignment: Alignment.center,
                // ),
                TextFormField(
                  controller: _nickController,
                  decoration: const InputDecoration(
                    labelText: 'Usuario',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 244, 244),
                    ),
                  ),
                  validator: (value) {
                    return (value != null && value.length > 3)
                        ? null
                        : 'El nombre debe tener minimo 3 caracteres';
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    hintText: 'ejemplo@gmail.com',
                    hintStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Color.fromARGB(255, 255, 244, 244),
                    ),
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 244, 244),
                    ),
                  ),
                  onChanged: (value) => loginForm.email = value,
                  validator: (value) {
                    String pattern = //expresion regular pal correo
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El valor ingresado no luce como un correo';
                  },
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                      hintText: '********',
                      labelText: 'Contraseña',
                      labelStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color.fromARGB(255, 255, 244, 244),
                      ),
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        color: Color.fromARGB(255, 255, 244, 244),
                      )),
                  onChanged: (value) => loginForm.password = value,
                  validator: (value) {
                    return (value != null && value.length >= 8)
                        ? null
                        : 'La contraseña debe de ser de 8 caracteres';
                  },
                ),
                const SizedBox(height: 16.0),
                TextButton(
                  onPressed: () {
                    print('no que no');
                    Navigator.pushNamed(context, 'login', arguments: '');
                  },
                  child: const Text(
                    '¿Si tienes cuenta? Inicia sesión',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 244, 244),
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 255, 244, 244)),
                  ),
                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final authService =
                              Provider.of<AuthService>(context, listen: false);

                          if (!loginForm.isValidForm()) return;
                          loginForm.isLoading = true;
                          // TODO: validar si el login es correcto
                          final String? errorMessage = await authService
                              .createUser(loginForm.email, loginForm.password);
                          if (errorMessage == null) {
                            Navigator.pushReplacementNamed(context, 'home');
                          } else {
                            // TODO: mostrar error en pantalla
                            print(errorMessage);
                            loginForm.isLoading = false;
                          }
                        },
                  child: const Text(
                    'Registrar',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 96, 108, 93),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
