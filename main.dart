
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
   MyAppState createState() =>  MyAppState();

}

class MyAppState extends State<MyApp> {

  var output="";
  var operand = "";
  double num1 = 0;
  double num2 = 0;

  void buttonPressed(String buttonTxt){

    setState(() {
         if(buttonTxt == "AC")
         {
            output ="";
            operand = "";
            num1 = 0;
            num2 = 0;   
         }
         else if (buttonTxt=="+"||buttonTxt=="-"||buttonTxt=="*"||buttonTxt=="/"||buttonTxt=="%"){
          num1 = double.parse(output);    
          operand = buttonTxt;
          output="";
          
         }
         else if (buttonTxt == "="){
          num2 = double.parse(output);
          
          switch(operand){
            case "+":{
              output =(num1+num2).toString();
            }break;
            case "-":{
              output =(num1-num2).toString();
            }break;
            case "*":{
              output =(num1*num2).toString();
            }break;
            case "/":{
              output =(num1/num2).toString();
            }break;
            case "%":{
              output =(num1%num2).toString();
            }

          }
         }
         else{
           output += buttonTxt;
         }
    });
  }

  Widget buildButton(String buttonTxt){
    return Expanded(
      child: OutlineButton(
        color: Colors.black,
        padding: EdgeInsets.all(24),
        child: Text(buttonTxt, 
          style: TextStyle(
            fontSize: 20, 
            color: Colors.black,
            fontWeight: FontWeight.bold),
          ),
        onPressed: () => buttonPressed(buttonTxt),
      ),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Container(
          child:    
          Column(
            children: <Widget>[   
              Expanded(
                child:
                Container(
                  alignment: Alignment.centerRight,
                  child:
                    Text(output,
                    style: TextStyle(
                      fontSize: 30, 
                      fontWeight: FontWeight.bold, 
                    ),
                    ),
                  ),
                  ),
              
              
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  buildButton("7"),
                  buildButton("8"),
                  buildButton("9"),
                  buildButton("+"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  buildButton("4"),
                  buildButton("5"),
                  buildButton("6"),
                  buildButton("-"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  buildButton("1"),
                  buildButton("2"),
                  buildButton("3"),
                  buildButton("*"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                 
                  buildButton("AC"),
                  buildButton("0"),
                  buildButton("%"),
                  buildButton("/"),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                  buildButton("="),
                  
                  ],
                ),

          ],),
        ),
        ),
        debugShowCheckedModeBanner: false,
    );
  }
}
