import 'package:calculator/widgets/button.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String numb = " ";
  Color plusBGColor = Colors.white;
  Color plusFgColor = Colors.blue;
  Color minusBGColor = Colors.white;
  Color minusFgColor = Colors.blue;
  Color multiBGColor = Colors.white;
  Color multiFgColor = Colors.blue;
  Color divBGColor = Colors.white;
  Color divFgColor = Colors.blue;

  String? operation;
  final txtBox = TextEditingController(text: '0');

  numChange(number) {
    if (txtBox.text.length < 7) {
      if (txtBox.text == "0") {
        txtBox.text = number;
      } else {
        txtBox.text = txtBox.text + number;
      }
    }
  }

  // btn(opr) {
  //   setState(() {
  //     numb = txtBox.text;
  //     txtBox.clear();
  //     fgColor = Colors.white;
  //     bgColor = Colors.blue;
  //     operation = opr;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                numb.toString(),
                style: TextStyle(
                  color: Colors.blue[300],
                  fontSize: 50,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: txtBox,
              maxLength: 7,
              enabled: false,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 80,
                color: Colors.blue,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                func: () => numChange("1"),
                text: '1',
              ),
              Button(
                func: () => numChange("2"),
                text: '2',
              ),
              Button(
                func: () => numChange("3"),
                text: '3',
              ),
              Button(
                func: () {
                  txtBox.text = '0';
                  setState(() {
                    numb = '';
                    plusBGColor = Colors.white;
                    plusFgColor = Colors.blue;
                    minusBGColor = Colors.white;
                    minusFgColor = Colors.blue;
                    multiBGColor = Colors.white;
                    multiFgColor = Colors.blue;
                    divBGColor = Colors.white;
                    divFgColor = Colors.blue;
                  });
                },
                text: 'C',
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                func: () => numChange("4"),
                text: '4',
              ),
              Button(
                func: () => numChange("5"),
                text: '5',
              ),
              Button(
                func: () => numChange("6"),
                text: '6',
              ),
              Button(
                text: '+',
                bgColor: plusBGColor,
                fgColor: plusFgColor,
                func: () {
                  setState(() {
                    numb = txtBox.text;
                    txtBox.clear();
                    plusFgColor = Colors.white;
                    plusBGColor = Colors.blue;
                    operation = '+';
                  });
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                func: () => numChange("7"),
                text: '7',
              ),
              Button(
                func: () => numChange("8"),
                text: '8',
              ),
              Button(
                func: () => numChange("9"),
                text: '9',
              ),
              Button(
                // func: () => btn('-'),
                func: () {
                  setState(() {
                    numb = txtBox.text;
                    txtBox.clear();
                    minusFgColor = Colors.white;
                    minusBGColor = Colors.blue;
                    operation = '-';
                  });
                },
                text: '-',
                bgColor: minusBGColor,
                fgColor: minusFgColor,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Button(
                func: () => numChange("0"),
                text: '0',
              ),
              Button(
                // func: () => btn('*'),
                func: () {
                  setState(() {
                    numb = txtBox.text;
                    txtBox.clear();
                    multiFgColor = Colors.white;
                    multiBGColor = Colors.blue;
                    operation = '*';
                  });
                },
                text: '*',
                bgColor: multiBGColor,
                fgColor: multiFgColor,
              ),
              Button(
                // func: () => btn('/'),
                func: () {
                  setState(() {
                    numb = txtBox.text;
                    txtBox.clear();
                    divFgColor = Colors.white;
                    divBGColor = Colors.blue;
                    operation = '/';
                  });
                },
                text: '/',
                bgColor: divBGColor,
                fgColor: divFgColor,
              ),
              Button(
                func: () {
                  setState(() {
                    plusBGColor = Colors.white;
                    plusFgColor = Colors.blue;
                    minusBGColor = Colors.white;
                    minusFgColor = Colors.blue;
                    multiBGColor = Colors.white;
                    multiFgColor = Colors.blue;
                    divBGColor = Colors.white;
                    divFgColor = Colors.blue;
                  });
                  if (operation == '+') {
                    int n1 = int.parse(numb);
                    int n2 = int.parse(txtBox.text);
                    setState(() {
                      numb = "Ans";
                    });
                    txtBox.text = (n1 + n2).toString();
                  } else if (operation == '-') {
                    int n1 = int.parse(numb);
                    int n2 = int.parse(txtBox.text);
                    setState(() {
                      numb = "Ans";
                    });
                    txtBox.text = (n1 - n2).toString();
                  } else if (operation == '*') {
                    int n1 = int.parse(numb);
                    int n2 = int.parse(txtBox.text);
                    setState(() {
                      numb = "Ans";
                    });
                    txtBox.text = (n1 * n2).toString();
                  } else {
                    int n1 = int.parse(numb);
                    int n2 = int.parse(txtBox.text);
                    setState(() {
                      numb = "Ans";
                    });
                    txtBox.text = (n1 / n2).toString();
                  }
                },
                text: '=',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
