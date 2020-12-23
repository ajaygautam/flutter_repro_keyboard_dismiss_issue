import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      MaterialApp(title: 'Flutter Demo', theme: ThemeData(primarySwatch: Colors.blue), home: MyHomePage());
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Keyboard issue repro")),
        body: Center(
            child: BackNextButtonRow(
          nextBtnText: "Load Next",
          onPressedBack: () => print("This is root already"),
          onPressedNext: () =>
              Navigator.push(context, MaterialPageRoute(builder: (context) => RouteWithKeyboardVisibilityBuilder())),
        )));
  }
}

class RouteWithKeyboardVisibilityBuilder extends StatelessWidget {
  final String title;

  const RouteWithKeyboardVisibilityBuilder({Key key, this.title = "RouteWithKeyboardVisibilityBuilder"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      print("=-=-=-=-=-= Building with keyboard visibility set to: --||$isKeyboardVisible||-- for screen with title $title =-=-=-=-=-=");
      return Material(
          child: Container(
              color: Colors.blue[200],
              child: Center(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(title),
                    SizedBox(height: 16),
                    WidgetWithTextEdit(),
                    SizedBox(height: 16),
                    BackNextButtonRow()
                  ]))));
    });
  }
}

class WidgetWithTextEdit extends StatelessWidget {
  final Key key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;

    return SizedBox(
      height: screenSize.height * 0.1,
      width: screenSize.width * 0.67,
      child: new TextFormField(
        key: key,
        decoration: InputDecoration(hintText: "Tap to Enter Data"),
      ),
    );
  }
}

class BackNextButtonRow extends StatelessWidget {
  final Function onPressedBack, onPressedNext;
  final String nextBtnText;

  const BackNextButtonRow({Key key, this.onPressedBack, this.onPressedNext, this.nextBtnText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double width90 = screenWidth * 0.9;
    final buttonWidth = (width90 / 2) * 0.9;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
                minWidth: buttonWidth,
                color: Colors.yellow,
                child: Text("Back"),
                onPressed: onPressedBack ?? () => Navigator.of(context).pop())),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              minWidth: buttonWidth,
              color: Colors.green,
              child: Text(nextBtnText ?? "Next"),
              onPressed: onPressedNext ?? () => print("Next pressed"),
            )),
      ],
    );
  }
}
