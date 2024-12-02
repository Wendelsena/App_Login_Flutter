import 'package:flutter/material.dart';

class TelaCalculadoraIMC extends StatelessWidget {
  const TelaCalculadoraIMC({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController pesoController = TextEditingController();
    final TextEditingController alturaController = TextEditingController();

    void calcularIMC() {
      final double peso = double.tryParse(pesoController.text) ?? 0.0;
      final double alturaCm = double.tryParse(alturaController.text) ?? 0.0;

      if (peso > 0 && alturaCm > 0) {
        final double altura = alturaCm / 100;
        final double imc = peso / (altura * altura);
        String resultado;

        if (imc < 18.5) {
          resultado = "Abaixo do peso";
        } else if (imc < 25.0) {
          resultado = "Peso normal";
        } else if (imc < 30.0) {
          resultado = "Sobrepeso";
        } else if (imc < 35.0) {
          resultado = "Obesidade Grau I";
        } else if (imc < 40.0) {
          resultado = "Obesidade Grau II";
        } else {
          resultado = "Obesidade Grau III";
        }

        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Resultado do IMC'),
            content: Text(
              'Seu IMC é ${imc.toStringAsFixed(2)}\nClassificação: $resultado',
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            title: const Text('Erro'),
            content: const Text('Por favor, insira valores válidos para peso e altura.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora de IMC'),
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
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Peso (kg)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                TextField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Altura (cm)',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: calcularIMC,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 1, 228, 190),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                  ),
                  child: const Text(
                    'Calcular IMC',
                    style: TextStyle(
                      fontSize: 16.0,
                      color: Color.fromARGB(255, 128, 128, 128),
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
