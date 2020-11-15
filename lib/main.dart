import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange[100],
        appBar: AppBar(
          title: Text('Las Vegas Dice', style:TextStyle(fontFamily:'Montserrat'),),
          backgroundColor: Colors.red[900],
        ),
        body: DicePage(),
          ),
      ),
    );

}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber ;
  int rightDiceNumber ;

  @override
  void initState(){
    super.initState();
    setState(() {
      rollDice();
    });
  }

  rollDice(){
    int randomLeft = (Random().nextInt(6))+1;
    int randomRight = (Random().nextInt(6))+1;

    setState(() {
      leftDiceNumber = randomLeft;
      rightDiceNumber = randomRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container (
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
            children: <Widget>[
        Padding(
        padding: const EdgeInsets.only(bottom: 50),
        child: Text('The sum is: '+ (leftDiceNumber + rightDiceNumber ).toString(),
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'Open Sans'),
          ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
                Image.asset('assets/dice$leftDiceNumber.png', width: 150.0,),
                SizedBox(
                  height: 40,
                ),
                Image.asset("assets/dice$rightDiceNumber.png", width: 150.0,),
                SizedBox(
                  height: 40,
                ),
        ],
      ),
        Container(
                  width: MediaQuery.of(context).size.width*0.5,
                  child: FlatButton(
                      color: Colors.orange,
                      onPressed: ()=> rollDice(), child: Text('Roll Dice', style: TextStyle(fontFamily: 'Montserrat',fontSize: 20),)),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
          ),
      ),
    );
  }
}



