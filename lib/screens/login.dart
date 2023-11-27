import 'package:flutter/material.dart';
import 'package:login_app/providers/login_form_provider.dart';
import 'package:login_app/services/services.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ChangeNotifierProvider(
            create: (_) => LoginF_Provider(), child: _LoginForm()),
      ),
    );
  }
}

class _LoginForm extends StatelessWidget {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  _LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; //variable
    final loginForm = Provider.of<LoginF_Provider>(context);
    return Center(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: DecoratedBox(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 96, 108, 93)
              // image: DecorationImage(
              //     image: AssetImage('assets/GOT_Poster.jpg'), fit: BoxFit.fill),
              ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 16.0),
                Container(
                  width: size.width * 0.80,
                  height: size.height * 0.25,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/GOT_Logo.png'),
                          fit: BoxFit.contain)),
                ),
                TextFormField(
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
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
                    String pattern =
                        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                    RegExp regExp = RegExp(pattern);
                    return regExp.hasMatch(value ?? '')
                        ? null
                        : 'El valor ingresado no luce como un correo';
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  autocorrect: false,
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
                  //botón por si olvidaste tu contraseña
                  onPressed: () {
                    print('Chale que mal, esta parte está en progreso');
                  },
                  child: const Text(
                    '¿Olvidaste tu contraseña?',
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 244, 244),
                    ),
                  ),
                ), //botón por si olvidaste tu contraseña
                ElevatedButton(
                  //botón para iniciar sesion

                  onPressed: loginForm.isLoading
                      ? null
                      : () async {
                          FocusScope.of(context).unfocus();
                          final authService =
                              Provider.of<AuthService>(context, listen: false);
                          if (!loginForm.isValidForm()) return;
                          loginForm.isLoading = true;
                          final String? errorMessage = await authService.login(
                              loginForm.email, loginForm.password);
                          if (errorMessage == null) {
                            Navigator.pushReplacementNamed(context, 'home');
                          } else {
                            print(errorMessage);
                            NotificationsService.showSnackbar(errorMessage);
                            loginForm.isLoading = false;
                          }
                        },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        Color.fromARGB(255, 255, 244, 244)),
                  ),
                  child: Container(
                      //   Text(
                      //   'Iniciar sesión',
                      //   style: TextStyle(
                      //     fontSize: 25,
                      //     fontWeight: FontWeight.w500,
                      //     color: Color.fromARGB(255, 96, 108, 93),
                      //   ),

                      // )
                      // padding:
                      //     EdgeInsets.symmetric(horizontal: 80, vertical: 15),
                      child: Text(
                    loginForm.isLoading ? 'Espere' : 'Ingresar',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 96, 108, 93),
                    ),
                  )),
                ), //botón para iniciar sesion
                const SizedBox(height: 16.0),
                ElevatedButton(
                    //botón para ir a registrarte
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 255, 244, 244)),
                    ),
                    onPressed: () {
                      // Navegar a la pantalla de registro
                      Navigator.pushNamed(context, 'register', arguments: '');
                    },
                    child: const Text(
                      'Regístrate',
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 96, 108, 93)),
                    )), //botón para ir a registrarte
              ],
            ),
          ),
        ),
      ),
    );
  }
}
