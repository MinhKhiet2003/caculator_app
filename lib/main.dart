import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
  double first = 0, second = 0;
  String opp = "", result = "", text = "";

  void btnClicked (String btnText){
    if (btnText == "C"){
      result = "";
      text = "";
      first = 0;
      second = 0;
    }else if (btnText == "+" || btnText == "-" || btnText == "x" || btnText == "/"){
      first = double.parse(text);
      result = "";
      opp = btnText;
    }else if (btnText == "="){
      second = double.parse(text);
      if (opp == "+"){
        result = (first + second).toString();
      }else if (opp == "-"){
        result = (first - second).toString();
      }else if (opp == "x"){
        result = (first * second).toString();
      }else if (opp == "/"){
        result = (first / second).toString();
      }
    }else{
      result = int.parse(text + btnText).toString();
    }

    setState(() {
      text = result;
    });
  }

  Widget customButton(String value) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(8),
        child: OutlinedButton(
          onPressed: () => btnClicked(value),
          style: OutlinedButton.styleFrom(
            padding: EdgeInsets.all(30),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          child: Text(
            value,
            style: TextStyle(fontSize: 20),

          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Calculator")),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.yellowAccent,
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(10),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                  color: Colors.red,
                ),
              ),
            ),
          ),
          Row(
            children: [
              customButton("9"),
              customButton("8"),
              customButton("7"),
              customButton("+"),
            ],
          ),
          Row(
            children: [
              customButton("6"),
              customButton("5"),
              customButton("4"),
              customButton("-"),
            ],
          ),
          Row(
            children: [
              customButton("3"),
              customButton("2"),
              customButton("1"),
              customButton("x"),
            ],
          ),
          Row(
            children: [
              customButton("C"),
              customButton("0"),
              customButton("="),
              customButton("/"),
            ],
          ),
        ],
      ),
    );
  }
}





