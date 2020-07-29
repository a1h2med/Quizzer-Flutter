import 'package:flutter/material.dart';
import 'Quiz.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() => runApp(Quizzler());

class Quizzler extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: QuizPage(),
          ),
        ),
      ),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> scoreTracker = [];
  Quiz quiz = Quiz();

  void checkAnswer(bool userAnswer){
    bool answer = quiz.getAnswer();
    setState(() {
    if (answer == userAnswer) {
        scoreTracker.add(
          Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
    } else {
        scoreTracker.add(
          Icon(
            Icons.close,
            color: Colors.red,
          ),
        );
    }
      });
  }

  void quizFinished(){
    Alert(
      context: context,
      type: AlertType.success,
      title: "Finished!",
      desc: "You've reached the end of the quiz.",
      buttons: [
        DialogButton(
          child: Text(
            "CANCEL",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () => Navigator.pop(context),
          width: 120,
        )
      ],
    ).show();
    quiz.reset();
    scoreTracker = [];
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                quiz.getText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              textColor: Colors.white,
              color: Colors.green,
              child: Text(
                'True',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                ),
              ),
              onPressed: () {
                bool userAnswer = true;
                checkAnswer(userAnswer);
                bool finishState = quiz.isFinished();
                if (finishState)
                  quizFinished();
                else
                  quiz.getNext();
              },
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text(
                'False',
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                bool userAnswer = false;
                checkAnswer(userAnswer);
                bool finishState = quiz.isFinished();
                if (finishState)
                  quizFinished();
                else
                  quiz.getNext();
              },
            ),
          ),
        ),
        Row(children: scoreTracker)
      ],
    );
  }
}