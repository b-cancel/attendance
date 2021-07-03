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
  FocusNode answerCountFN = FocusNode();
  TextEditingController answerCount = TextEditingController();
  FocusNode participantCountFN = FocusNode();
  TextEditingController participantCount = TextEditingController();
  FocusNode answered0FN = FocusNode();
  TextEditingController answered0 = TextEditingController();
  FocusNode answered1FN = FocusNode();
  TextEditingController answered1 = TextEditingController();
  FocusNode answered2FN = FocusNode();
  TextEditingController answered2 = TextEditingController();
  FocusNode answered3FN = FocusNode();
  TextEditingController answered3 = TextEditingController();
  FocusNode answered4FN = FocusNode();
  TextEditingController answered4 = TextEditingController();
  FocusNode answered5FN = FocusNode();
  TextEditingController answered5 = TextEditingController();
  FocusNode answered6FN = FocusNode();
  TextEditingController answered6 = TextEditingController();
  FocusNode answered7FN = FocusNode();
  TextEditingController answered7 = TextEditingController();
  FocusNode answered8FN = FocusNode();
  TextEditingController answered8 = TextEditingController();
  FocusNode answered9FN = FocusNode();
  TextEditingController answered9 = TextEditingController();
  FocusNode answered10FN = FocusNode();
  TextEditingController answered10 = TextEditingController();
  String countDisplay =
      "Fill In The Fields" + "\n" + "I'll Do The Math For You";

  updateState() {
    if (mounted) {
      setState(() {});
    }
  }

  recalcTotal() {
    //answered includes 0s
    int answers = int.tryParse(answerCount.text) ?? 0;
    int participants = int.tryParse(participantCount.text) ?? 0;

    //special cases
    int zero = int.tryParse(answered0.text) ?? 0;
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

    //if they answered the poll the answer is known
    int countsKnown =
        one + two + three + four + five + six + seven + eight + nine + ten;
    int countsUnKnown = participants - answers;

    //sum it up
    int total = countsUnKnown + countsKnown;
    if (total == 0) {
      countDisplay = "Fill In The Fields" + "\n" + "I'll Do The Math For You";
    } else {
      countDisplay = total.toString() + " In Attendance";
    }

    //show new result
    updateState();
  }

  @override
  void initState() {
    //super init
    super.initState();

    //add listeners
    answerCount.addListener(recalcTotal);
    participantCount.addListener(recalcTotal);
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
    answerCount.removeListener(recalcTotal);
    participantCount.removeListener(recalcTotal);
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
                    bottom: 8.0,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NumberField(
                        focusNode: answerCountFN,
                        textEditingController: answerCount,
                        nextFocusNode: participantCountFN,
                        suffix: "answered the poll",
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("out of"),
                      ),
                      NumberField(
                        focusNode: participantCountFN,
                        textEditingController: participantCount,
                        nextFocusNode: answered0FN,
                        suffix: "participants",
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
                    focusNode: answered0FN,
                    textEditingController: answered0,
                    nextFocusNode: answered1FN,
                    suffix: "* 0 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    focusNode: answered1FN,
                    textEditingController: answered1,
                    nextFocusNode: answered2FN,
                    suffix: "* 1 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    focusNode: answered2FN,
                    textEditingController: answered2,
                    nextFocusNode: answered3FN,
                    suffix: "* 2 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    focusNode: answered3FN,
                    textEditingController: answered3,
                    nextFocusNode: answered4FN,
                    suffix: "* 3 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    focusNode: answered4FN,
                    textEditingController: answered4,
                    nextFocusNode: answered5FN,
                    suffix: "* 4 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    focusNode: answered5FN,
                    textEditingController: answered5,
                    nextFocusNode: answered6FN,
                    suffix: "* 5 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    focusNode: answered6FN,
                    textEditingController: answered6,
                    nextFocusNode: answered7FN,
                    suffix: "* 6 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    focusNode: answered7FN,
                    textEditingController: answered7,
                    nextFocusNode: answered8FN,
                    suffix: "* 7 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    focusNode: answered8FN,
                    textEditingController: answered8,
                    nextFocusNode: answered9FN,
                    suffix: "* 8 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    focusNode: answered9FN,
                    textEditingController: answered9,
                    nextFocusNode: answered10FN,
                    suffix: "* 9 in attendance",
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                  ),
                  child: NumberField(
                    focusNode: answered10FN,
                    textEditingController: answered10,
                    nextFocusNode: answerCountFN,
                    suffix: "* 10 in attendance",
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
                textAlign: TextAlign.center,
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
    required this.focusNode,
    required this.nextFocusNode,
    required this.suffix,
    Key? key,
  }) : super(key: key);

  final TextEditingController textEditingController;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final String suffix;

  focusAfterUnfocused(BuildContext context) async {
    if (FocusScope.of(context).hasFocus) {
      await Future.delayed(
        Duration(milliseconds: 100),
      );
      focusAfterUnfocused(context);
    } else {
      FocusScope.of(context).requestFocus(
        nextFocusNode,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      focusNode: focusNode,
      controller: textEditingController,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      textInputAction: TextInputAction.next,
      keyboardType: TextInputType.phone,
      onEditingComplete: () {
        //start the unfocus
        FocusScope.of(context).unfocus(
          disposition: UnfocusDisposition.previouslyFocusedChild,
        );

        //create a loop so that things work in the most ammount of browsers
        focusAfterUnfocused(
          context,
        );
      },
      decoration: InputDecoration(
        suffixIconConstraints: BoxConstraints(minWidth: 0, minHeight: 0),
        suffixIcon: Padding(
          padding: EdgeInsets.only(
            right: 16,
          ),
          child: Text(
            " " + suffix,
          ),
        ),
        border: OutlineInputBorder(),
      ),
    );
  }
}
