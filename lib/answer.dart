import 'package:flutter/material.dart';

@immutable
class Answer extends StatelessWidget {
  // Answer({Key? key}) : super(key: key);

  final String _answerText;
  final VoidCallback _selectHandler;

  Answer(this._answerText, this._selectHandler);

  answerColor() {
    if (_answerText == 'Red')
      return Colors.red;
    else if (_answerText == 'Blue')
      return Colors.blue;
    else if (_answerText == 'Green')
      return Colors.green;
    else
      return Colors.blue[400];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: answerColor(),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        child: Text(_answerText),
        onPressed: _selectHandler,
      ),
    );
  }
}
