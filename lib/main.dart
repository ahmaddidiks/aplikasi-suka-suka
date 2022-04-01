import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  final questions = [
    {
      'question': "What's your favorite color?",
      'answers': ['Red', 'Blue', 'Green'],
    },
    {
      'question': "What's your favorite animal?",
      'answers': ['Dog', 'Cat', 'Rabbit'],
    },
    {
      'question': "What's your favorite food?",
      'answers': ['Pizza', 'Pasta', 'Cake'],
    }
  ];

  List<String> jawabanPengguna = [];

  void _answerQuestion(String answer) {
    // jika selesai reset jawaban

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    _questionIndex > questions.length
        ? {
            jawabanPengguna = [],
            setState(() {
              _questionIndex = 0;
            })
          }
        : jawabanPengguna.add(answer);
  }

  @override
  Widget build(BuildContext context) {
    // final answer_widget = (questions[_questionIndex]['answers'] as List<String>)
    //     .map((e) => Answer(e, _answerQuestion))
    //     .toList();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Aplikasi suka suka'),
          ),
          body: _questionIndex < questions.length ? quiz() : result()),
    );
  }

  Column quiz() {
    return Column(
      children: [
        Question(
          questions[_questionIndex]['question'] as String,
        ),
        // Column(
        //   children: answer_widget,
        // )
        ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(answer, () {
            _answerQuestion(answer);
          });
        }).toList()
      ],
    );
  }

  Center result() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              'Jawaban Anda:'
                      '\nWarna Favorite: ' +
                  jawabanPengguna.elementAt(0) +
                  '\nHewan Favorite: ' +
                  jawabanPengguna.elementAt(1) +
                  '\nMakanan Favorite: ' +
                  jawabanPengguna.elementAt(2) +
                  '\n',
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.blue[400],
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                textStyle:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            child: const Text('Restart'),
            onPressed: () {
              _answerQuestion('');
            },
          )
        ],
      ),
    );
  }
}
