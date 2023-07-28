import 'package:flutter/material.dart';

class FinishedScreen extends StatelessWidget {

  final Function onGoToStart;
  final int tries;
  final int points;

  const FinishedScreen({super.key, required this.onGoToStart, required this.tries, required this.points});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 60),
          const Text(
            'Parabéns! Você terminou!',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 60),
          Text('Você acertou todas as $points perguntas em $tries tentativas.'),
          const SizedBox(height: 60),
          ElevatedButton(
            onPressed: () => { onGoToStart() }, 
            child: const Text('Voltar ao início')
          )
        ],
      )
    );
  }
}