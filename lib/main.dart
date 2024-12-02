import 'package:flutter/material.dart';
import 'package:app_login/screens/tela_login.dart';
import 'package:app_login/screens/tela_boas_vindas.dart';
import 'package:app_login/screens/calculadora_imc.dart';
import 'package:app_login/screens/biografia.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Login',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const TelaLogin(),
        '/boas_vindas': (context) => const TelaBoasVindas(email: 'teste@example.com'), // Passe o email dinamicamente no app real
        '/calculadora_imc': (context) => const TelaCalculadoraIMC(),
        '/biografia': (context) => const TelaBiografia(),
      },
    );
  }
}
