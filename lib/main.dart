import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyAppState();
  }
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex++;
    });
    if (questionIndex > 2) {
      questionIndex = 0;
    }
    print(questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    final question = [
      "What's your favorite color?",
      "What's your favorite animal?",
      "What's your favorite food?"
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('My first app'),
        ),
        body: Column(children: [
          Text(
            question[questionIndex],
          ),
          ElevatedButton(
              child: const Text('Answer 1'), onPressed: answerQuestion),
          ElevatedButton(
              child: const Text('Answer 2'), onPressed: answerQuestion),
        ]),
      ),
    );
  }
}
