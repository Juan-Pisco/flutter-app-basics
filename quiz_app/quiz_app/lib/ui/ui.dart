import 'package:flutter/material.dart';
import 'package:quiz_app/model/question.dart';

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  int _currentQuestionIndex = 0;

  List questionBank = [
    Question.name('Gon has green hair', true),
    Question.name('Naruto can do chidori', false),
    Question.name('Goku has no kids', false),
    Question.name('Tanjiro uses jutsus', false),
    Question.name('Rasengan is a jutsu', true),
    Question.name('CR7 is also called "El bicho"', true),
    Question.name('Nezuko is tanjiro\'s gf', false),
    Question.name('Messi is tall', false),
    Question.name('Guitar is an instrument', true),
    Question.name('1+1=2', true),
    Question.name('Keyboard is a season', false),
    Question.name('This is a quiz app', true),
    Question.name('I like hamburgers', true),
    Question.name('Ice cream sucks', false),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('True Citizen'),
        backgroundColor: Colors.blueGrey,
        centerTitle: true,
      ),
      backgroundColor: Colors.blueGrey,

      //Using [Builder] to use a [context] that is descendent of [Scaffold]
      //or else [Scaffold.of] would return null so the snackBar would not run
      body: Builder(
        builder: (BuildContext context) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Image.asset(
                'images/flag.png',
                height: 150,
                width: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(14.4),
                    border: Border.all(
                      color: Colors.blueGrey.shade400,
                      style: BorderStyle.solid,
                    )),
                height: 120,
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    questionBank[_currentQuestionIndex].questionText,
                    style: TextStyle(
                      fontSize: 16.9,
                      color: Colors.white,
                    ),
                  ),
                )),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RaisedButton(
                    onPressed: () => _previousQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_back, color: Colors.white)),
                RaisedButton(
                  onPressed: () => _checkAnswer(true, context),
                  color: Colors.blueGrey.shade900,
                  child: Text(
                    'TRUE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton(
                  onPressed: () => _checkAnswer(false, context),
                  color: Colors.blueGrey.shade900,
                  child: Text(
                    'FALSE',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                RaisedButton(
                    onPressed: () => _nextQuestion(),
                    color: Colors.blueGrey.shade900,
                    child: Icon(Icons.arrow_forward, color: Colors.white)),
              ],
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }

  _checkAnswer(bool userChoise, BuildContext context) {
    if (userChoise == questionBank[_currentQuestionIndex].isCorrect) {
      //correct answer
      debugPrint('Yes, correct!');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Correct!'),
        backgroundColor: Colors.green,
        duration: Duration(milliseconds: 500),
      ));
      _nextQuestion();
    } else {
      //wrong answer
      debugPrint('Incorrect!');
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text('Incorrect!'),
        backgroundColor: Colors.redAccent,
        duration: Duration(milliseconds: 500),
      ));
      _nextQuestion();
    }
  }

  _nextQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex + 1) % questionBank.length;
    });
  }

  _previousQuestion() {
    setState(() {
      _currentQuestionIndex = (_currentQuestionIndex - 1) % questionBank.length;
    });
  }
}
