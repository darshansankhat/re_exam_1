import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Provider/QuizProvider.dart';

class Congrets extends StatefulWidget {
  const Congrets({Key? key}) : super(key: key);

  @override
  State<Congrets> createState() => _CongretsState();
}

class _CongretsState extends State<Congrets> {
  QuizProvider? providerF;
  QuizProvider? providerT;

  @override
  Widget build(BuildContext context) {
    providerF = Provider.of<QuizProvider>(context, listen: false);
    providerT = Provider.of<QuizProvider>(context, listen: true);
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Congratulation correct ans is : ",style: TextStyle(fontSize: 18,color: Colors.blue),),
            SizedBox(height: 10.h,),
            Text("${providerT!.congrets}",style: TextStyle(fontSize: 25,color: Colors.red),),
            SizedBox(height: 10.h,),
            ElevatedButton(onPressed: () {
              providerT!.congrets=0;
              Navigator.pop(context);
            }, child: Text("Restart Game"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),),
          ],
        ),
      ),
    ),);
  }
}
