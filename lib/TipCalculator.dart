import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(title: 'Tip Calculator', home: new TipCalculator()));
}

class TipCalculator extends StatelessWidget {
  double billAmount = 0.0;

  @override
  Widget build(BuildContext context) {
    TextField billAmountField = new TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          billAmount = double.parse(value);
        } catch (exception) {
          billAmount = 0.0;
        }
      },
      decoration: new InputDecoration(labelText: "Bill amount(\$)"),
    );

    RaisedButton sadButton = new RaisedButton(
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(90 / 360),
          child: new Text(": ("),
        ),
        splashColor: Colors.green,
        onPressed: () {
          calculateTip(context, 1.0);
        });

    RaisedButton okButton = new RaisedButton(
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(90 / 360),
          child: new Text(": |"),
        ),
        splashColor: Colors.green,
        onPressed: () {
          calculateTip(context, 5.0);
        });

    RaisedButton happyButton = new RaisedButton(
        child: new RotationTransition(
          turns: new AlwaysStoppedAnimation(90 / 360),
          child: new Text(": )"),
        ),
        splashColor: Colors.green,
        onPressed: () {
          calculateTip(context, 10.0);
        });

    Container buttonsContainer = new Container(
        padding: const EdgeInsets.all(15.0),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [sadButton, okButton, happyButton],
        ));

    Container container = new Container(
        padding: const EdgeInsets.all(32.0),
        child: new Column(children: [billAmountField, buttonsContainer]));

    AppBar appBar = new AppBar(
      title: new Text("Tip Calculator"),
      backgroundColor: Colors.lightGreen[600],
    );

    Scaffold scaffold = new Scaffold(
      appBar: appBar,
      body: container,
    );
    return scaffold;
  }

  void calculateTip(context, tipPercentage) {
    double calculatedTip = billAmount * tipPercentage / 100.0;
    double total = billAmount + calculatedTip;

    AlertDialog dialog = new AlertDialog(
        content: new Text("Tip: \$$calculatedTip \n" "Total: \$$total"));
    showDialog(context: context, child: dialog);
  }
}
