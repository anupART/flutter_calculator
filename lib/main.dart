import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget

{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class

HomePage

    extends

    StatefulWidget

{
  @override
  _HomePageState createState() => _HomePageState();
}

class

_HomePageState extends  State<HomePage> {
  var userQuestion= '';
  var userAns='';
  final myTextStyle =TextStyle(fontWeight:FontWeight.bold,fontSize: 30,color: Colors.deepPurple);
  final  List<String> buttons = [
    'C', 'Del', '%', '/',
    '9', '8', '7', 'x',
    '6', '5', '4', '-',
    '3', '2', '1', '+',
    '0', '.', 'Ans', '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[50],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(height: 15,),
                  Container(
                    padding:EdgeInsets.all(10) ,
                    alignment: Alignment.centerLeft,
                      child: Text(userQuestion,style: TextStyle(fontSize: 25),)),
                  Container(
                    alignment: Alignment.centerRight,
                      child: Text(userAns,style: TextStyle(fontSize: 25),)),
                ],
              ),
            ), // Top section (consider adding a display here)
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.bottomCenter,
              color: Colors.deepPurple[70],
              child:Align(
                alignment: Alignment.bottomCenter,
              child: GridView.builder(

                itemCount: buttons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:

                4),

                itemBuilder: (BuildContext context, int index) {
                  if(index==0){
                    return MyButton(
                      buttonTapped: (){
                       setState(() {
                         userQuestion='';
                         userAns = '';
                       });
                      },
                      buttonText: buttons[index],
                      color: Colors.green,
                      textColor:  Colors.white,



                    );
                  }
                  else if(index==1){

                    return MyButton(
                      buttonTapped: (){
                        setState(() {
                          userQuestion=userQuestion.substring(0,userQuestion.length-1);

                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.red,
                      textColor:  Colors.white,

                    );
                  }
                  else if(index==buttons.length-1){

                    return MyButton(
                      buttonTapped: (){
                        setState(() {
                       equalPressed();
                        });
                      },
                      buttonText: buttons[index],
                      color: Colors.deepPurple,
                      textColor:  Colors.white,

                    );
                  }
                  else{
                    return MyButton(
                      buttonTapped: (){
                        setState(() {
                          userQuestion += buttons[index];
                        });
                      },
                      buttonText: buttons[index],
                      color: isOperator(buttons[index]) ? Colors.deepPurple : Colors.deepPurpleAccent,
                      textColor: isOperator(buttons[index]) ? Colors.white: Colors.white,

                    );
                  }

                },
              ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  bool isOperator(String x){
    if(x=='%' || x== '/' || x== 'x' || x=='-' || x=='+'|| x=='='){
return true;
    }
    return false;
  }

  void equalPressed() {
    String finalQuestion =userQuestion;
    finalQuestion=finalQuestion.replaceAll('x', '*');
    Parser p=Parser();
    Expression exp=p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userAns=eval.toString();


  }
}