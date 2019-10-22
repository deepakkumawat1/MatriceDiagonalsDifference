import 'package:flutter/material.dart';

int aa = 0;

class Calculate extends StatelessWidget {
  int finalresult = 0;
  Calculate({this.finalresult});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 11, 7, 1),
      ),
      home: CalculateResult(
        finalres: finalresult,
      ),
    );
  }
}

class CalculateResult extends StatefulWidget {
  final int finalres;
  CalculateResult({this.finalres});
  @override
  _CalculateResultState createState() => _CalculateResultState();
}

class _CalculateResultState extends State<CalculateResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(
            "Result",
            style: TextStyle(
                color: Color.fromARGB(255, 246, 190, 84),
                fontSize: 26,
                fontStyle: FontStyle.italic),
          ),
          centerTitle: true,
        ),
        body: Stack(fit: StackFit.expand, children: <Widget>[
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/grunge.jpg'),
                    fit: BoxFit.fill)),
          ),
          Stack(
            children: <Widget>[
              Positioned(
                top: 200,
                left: 20,
                right: 0,
                bottom: 0,
                child: Column(
                  children: <Widget>[
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12.5),
                        child: Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                      'assets/img/textfieldbackground.png'),
                                  fit: BoxFit.fill)),
                          height: 65,
                          alignment: Alignment.center,
                          width: 110,
                          child: Text(
                            "${widget.finalres}",
                            style: TextStyle(
                              color: Color.fromARGB(255, 189, 170, 18),
                              fontSize: 26,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )
        ]));
  }
}
