import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:re_exam_1/Re_exam/Model/QuizModel.dart';
import 'package:re_exam_1/Re_exam/Provider/QuizProvider.dart';
import 'package:sizer/sizer.dart';

class Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {
  QuizProvider? providerF;
  QuizProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<QuizProvider>(context, listen: false);
    providerT = Provider.of<QuizProvider>(context, listen: true);

    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple.shade400,
            title: Text(
              "Question",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            actions: [
              Icon(
                Icons.person_outline_rounded,
                size: 30,
                color: Colors.white,
              )
            ],
          ),
          body: FutureBuilder(
              future: providerF!.apiDataParsing(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                } else if (snapshot.hasData) {
                  QuizModel? q1 = snapshot.data;

                  return Column(
                    children: [
                      up(Colors.amber),
                      up(Colors.blue.shade200),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 30.h,
                          width: 100.w,
                          color: Colors.black12,
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.all(10),
                            child: Container(
                              height: 30.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                              ),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          height: 4.h,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.white),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "Question",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ),
                                        Container(
                                          height: 4.h,
                                          width: 25.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(50),
                                              color: Colors.white),
                                          alignment: Alignment.center,
                                          child: Text(
                                            "${providerT!.i + 1}/10",
                                            style: TextStyle(
                                                fontSize: 18,
                                                color: Colors.black),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 9.h,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "${q1!.results![providerT!.i].question}",
                                      style: TextStyle(
                                          fontSize: 20, color: Colors.white),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      InkWell(
                          onTap: () {

                            providerT!.ansList.add("A");
                            providerF!.changeQuestion();
                          },
                          child: ans("A",
                              "${q1.results![providerT!.i].incorrectAnswers![0]}")),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {

                          providerT!.ansList.add("B");
                          providerF!.changeQuestion();
                        },
                        child: ans("B",
                            "${q1.results![providerT!.i].incorrectAnswers![1]}"),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {

                          providerT!.ansList.add("C");
                          providerF!.changeQuestion();
                        },
                        child: ans("C",
                            "${q1.results![providerT!.i].incorrectAnswers![2]}"),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(

                          onTap: () {

                            providerT!.ansList.add("D");
                            providerF!.changeQuestion();
                          },child: ans("D", "${q1.results![providerT!.i].correctAnswer}")),
                      SizedBox(
                        height: 2.h,
                      ),
                      Visibility(
                        visible: providerT!.d,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: InkWell(
                            onTap: () {
                              providerF!.result();
                              providerF!.restartGame(0);
                              Navigator.pushNamed(context, "con");
                            },
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.blue,
                              ),
                              alignment: Alignment.center,
                              child: Text("Your Question is over show result",style: TextStyle(fontSize: 18,color: Colors.white),),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
                }
                return Center(child: CircularProgressIndicator());
              })),
    );
  }

  Widget up(Color c1) {
    return Container(
      height: 8,
      width: 100.w,
      color: c1,
    );
  }

  Widget ans(String option, String anss) {
    return Container(
      height: 60,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(500),
        color: Colors.blue,
      ),
      child: Row(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(colors: [
                  Colors.purple,
                  Colors.pink,
                ])),
            alignment: Alignment.center,
            child: Text(
              "$option",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(width: 2.w),
          Text(
            "$anss",
            style: TextStyle(fontSize: 20, color: Colors.white),
          )
        ],
      ),
    );
  }
}
