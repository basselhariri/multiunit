import 'package:flutter/material.dart';

class WeightPage extends StatefulWidget {
  @override
  _WeightPageState createState() => _WeightPageState();
}

class _WeightPageState extends State<WeightPage> {
  TextEditingController controller = TextEditingController();
  String result = "";

  void convert() {
    double kg = double.parse(controller.text);
    setState(() {
      result = "${kg * 1000} Grams";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Weight Converter")),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter value in KG",
                border: OutlineInputBorder(),
              ),
            ),
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
