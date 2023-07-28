import 'package:flutter/material.dart';

class StartPage extends StatelessWidget {

  final Function onStart;

  const StartPage({super.key, required this.onStart});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 60),
          Image.asset(
            'assets/casa.png',
            width: 150,
            height: 150,
          ),
          const SizedBox(
            width: 200,
            height: 50,
            child: TextField(              
              decoration: InputDecoration(
                hintText: "Login",
                border: OutlineInputBorder(),
                labelText: 'Login',
              ),
            ),
          ),
          const SizedBox(height: 8),
          const SizedBox(
            width: 200,
            height: 50,
            child: TextField(    
              obscureText: true,          
              decoration: InputDecoration(
                hintText: "Senha",
                border: OutlineInputBorder(),
                labelText: 'Senha',
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () { onStart(); },
            style: ButtonStyle(
              fixedSize: MaterialStateProperty.all(const Size(200, 50)),
            ),
            child: const Text('Iniciar'),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () { },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              foregroundColor: MaterialStateProperty.all(Colors.blue),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              ),
            child: const Text('Cadastrar novo usuário'),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/ufrpe.png', width: 50, height: 50),
              Image.asset('assets/igarassu.png', width: 50, height: 50),
            ],
          )
        ],
      ),
    );
  }
}