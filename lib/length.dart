import 'package:flutter/material.dart';

class LengthPage extends StatefulWidget {
  @override
  _LengthPageState createState() => _LengthPageState();
}

class _LengthPageState extends State<LengthPage> {
  TextEditingController value = TextEditingController();
  String result = "";
  String from = "KM";
  String to = "M";

  List<String> units = ["KM", "M", "CM"];

  void convert() {
    double input = double.parse(value.text);
    double meterValue;

    // Convert to base unit (meters first)
    if (from == "KM") meterValue = input * 1000;
    else if (from == "M") meterValue = input;
    else meterValue = input / 100; // CM → M

    // Convert from meters to target
    if (to == "KM") result = "${meterValue / 1000} KM";
    else if (to == "M") result = "$meterValue M";
    else result = "${meterValue * 100} CM";

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Length Converter")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: value,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Value",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // from
            DropdownButton(value: from, items: units.map((u) {
              return DropdownMenuItem(value: u, child: Text(u));
            }).toList(), onChanged: (val) {
              setState(() => from = val.toString());
            }),

            // to
            DropdownButton(value: to, items: units.map((u) {
              return DropdownMenuItem(value: u, child: Text(u));
            }).toList(), onChanged: (val) {
              setState(() => to = val.toString());
            }),

            SizedBox(height: 20),
            ElevatedButton(onPressed: convert, child: Text("Convert")),
            SizedBox(height: 20),
            Text(result, style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
