import 'package:flutter/material.dart';
import 'package:app_login/database/database.dart';
import 'package:app_login/screens/tela_boas_vindas.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<TelaLogin> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final databaseHelper = DatabaseHelper();

  void login() async {
    if (formKey.currentState!.validate()) {
      final user = await databaseHelper.getUser(emailController.text);
      if (user != null && user['password'] == passwordController.text) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                TelaBoasVindas(email: emailController.text),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Email ou senha inválidos')),
        );
      }
    }
  }

  void register() async {
    if (formKey.currentState!.validate()) {
      await databaseHelper.insertUser(
        emailController.text,
        passwordController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Usuário registrado com sucesso!')),
      );
    }
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack(
          children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/image1.jpeg', 
              fit: BoxFit.cover,   
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24.0),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                elevation: 8.0,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          'Bem-vindo!',
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 128, 128, 128),
                          ),
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            prefixIcon: const Icon(Icons.email),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          validator: (value) =>
                              value!.isEmpty ? 'Digite seu email' : null,
                        ),
                        const SizedBox(height: 16.0),
                        TextFormField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            labelText: 'Senha',
                            prefixIcon: const Icon(Icons.lock),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                          ),
                          obscureText: true,
                          validator: (value) =>
                              value!.isEmpty ? 'Digite sua senha' : null,
                        ),
                        const SizedBox(height: 24.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            ElevatedButton(
                              onPressed: login,
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 1, 228, 190),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32.0,
                                  vertical: 12.0,
                                ),
                              ),
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 128, 128, 128),
                                  ),
                              ),
                            ),
                            OutlinedButton(
                              onPressed: register,
                              style: OutlinedButton.styleFrom(
                                side: const BorderSide(
                                    color: Color.fromARGB(255, 1, 228, 190),
                                    ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0),
                                ),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 32.0,
                                  vertical: 12.0,
                                ),
                              ),
                              child: const Text(
                                'Registrar',
                                style: TextStyle(
                                  fontSize: 16.0,
                                  color: Color.fromARGB(255, 1, 228, 190),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
