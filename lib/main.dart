import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(
    MaterialApp(
      home: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController thoseWhoAnsweredThePoll = TextEditingController();
  TextEditingController thoseWhoReceivedThePoll = TextEditingController();
  TextEditingController thoseWhoCalledIn = TextEditingController();
  TextEditingController answered0 = TextEditingController();
  TextEditingController answered1 = TextEditingController();
  TextEditingController answered2 = TextEditingController();
  TextEditingController answered3 = TextEditingController();
  TextEditingController answered4 = TextEditingController();
  TextEditingController answered5 = TextEditingController();
  TextEditingController answered6 = TextEditingController();
  TextEditingController answered7 = TextEditingController();
  TextEditingController answered8 = TextEditingController();
  TextEditingController answered9 = TextEditingController();
  TextEditingController answered10 = TextEditingController();
  String countDisplay = "Type Numbers In Fields";

  updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  recalcTotal() {
    //answered includes 0s
    int answered = int.tryParse(thoseWhoAnsweredThePoll.text) ?? 0;
    int received = int.tryParse(thoseWhoReceivedThePoll.text) ?? 0;

    //special cases
    int called = int.tryParse(thoseWhoCalledIn.text) ?? 0;
    int zero = int.tryParse(answered0.text) ?? 0;

    //obvious math
    int one = (int.tryParse(answered1.text) ?? 0);
    int two = (int.tryParse(answered2.text) ?? 0) * 2;
    int three = (int.tryParse(answered3.text) ?? 0) * 3;
    int four = (int.tryParse(answered4.text) ?? 0) * 4;
    int five = (int.tryParse(answered5.text) ?? 0) * 5;
    int six = (int.tryParse(answered6.text) ?? 0) * 6;
    int seven = (int.tryParse(answered7.text) ?? 0) * 7;
    int eight = (int.tryParse(answered8.text) ?? 0) * 8;
    int nine = (int.tryParse(answered9.text) ?? 0) * 9;
    int ten = (int.tryParse(answered10.text) ?? 0) * 10;

    //still includes those that answered 0
    int actualReceived = received - zero;
    int actualAnswered = answered - zero;
    int countsUnknownZoom = (actualReceived - actualAnswered);
    int countsKnown =
        one + two + three + four + five + six + seven + eight + nine + ten;
    int countsUnknownPhone = called;

    //sum it up
    int total = countsUnknownZoom + countsUnknownPhone + countsKnown;
    if (total == 0) {
      countDisplay = "Type Numbers In Fields";
    } else {
      countDisplay = total.toString() + " total";
    }

    //show new result
    updateState();
  }

  @override
  void initState() {
    //super init
    super.initState();

    //add listeners
    thoseWhoAnsweredThePoll.addListener(recalcTotal);
    thoseWhoReceivedThePoll.addListener(recalcTotal);
    thoseWhoCalledIn.addListener(recalcTotal);
    answered0.addListener(recalcTotal);
    answered1.addListener(recalcTotal);
    answered2.addListener(recalcTotal);
    answered3.addListener(recalcTotal);
    answered4.addListener(recalcTotal);
    answered5.addListener(recalcTotal);
    answered6.addListener(recalcTotal);
    answered7.addListener(recalcTotal);
    answered8.addListener(recalcTotal);
    answered9.addListener(recalcTotal);
    answered10.addListener(recalcTotal);
  }

  @override
  void dispose() {
    //remove listeners
    thoseWhoAnsweredThePoll.removeListener(recalcTotal);
    thoseWhoReceivedThePoll.removeListener(recalcTotal);
    thoseWhoCalledIn.removeListener(recalcTotal);
    answered0.removeListener(recalcTotal);
    answered1.removeListener(recalcTotal);
    answered2.removeListener(recalcTotal);
    answered3.removeListener(recalcTotal);
    answered4.removeListener(recalcTotal);
    answered5.removeListener(recalcTotal);
    answered6.removeListener(recalcTotal);
    answered7.removeListener(recalcTotal);
    answered8.removeListener(recalcTotal);
    answered9.removeListener(recalcTotal);
    answered10.removeListener(recalcTotal);

    //super dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: NumberField(
                    textEditingController: thoseWhoCalledIn,
                    label:
                        "this many are connected by phone (so they DID NOT RECEIVE the poll)",
                  ),
                ),
                Divider(
                  thickness: 8,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8.0,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                        child: NumberField(
                          textEditingController: thoseWhoAnsweredThePoll,
                          label: "this many ANSWERED the poll",
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("out of"),
                      ),
                      Flexible(
                        child: NumberField(
                          textEditingController: thoseWhoReceivedThePoll,
                          label: "this many that RECEIVED the poll ",
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  thickness: 8,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered0,
                    label:
                        "0 (they re-connected & so this count is removed from both of the numbers above)",
                  ),
                ),
                Divider(
                  thickness: 8,
                  color: Colors.black,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered1,
                    label: "1 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered2,
                    label: "2 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered3,
                    label: "3 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered4,
                    label: "4 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered5,
                    label: "5 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered6,
                    label: "6 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered7,
                    label: "7 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered8,
                    label: "8 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered9,
                    label: "9 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    textEditingController: answered10,
                    label: "10 in attendance",
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 56,
            width: MediaQuery.of(context).size.width,
            color: Colors.blue,
            child: Center(
              child: Text(
                countDisplay,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class NumberField extends StatelessWidget {
  const NumberField({
    required this.textEditingController,
    required this.label,
    Key? key,
  }) : super(key: key);

  final String label;
  final TextEditingController textEditingController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(),
      ),
    );
  }
}
