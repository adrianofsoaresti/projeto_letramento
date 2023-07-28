import 'package:projeto_letramento/finished_screen.dart';
import 'package:projeto_letramento/playing_page.dart';
import 'package:projeto_letramento/questions_data.dart';
import 'package:projeto_letramento/start_screen.dart';
import 'package:flutter/material.dart';

enum AppState { start, playing, finished }

class AppController extends StatefulWidget {
  const AppController({super.key});

  @override
  State<AppController> createState() => _AppControllerState();
}

class _AppControllerState extends State<AppController> {

  var points = 0;
  var tries = 0;
  var questionsData = QuestionsData();
  var appState = AppState.start;
  var currentQuestion = 0;

  void handleStart() {
    setState(() {
      appState = AppState.playing;
    });
  }

  void handleCorrectAnswer() {
    setState(() {
      points++;
      tries++;
      currentQuestion++;
      if (currentQuestion == questionsData.getAllPages().length) {
        appState = AppState.finished;
      }
    });
  }

  void handleWrongAnswer() {
    setState(() {
      tries++;
    });
  }

  void handleGoToStart() {
    setState(() {
      appState = AppState.start;
      points = 0;
      tries = 0;
      currentQuestion = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    String decideTitle() {
      switch (appState) {
        case AppState.start:
          return 'Início';
        case AppState.playing:
          return 'Pontos: $points, Tentativas: $tries';
        case AppState.finished:
          return 'Fim';
      }
    }

    Widget decideBody() {
      switch (appState) {
        case AppState.start:
          return StartPage(
            onStart: handleStart,
          );
        case AppState.playing:
  
          return PlayingPage(
            pageData: questionsData.getAllPages()[currentQuestion],
            onCorrectAnswer: handleCorrectAnswer,
            onWrongAnswer: handleWrongAnswer,
          );
        case AppState.finished:
          return FinishedScreen(
            points: points,
            tries: tries,
            onGoToStart: handleGoToStart,
          );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(decideTitle()),
      ),
      body: decideBody()
    );
  } 
}
