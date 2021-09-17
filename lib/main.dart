import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yunyun_flutter_app/auth/auth_repository.dart';
import 'package:yunyun_flutter_app/screens/login_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Yun yun app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: const TextTheme(
            subtitle1: TextStyle(fontSize: 13.0),
            headline3: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
            )
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: MaterialStateProperty.all<TextStyle>(const TextStyle(color: Colors.white)),
            backgroundColor: MaterialStateProperty.all<Color>(const Color(0xff4aa7b2)),
          ),
        ),
      ),
      home: RepositoryProvider(
        create: (context) => AuthRepository(),
        child: LoginView(),
      ),
    );
  }
}