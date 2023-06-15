import 'package:flutter/cupertino.dart';
import 'package:re_exam_1/Re_exam/Model/QuizModel.dart';
import 'package:re_exam_1/Re_exam/utils/Quize_api_helper.dart';

class QuizProvider extends ChangeNotifier
{

  int i=0;
  bool d=false;

  Future<QuizModel> apiDataParsing()
  async {
    return await QuizApi.quizApi.apiData();
  }

  void changeQuestion()
  {
    if(i<9)
      {
        i++;
      }
    else
      {
        d=true;

      }

    notifyListeners();
  }

  void restartGame(int value)
  {
    i=value;
    d=false;

    notifyListeners();
  }
}