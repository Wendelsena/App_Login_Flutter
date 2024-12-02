import 'package:flutter/material.dart';

class TelaBiografia extends StatelessWidget {
  const TelaBiografia({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Minha Biografia'),
        backgroundColor: const Color.fromARGB(255, 78, 235, 182).withOpacity(0.8),
      ),
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
              'assets/image3.jpeg',
              fit: BoxFit.cover,
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Sobre Mim',
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    'Meu nome é Wendel, tenho 20 anos e faço faculdade de ADS. Amo tecnologia. Afinal, nada como passar noites em claro encarando o PC para descobrir que o problema era um ponto e vírgula na linha 76. É impressionante como a tecnologia cria bombas de fissão nuclear e computadores quânticos, mas ainda não inventou um algoritmo capaz de apontar exatamente onde estão nossos erros.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 123, 70, 247),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
