import 'package:flutter/material.dart';

class TempPage extends StatefulWidget {
  @override
  _TempPageState createState() => _TempPageState();
}

class _TempPageState extends State<TempPage> {
  TextEditingController controller = TextEditingController();
  String result = "";
  String from = "C";
  String to = "F";

  List<String> units = ["C", "F"];

  void convert() {
    double input = double.parse(controller.text);

    if (from == "C" && to == "F") {
      result = "${(input * 9/5) + 32} °F";
    } else if (from == "F" && to == "C") {
      result = "${(input - 32) * 5/9} °C";
    } else {
      result = "$input $to";
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Temperature Converter")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Value",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            DropdownButton(value: from, items: units.map((u) {
              return DropdownMenuItem(value: u, child: Text(u));
            }).toList(), onChanged: (v) {
              setState(() => from = v.toString());
            }),

            DropdownButton(value: to, items: units.map((u) {
              return DropdownMenuItem(value: u, child: Text(u));
            }).toList(), onChanged: (v) {
              setState(() => to = v.toString());
            }),

            SizedBox(height: 20),
            ElevatedButton(onPressed: convert, child: Text("Convert")),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 22)),
          ],
        ),
      ),
    );
  }
}
