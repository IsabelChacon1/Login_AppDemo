import 'package:flutter/material.dart';
import 'package:login_app/login.dart';

class RegistroPage extends StatelessWidget {
  RegistroPage({super.key});
  final TextEditingController _nickController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: DecoratedBox(
      decoration: const BoxDecoration(color: Color.fromARGB(255, 96, 108, 93)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            TextField(
              controller: _nickController,
              decoration: const InputDecoration(
                labelText: 'Nombre',
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 255, 244, 244),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 255, 244, 244),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Contraseña',
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 255, 244, 244),
                ),
              ),
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
              onPressed: () async {
                //Aquí la validación
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
