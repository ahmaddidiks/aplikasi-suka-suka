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

  var jawabanPengguna = [];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    // simpan jawaban pengguna
    var _ = questions[_questionIndex - 1]['answers'] as List<String>;
    jawabanPengguna.add(_.elementAt(0));

    print(_questionIndex);
    print(jawabanPengguna);
  }

  @override
  Widget build(BuildContext context) {
    // questions with maps => in python is dictionary

    // final answer_widget = (questions[_questionIndex]['answers'] as List<String>)
    //     .map((e) => Answer(e, _answerQuestion))
    //     .toList();

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('My first app'),
          ),
          body: _questionIndex < questions.length
              ? Column(
                  children: [
                    Question(
                      questions[_questionIndex]['question'] as String,
                    ),
                    // Column(
                    //   children: answer_widget,
                    // )
                    ...(questions[_questionIndex]['answers'] as List<String>)
                        .map((answer) {
                      return Answer(answer, _answerQuestion);
                    }).toList()
                  ],
                )
              : Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                          'Jawaban Anda:' +
                              '\nWarna Favorite: ' +
                              jawabanPengguna.elementAt(0) +
                              '\nHewan Favorite: ' +
                              jawabanPengguna.elementAt(1) +
                              '\nMakanan Favorite: ' +
                              jawabanPengguna.elementAt(2) +
                              '\n',
                          style: TextStyle(fontSize: 20),
                          textAlign: TextAlign.center),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.blue[400],
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 20),
                            textStyle: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        child: Text('Restart'),
                        onPressed: () {
                          setState(() {
                            _questionIndex = 0;
                          });
                          jawabanPengguna = [];
                        },
                      )
                    ],
                  ),
                )),
    );
  }
}
