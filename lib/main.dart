import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:eldafit/Splash_Screen/splash_screen.dart';
import 'package:eldafit/Authentication/registration_page.dart';
import 'package:eldafit/Authentication/register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EldaFit',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/auth',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/register': (context) => RegistrationPage(),
        '/auth': (context) => AuthPage(),
      },
    );
  }
}