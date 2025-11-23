import 'package:flutter/material.dart';
import 'length.dart';
import 'weight.dart';
import 'temperature.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Multi Unit Converter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text("Length Converter"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => LengthPage()));
              },
            ),
            ElevatedButton(
              child: Text("Weight Converter"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => WeightPage()));
              },
            ),
            ElevatedButton(
              child: Text("Temperature Converter"),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (_) => TempPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
