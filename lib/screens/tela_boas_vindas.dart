import 'package:flutter/material.dart';

class TelaBoasVindas extends StatelessWidget {
  final String email;

  const TelaBoasVindas({super.key, required this.email});

  void logout(BuildContext context) {
    Navigator.pushNamedAndRemoveUntil(
      context,
      '/',
      (Route<dynamic> route) => false,
    );
  }

  void navigateToIMCCalculator(BuildContext context) {
    Navigator.pushNamed(context, '/calculadora_imc');
  }

  void navigateToBiography(BuildContext context) {
    Navigator.pushNamed(context, '/biografia');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bem-vindo'),
        backgroundColor: const Color.fromARGB(255, 78, 235, 182).withOpacity(0.8),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => logout(context),
          ),
        ],
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/image2.jpeg', 
              fit: BoxFit.cover,    
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Seja bem-vindo, $email',
                  style: const TextStyle(
                    fontSize: 30,
                    color: Color.fromARGB(255, 128, 128, 128),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'O que deseja?',
                  style: TextStyle(
                    fontSize: 20,
                    color: Color.fromARGB(255, 74, 74, 74),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                // Botões
                SizedBox(
                  width: 200, 
                  child: ElevatedButton(
                    onPressed: () => navigateToIMCCalculator(context),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 1, 228, 190),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                    ),
                    child: const Text(
                      'Calculadora de IMC',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 128, 128, 128),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                SizedBox(
                  width: 200, 
                  child: OutlinedButton(
                    onPressed: () => navigateToBiography(context),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                        vertical: 12.0,
                      ),
                    ),
                    child: const Text(
                      'Minha Biografia',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
