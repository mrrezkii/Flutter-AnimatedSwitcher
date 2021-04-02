import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isON = false;
  Widget myWiget = Container(
    width: 200,
    height: 100,
    decoration: BoxDecoration(
        color: Colors.red, border: Border.all(color: Colors.black, width: 3)),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Animated Switcher"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              AnimatedSwitcher(
                child: myWiget,
                duration: Duration(seconds: 1),
                transitionBuilder: (child, animation) {
                  return RotationTransition(
                    turns: animation,
                    child: child,
                  );
                },
              ),
              Switch(
                  activeColor: Colors.green,
                  inactiveTrackColor: Colors.red,
                  inactiveThumbColor: Colors.red[300],
                  value: isON,
                  onChanged: (newValue) {
                    isON = newValue;
                    setState(() {
                      if (isON) {
                        myWiget = Container(
                          key: ValueKey(1),
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                        );
                        // myWiget = SizedBox(
                        //   width: 200,
                        //   height: 100,
                        //   child: Center(
                        //     child: Text(
                        //       "Switch: ON",
                        //       style: TextStyle(
                        //           color: Colors.green,
                        //           fontWeight: FontWeight.w700,
                        //           fontSize: 20),
                        //     ),
                        //   ),
                        // );
                      } else {
                        myWiget = Container(
                          key: ValueKey(2),
                          width: 200,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              border:
                                  Border.all(color: Colors.black, width: 3)),
                        );
                      }
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
