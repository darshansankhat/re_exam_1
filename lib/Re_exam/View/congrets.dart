import 'package:flutter/material.dart';

class Congrets extends StatefulWidget {
  const Congrets({Key? key}) : super(key: key);

  @override
  State<Congrets> createState() => _CongretsState();
}

class _CongretsState extends State<Congrets> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Congratulation correct ans"),
            ElevatedButton(onPressed: () {
             Navigator.pop(context);
            }, child: Text("Next"),style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),),
          ],
        ),
      ),
    ),);
  }
}
