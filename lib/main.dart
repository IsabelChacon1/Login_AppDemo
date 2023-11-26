import 'package:flutter/material.dart';
import 'package:login_app/screens/login.dart';
import 'package:login_app/screens/registro.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login Demo',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 247, 230, 196)),
        useMaterial3: true,
      ),
      initialRoute: 'login',
      routes: {
        'login': (_) => LoginPage(),
        'register': (_) => RegistroPage(),
        //'home': (_) => HomeScreen(),
        //'checking': (_) => CheckAuthScreen()
      },
    );
  }
}
