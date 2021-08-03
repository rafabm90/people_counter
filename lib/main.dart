import 'package:flutter/material.dart';

void main() {
  runApp(AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Counter People",
      home: HomePage(),
      theme: ThemeData(
        primaryColor: Colors.deepPurple,
        textTheme: TextTheme(
          button: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _people = 0;
  String _infoText = "Pode Entrar";

  void _changePeople(int number) {
    setState(() {
      _people += number;

      if (_people < 0) {
        _infoText = "OMG :0";
      } else if (_people > 6) {
        _infoText = "Lotado!!";
      } else {
        _infoText = "Pode Entrar";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Stack(
        children: [
          Image.asset(
            "assets/img/restaurant.jpg",
            fit: BoxFit.cover,
            height: 1000.0,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Pessoas: $_people",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => _changePeople(1),
                      child: Text(
                        "+1",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    SizedBox(width: 20.0),
                    TextButton(
                      onPressed: () => _changePeople(-1),
                      child: Text(
                        "-1",
                        style: TextStyle(
                          fontSize: 40.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                _infoText,
                style: TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 30.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
