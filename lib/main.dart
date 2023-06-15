import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_exam_1/Re_exam/Provider/QuizProvider.dart';
import 'package:re_exam_1/Re_exam/View/Home_screen.dart';
import 'package:re_exam_1/Re_exam/View/congrets.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    Sizer(
      builder: (context, orientation, deviceType) =>  MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => QuizProvider(),),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            "/":(context) => Home_screen(),
            "con":(context) => Congrets(),
          },
        ),
      ),
    ),
  );
}