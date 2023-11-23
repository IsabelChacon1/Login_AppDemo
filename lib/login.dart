import 'package:flutter/material.dart';
import 'package:login_app/registro.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Login Frases GOT',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 252, 254, 240),
          ),
          textAlign: TextAlign.center,
        )),
        backgroundColor: const Color.fromARGB(255, 192, 146, 59),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: size.width * 0.80,
              height: size.height * 0.20,
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
              controller: _emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(255, 0, 0, 0),
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
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                print('Chale que mal');
              },
              child: const Text('¿Olvidaste tu contraseña?'),
            ),
            ElevatedButton(
              onPressed: () async {
                //Aquí verificas si está iniciada la sesion y te manda a la pantalla de inicio de la app
              },
              child: const Text(
                'Iniciar sesión',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  // color: Color.fromARGB(255, 65, 29, 2),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
                onPressed: () {
                  // Navegar a la pantalla de registro
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistroPage()),
                  );
                },
                child: const Text(
                  'Regístrate',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                )),
          ],
        ),
      ),
    );
  }
}
