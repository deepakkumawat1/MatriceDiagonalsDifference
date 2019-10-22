import 'package:flutter/material.dart';
import './result/calculate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 11, 7, 1),
      ),
      home: MyHomePage(title: 'MatricesDiagonal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> values = [];
  List<int> second = [];
  int number = 3;
  int sum1 = 0, sum2 = 0, totalsum = 0;
  bool _autoValidate = false;

  List<List<int>> result = [];

  final _formkey = GlobalKey<FormState>();
  @override
  @override
  Widget build(BuildContext context) {
    values = [];
    result = [];
    second = [];

    var size = MediaQuery.of(context).size;

    final double itemHeight = (size.height - kToolbarHeight - 24) / 10;
    final double itemWidth = size.width / 5;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          widget.title,
          style: TextStyle(
              color: Color.fromARGB(255, 246, 190, 84),
              fontSize: 26,
              fontStyle: FontStyle.italic),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/grunge.jpg'),
                      fit: BoxFit.fill)),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.5),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Material(
                      color: Colors.transparent,
                      elevation: 3.0,
                      shadowColor: Color.fromARGB(255, 170, 115, 12),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20.5),
                          child: Container(
                            decoration: BoxDecoration(boxShadow: [
                              BoxShadow(
                                  blurRadius: 2.0,
                                  color: Color.fromARGB(255, 43, 29, 14))
                            ]),
                            child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.5),
                                  child: Container(
                                    color: Color.fromARGB(255, 188, 178, 110),
                                    child: Container(
                                      child: Form(
                                        key: _formkey,
                                        autovalidate: _autoValidate,
                                        child: GridView.builder(
                                          shrinkWrap: true,
                                          padding: EdgeInsets.all(13.0),
                                          itemCount: 9,
                                          itemBuilder:
                                              (BuildContext context, i) {
                                            return Stack(
                                                fit: StackFit.expand,
                                                children: <Widget>[
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.5),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          image: DecorationImage(
                                                              image: AssetImage(
                                                                  'assets/img/textfieldbackground.png'),
                                                              fit:
                                                                  BoxFit.fill)),
                                                    ),
                                                  ),
                                                  ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12.5),
                                                    child: Container(
                                                      child: TextFormField(
                                                        textAlign:
                                                            TextAlign.center,
                                                        keyboardType:
                                                            TextInputType
                                                                .number,
                                                        onSaved: (value) {
                                                          values.add(int.parse(
                                                              '$value'));
                                                          print(
                                                              "value in onsaved is$value for index $i");
                                                        },
                                                        validator: (value) {
                                                          if (value.isEmpty) {
                                                            return "Enter Num.";
                                                          } else if (value
                                                                  .length >
                                                              3) {
                                                            return "MAX DIGIT 3 ";
                                                          } else {
                                                            return null;
                                                          }
                                                        },
                                                        decoration:
                                                            InputDecoration(
                                                          hintText: "12",
                                                          border:
                                                              OutlineInputBorder(
                                                            gapPadding: 50,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10.5),
                                                          ),
                                                        ),
                                                        style: TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    246,
                                                                    243,
                                                                    25),
                                                            fontSize: 26,
                                                            fontStyle: FontStyle
                                                                .italic,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400),
                                                      ),
                                                    ),
                                                  ),
                                                ]);
                                          },
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            childAspectRatio:
                                                (itemWidth / itemHeight),
                                            crossAxisCount: 3,
                                            crossAxisSpacing: 10,
                                            mainAxisSpacing: 10,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _formkey.currentState.reset();
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(23.5),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/textfieldbackground.png'),
                              fit: BoxFit.fill)),
                      height: 40,
                      alignment: Alignment.center,
                      width: 150,
                      child: Text(
                        "Reset",
                        style: TextStyle(
                          color: Color.fromARGB(255, 189, 170, 18),
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      if (_formkey.currentState.validate()) {
                        _formkey.currentState.save();
                        int i, j;
                        int counter1 = 0;

                        for (i = 0; i <= 2; i++) {
                          for (j = 0; j <= 2; j++) {
                            second.add(values[counter1]);
                            counter1 = counter1 + 1;
                          }

                          result.add(second);
                          second = [];
                        }

                        //prints 2d array to the console
                        for (i = 0; i <= 2; i++) {
                          for (j = 0; j <= 2; j++) {
                            print("index is [$i][$j] = ${result[i][j]} ");
                          }
                        }
                        sum1 = 0;
                        sum2 = 0;
                        for (int i = 0; i < number; i++) {
                          for (int j = 0; j < number; j++) {
                            if (i == j) sum1 += result[i][j];

                            if ((i + j) == (number - 1)) sum2 += result[i][j];
                          }
                        }
                        totalsum = 0;

                        totalsum = sum1 - sum2;
                        if (totalsum < 0) {
                          totalsum *= -1;
                        }
                        print("TOTALSUM=$totalsum");
                        Navigator.of(context).push(new MaterialPageRoute(
                            builder: (BuildContext context) => Calculate(
                                  finalresult: totalsum,
                                )));
                      } else {
                        setState(() {
                          _autoValidate = true;
                        });
                      }
                    });
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(23.5),
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'assets/img/textfieldbackground.png'),
                              fit: BoxFit.fill)),
                      height: 40,
                      alignment: Alignment.center,
                      width: 150,
                      child: Text(
                        "Calculate",
                        style: TextStyle(
                          color: Color.fromARGB(255, 189, 170, 18),
                          fontSize: 24,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
