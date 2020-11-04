import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mario_flutter/button.dart';
import 'package:mario_flutter/jumping.dart';
import 'package:mario_flutter/mario.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double marioX =0;
  static double marioY =1;
  double time =0;
  double heigth =0;
  double initialHeigth =marioY;
  String direction = "right";
  bool midrun = false;
  bool midjump = false;
  var gameFonts = GoogleFonts.pressStart2p(
    textStyle: TextStyle(color: Colors.white,fontSize: 20)
  );
  void preJump(){
    time = 0;
    initialHeigth = marioY;
  }

  void jump() {
    midjump = true;
    preJump();
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      time+=0.05;
      heigth = -4.9 * time * time +5 *time ;
      if(initialHeigth - heigth > 1){
        midjump = false;
        setState(() {
          marioY=1;
        });
        timer.cancel();
      }else{
        setState(() {
          marioY = initialHeigth - heigth;
        });
      }
    });

  }
  void moveRight(){
    direction="right";
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if(MyButton().userIsHoldigButton() == true ){
      setState(() {
        midrun = !midrun;
      marioX += 0.02;
      });
      }
      else{
        timer.cancel();
      }
    });

  }
  void moveLeft(){
    direction="left";
    Timer.periodic(Duration(milliseconds: 50), (timer) {
      if(MyButton().userIsHoldigButton() == true ){
        setState(() {
          midrun = !midrun;
          marioX -= 0.02;
        });
      }
      else{
        timer.cancel();
      }
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 4,
            child: Stack(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  child: AnimatedContainer(
                    alignment: Alignment(marioX,marioY),
                    duration: Duration(milliseconds: 0),
                    child: midjump ?
                    JumpingMario(
                      direction: direction,
                    ):
                    MyMario(
                      direction: direction,
                      midrun: midrun,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:[
                      Column(
                      children: <Widget>[
                        Text("MArio",style: gameFonts,),
                        SizedBox(height: 10,),
                        Text("0000",style: gameFonts,)
                      ],
                    ),Column(
                      children: <Widget>[
                        Text("World",style: gameFonts,),
                        SizedBox(height: 10,),
                        Text("1",style: gameFonts,)
                      ],
                    ),Column(
                      children: <Widget>[
                        Text("Time",style: gameFonts,),
                        SizedBox(height: 10,),
                        Text("9999",style: gameFonts,)
                      ],
                    ),
                    ]
                  ),
                ),
              ],
            )
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  MyButton(
                    child: Icon(Icons.arrow_back,color: Colors.white,),
                    function: moveLeft,
                  ),
                  MyButton(
                    child: Icon(Icons.arrow_upward,color: Colors.white),
                    function: jump,
                  ),
                  MyButton(
                    child: Icon(Icons.arrow_forward,color: Colors.white),
                    function: moveRight,
                  ),
                  ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
