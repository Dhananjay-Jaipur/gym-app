import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:gym/backend/backend.dart';
import 'package:gym/pages/user/home.dart';
import 'package:gym/themes/dark.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Backend()), 
      ],
      child: MaterialApp(
        title: 'Gym App',
        theme: darkMode,
        home: const Home(),
      ),
    );
  }
}

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {

    Future.delayed(const Duration(seconds: 4), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const Home()));
    });

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/logo.png',
            width: 100,
            height: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          Center(
            child: AnimatedTextKit(
              totalRepeatCount: 1,
              animatedTexts: [
                TyperAnimatedText(
                  'G Y M\n workout time',
                  speed: const Duration(milliseconds: 150),
                  textStyle: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
