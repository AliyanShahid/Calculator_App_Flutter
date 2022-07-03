import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonpressed(String buttonTex) {
    if (buttonTex == "Clear") {
      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonTex == "+" ||
        buttonTex == "-" ||
        buttonTex == "/" ||
        buttonTex == "X") {
      num1 = double.parse(output);
      operand = buttonTex;
      _output = "0";
    } else if (buttonTex == ".") {
      if (_output.contains(".")) {
      } else {
        _output = _output + buttonTex;
      }
    } else if (buttonTex == "=") {
      num2 = double.parse(output);
      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "X") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }
      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonTex;
    }
    print(_output);
    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget buildbutton(String buttonText) {
    return new Expanded(
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            padding: new EdgeInsets.all(24.0),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16))),

        // : new EdgeInsets.all(24.0),
        child: new Text(
          buttonText,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        onPressed: () => {buttonpressed(buttonText)},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
            new Container(
                alignment: Alignment.centerRight,
                padding:
                    new EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(
                  output,
                  style: TextStyle(fontSize: 44.0, fontWeight: FontWeight.bold),
                )),
            new Expanded(child: new Divider()),
            new Column(
              children: [
                new Row(children: [
                  buildbutton("7"),
                  buildbutton("8"),
                  buildbutton("9"),
                  buildbutton("+")
                ]),
                new Row(children: [
                  buildbutton("6"),
                  buildbutton("5"),
                  buildbutton("4"),
                  buildbutton("-")
                ]),
                new Row(children: [
                  buildbutton("3"),
                  buildbutton("2"),
                  buildbutton("1"),
                  buildbutton("/")
                ]),
                new Row(children: [
                  buildbutton("0"),
                  buildbutton("00"),
                  buildbutton("."),
                  buildbutton("X")
                ]),
                new Row(children: [buildbutton("Clear"), buildbutton("=")]),
              ],
            )
          ],
        )));
  }
}
