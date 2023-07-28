import 'dart:async';

import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

enum ButtonState { correct, wrong, none }

class Button extends StatefulWidget {
  final String audioPath;
  final String text;
  final Function(String text) onButtonPressed;
  final ButtonState buttonState;

  const Button({
    super.key, 
    required this.text, 
    required this.audioPath,
    required this.onButtonPressed,
    required this.buttonState,
  });

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> with SingleTickerProviderStateMixin {

  Color _buttonColor = Colors.white;

  @override
  Widget build(BuildContext context) {

    final audioPlayer = AudioPlayer();

    void playAudio(String audioPath) async {
      await audioPlayer.play(AssetSource(audioPath));
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _buttonColor,
        border: Border.all(
          color: Colors.blue.shade900,
          width: 2,
        ),
      ),
      curve: Curves.easeInOut,
      child: ElevatedButton(
        onPressed: () {
          playAudio(
            widget.audioPath, // Substitua pelo caminho do seu arquivo MP3
          );
    
          setState(() {
            _buttonColor = widget.buttonState == ButtonState.correct ? Colors.green :Colors.red;
          });

          Timer(const Duration(milliseconds: 250), () { 
            if (mounted) {
              setState(() {
                _buttonColor = Colors.white;
              }); 
            }
          });
          widget.onButtonPressed(widget.text);
          
        },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blue, 
          shape: const CircleBorder(), 
          backgroundColor: Colors.transparent, 
          shadowColor: Colors.transparent, 
          padding: const EdgeInsets.all(28),
        ),
        child: Text(widget.text),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  }

}