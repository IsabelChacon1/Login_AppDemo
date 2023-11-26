import 'package:flutter/material.dart';

class PrincipalScr extends StatelessWidget {
  const PrincipalScr({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Container(
          color: Colors.blue,
          child: Text('Hola, esta es la página principal'),
        ),
      ),
    );
  }
}
