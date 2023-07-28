import 'package:projeto_letramento/page_data.dart';
import 'package:flutter/material.dart';

import 'button.dart';


class PlayingPage extends StatefulWidget {

  final PageData pageData;
  final Function onCorrectAnswer;
  final Function onWrongAnswer;

  const PlayingPage({
    super.key,
    required this.pageData, 
    required this.onCorrectAnswer, 
    required this.onWrongAnswer,
  });

  @override
  State<PlayingPage> createState() => _PlayingPageState();
}

class _PlayingPageState extends State<PlayingPage> {

  final input = <String>[];

  String showInput(){
    if (input.isEmpty) {
      return '_ ' * widget.pageData.answer.length;
    } else {
      return input.join(' ') + ' _ ' * (widget.pageData.answer.length - input.length);
    }
  }

  ButtonState decideButtonState(int index) {
    if (widget.pageData.answer.contains(widget.pageData.buttonTexts[index])) {
      return ButtonState.correct;
    } else {
      return ButtonState.wrong;
    }
  }

  @override
  Widget build(BuildContext context) {
    final answer = widget.pageData.answer;
    void handleButtonPressed(String text) {
      setState(() {
        input.add(text);
        if (input.length == answer.length) {
          if (input.join() == answer.join()) {
            widget.onCorrectAnswer();
            input.clear();
          } else {
            widget.onWrongAnswer();
            input.clear();
          }
        }
      });
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16),
          Image.asset(
            widget.pageData.imgPath, // imagem
            width: 200,
            height: 200,
          ),
          Text(
            showInput(), // texto
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Button(
                    text: widget.pageData.buttonTexts[0], 
                    audioPath: widget.pageData.audioPaths[0],
                    onButtonPressed: handleButtonPressed,
                    buttonState: decideButtonState(0),
                  ),
                  const SizedBox(height: 16),
                  Button(
                    text: widget.pageData.buttonTexts[1], 
                    audioPath: widget.pageData.audioPaths[1],
                    onButtonPressed: handleButtonPressed,
                    buttonState: decideButtonState(1),
                  ),
                  const SizedBox(height: 16),
                  Button(
                    text: widget.pageData.buttonTexts[2], 
                    audioPath: widget.pageData.audioPaths[2],
                    onButtonPressed: handleButtonPressed,
                    buttonState: decideButtonState(2),
                  )
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Button(
                    text: widget.pageData.buttonTexts[3], 
                    audioPath: widget.pageData.audioPaths[3],
                    onButtonPressed: handleButtonPressed,
                    buttonState: decideButtonState(3),
                  ),
                  const SizedBox(height: 16),
                  Button(
                    text: widget.pageData.buttonTexts[4], 
                    audioPath: widget.pageData.audioPaths[4],
                    onButtonPressed: handleButtonPressed,
                    buttonState: decideButtonState(4),
                  ),
                  const SizedBox(height: 16),
                  Button(
                    text: widget.pageData.buttonTexts[5], 
                    audioPath: widget.pageData.audioPaths[5],
                    onButtonPressed: handleButtonPressed,
                    buttonState: decideButtonState(5),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
