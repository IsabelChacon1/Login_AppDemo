import 'package:flutter/material.dart';
import 'package:login_app/providers/login_form_provider.dart';
import 'package:login_app/screens/screens.dart';
import 'package:provider/provider.dart';
import 'services/services.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  //Para que se ejecute el provider si no no jala
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => LoginF_Provider()),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
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
      initialRoute: 'checking',
      routes: {
        'login': (_) => LoginPage(),
        'register': (_) => RegistroPage(),
        'home': (_) => PrincipalScr(),
        'checking': (_) => CheckAuthScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
    );
  }
}
