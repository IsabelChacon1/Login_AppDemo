import 'package:flutter/material.dart';

class RegistroPage extends StatelessWidget {
  RegistroPage({super.key});
  final TextEditingController _nickController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registro',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 252, 254, 240),
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: const Color.fromARGB(255, 192, 146, 59),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
                  color: Color.fromARGB(255, 0, 0, 0),
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
            Container(
              width: size.width * 0.80,
              height: size.height * 0.05,
              alignment: Alignment.center,
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                //Aquí la validación
              },
              child: const Text(
                'Registrar',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  // color: Color.fromARGB(255, 65, 29, 2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
