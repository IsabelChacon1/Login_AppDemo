import 'package:flutter/material.dart';
import 'package:login_app/providers/login_form_provider.dart';
import 'package:login_app/screens/principal.dart';
import 'package:login_app/screens/registro.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // final loginForm = Provider.of<LoginFormProvider>(context);

    return Center(
        child: Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(color: Color.fromARGB(255, 96, 108, 93)
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
                height: size.height * 0.17,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/GOT_Logo.png'),
                        fit: BoxFit.fill)),
              ),
              Container(
                width: size.width * 0.80,
                height: size.height * 0.05,
                alignment: Alignment.center,
              ),
              TextFormField(
                autocorrect: false,
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: 'ejemplo@gmail.com',
                  labelText: 'Email',
                  labelStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 255, 244, 244),
                  ),
                ),
                //onChanged: (value) => loginForm.email = value,
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
                ),
                // onChanged: (value) => loginForm.password = value,
                validator: (value) {
                  return (value != null && value.length >= 8)
                      ? null
                      : 'La contraseña debe de ser de 8 caracteres';
                },
              ),
              const SizedBox(height: 16.0),
              TextButton(
                onPressed: () {
                  print('Chale que mal, suerte papito');
                },
                child: const Text(
                  '¿Olvidaste tu contraseña?',
                  style: TextStyle(
                    color: Color.fromARGB(255, 255, 244, 244),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                  //Aquí verificas si está iniciada la sesion y te manda a la pantalla de inicio de la app
                  //Si requisitos ok mandalo a principal
                  PrincipalScr();
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 244, 244)),
                ),
                child: const Text(
                  'Iniciar sesión',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 96, 108, 93),
                  ),
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
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
                  )),
            ],
          ),
        ),
      ),
    ));
  }
}
