import 'package:flutter/material.dart';

class PrincipalScr extends StatelessWidget {
  const PrincipalScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Holi Usuario'),
      ),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: Text('Hola, esta es la página principal'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          //botón para regresar a login
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all<Color>(
          //       Color.fromARGB(255, 255, 244, 244)),
          // ),
          onPressed: () {
            // Navegar a la pantalla de registro
            Navigator.pushNamed(context, 'login', arguments: '');
          },
          child: Icon(Icons.outdoor_grill)), //botón para regresar a login
    );
  }
}
