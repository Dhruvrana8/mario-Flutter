import 'package:flutter/material.dart';
import 'package:mario_flutter/button.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyButton(child: Icon(Icons.arrow_back,color: Colors.white,),),
                  MyButton(child: Icon(Icons.arrow_upward,color: Colors.white),),
                  MyButton(child: Icon(Icons.arrow_forward,color: Colors.white),),
                  ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
