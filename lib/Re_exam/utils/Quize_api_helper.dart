import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:re_exam_1/Re_exam/Model/QuizModel.dart';

class QuizApi
{

  static QuizApi quizApi = QuizApi();

  Future<QuizModel> apiData()
  async {
    String link="https://opentdb.com/api.php?amount=10&category=27&difficulty=medium&type=multiple";

    var response = await http.get(Uri.parse(link));

    var json = jsonDecode(response.body);

    QuizModel q1 = QuizModel.fromJson(json);

    return q1;
  }
}