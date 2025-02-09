import 'package:bmi_calculator/resultscreen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        // padding: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 100),
            Center(child: Image.asset('assets/bmi.png',width: 120)),
            SizedBox(height: 30,),
            TextField(
              controller: weightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('Weight'),
                hintText: 'Enter weight in (kg)....',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 24,),
            TextField(
              controller: heightController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                label: Text('Height'),
                hintText: 'Enter height in (m)....',
                border: OutlineInputBorder()
              ),
            ),
            SizedBox(height: 24,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity,60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5))
                  ),
                  backgroundColor: Colors.blueGrey,
                  foregroundColor: Colors.white,
                ),
                onPressed: (){
                  if(weightController.text.isEmpty || heightController.text.isEmpty){
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please Enter Weight & Height'),backgroundColor: Colors.amberAccent,
                      )
                    );
                  }
                  else {
                    double weight = double.parse(weightController.text);
                    double height = double.parse(heightController.text);
                    double bmi = weight / (height * height);
                    weightController.clear();
                    heightController.clear();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (ctx) =>
                            ResultScreen(bmi: bmi)) //Annonymous function
                    );
                  }
                },
                child: Text('Calculate BMI'))
          ],
        ),
        ),
      ),
    );
  }
}
