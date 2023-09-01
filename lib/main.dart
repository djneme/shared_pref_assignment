import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart';
import 'registration_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? savedUsername = prefs.getString('username');
  String? savedPassword = prefs.getString('password');

  runApp(MyApp(savedUsername: savedUsername, savedPassword: savedPassword));
}

class MyApp extends StatelessWidget {
  final String? savedUsername;
  final String? savedPassword;

  const MyApp({super.key, required this.savedUsername, required this.savedPassword});

  @override
  Widget build(BuildContext context) {
    Widget initialScreen;
    if (savedUsername != null && savedPassword != null) {
      initialScreen = const HomeScreen();
    } else {
      initialScreen = RegistrationScreen();
    }

    return MaterialApp(
      title: 'Authentication App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialScreen,
    );
  }
}
