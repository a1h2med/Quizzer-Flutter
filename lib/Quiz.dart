import 'QuestionAndAnswer.dart';

class Quiz{
  int _counter = 0;
  List<QuestionAndAnswer> _qa = [
    QuestionAndAnswer ('Some cats are actually allergic to humans', true),
    QuestionAndAnswer ('You can lead a cow down stairs but not up stairs.', false),
    QuestionAndAnswer('Approximately one quarter of human bones are in the feet.', true),
    QuestionAndAnswer('A slug\'s blood is green.', true),
    QuestionAndAnswer('Buzz Aldrin\'s mother\'s maiden name was \"Moon\".', true),
    QuestionAndAnswer('It is illegal to pee in the Ocean in Portugal.', true),
    QuestionAndAnswer(
        'No piece of square dry paper can be folded in half more than 7 times.', false),
    QuestionAndAnswer(
        'In London, UK, if you happen to die in the House of Parliament, you are technically entitled to a state funeral, because the building is considered too sacred a place.', true),
    QuestionAndAnswer(
        'The loudest sound produced by any animal is 188 decibels. That animal is the African Elephant.', false),
    QuestionAndAnswer(
        'The total surface area of two human lungs is approximately 70 square metres.', true),
    QuestionAndAnswer('Google was originally called \"Backrub\".', true),
    QuestionAndAnswer(
        'Chocolate affects a dog\'s heart and nervous system; a few ounces are enough to kill a small dog.', true),
    QuestionAndAnswer(
        'In West Virginia, USA, if you accidentally hit an animal with your car, you are free to take it home to eat.', true),
  ];

  void getNext(){
    if (_counter < _qa.length - 1){
      _counter++;
    }
  }
  bool isFinished(){
    if (_counter == 12)
      return true;
    else
      return false;
  }

  String getText(){
    return _qa[_counter].question;
  }
  bool getAnswer(){
    return _qa[_counter].answer;
  }

  void reset(){
    _counter = 0;
  }
}