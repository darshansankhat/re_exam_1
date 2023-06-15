import 'package:flutter/cupertino.dart';
import 'package:re_exam_1/Re_exam/Model/QuizModel.dart';
import 'package:re_exam_1/Re_exam/utils/Quize_api_helper.dart';

class QuizProvider extends ChangeNotifier
{

  int i=0;
  bool d=false;
  int congrets=0;

  List ansList=[

  ];

  void result()
  {
    for(int a=0;a<9;a++)
      {
        if(ansList[a]=="D")
          {
            congrets++;

          }
      }
    print(congrets);
  }

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
    ansList.clear();

    notifyListeners();
  }
}