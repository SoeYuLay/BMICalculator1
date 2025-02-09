import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({required this.bmi, super.key});
  final double bmi;

  @override
  Widget build(BuildContext context) {
    String type;
    if (bmi < 18.5) {
      type = "Under Weight";
    } else if (bmi >= 18.5 && bmi <= 24.9) {
      type = "Normal Weight";
    } else if (bmi >= 25 && bmi <= 29.9) {
      type = "Over Weight";
    } else {
      type = "Obese";
    }

    return Scaffold(
      appBar: AppBar(title: Text('BMI Result')),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center, //vertically center
          children: [
            Image.asset('assets/bmi.png', width: 120),
            Text(bmi.toStringAsFixed(4), style: TextStyle(fontSize: 64)),
            Text('You are $type',
                style: TextStyle(fontSize: 36, color: Colors.black54)),
          ],
        ),
      ),
    );
  }
}
