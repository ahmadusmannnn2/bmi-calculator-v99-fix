import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const BMICalculatorApp());

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const BMICalculatorScreen(),
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
    );
  }
}

class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _BMICalculatorScreenState createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  String selectedGender = 'Male';
  int height = 150;
  int weight = 60;
  int age = 26;

  double calculateBMI() {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  String getResultText(double bmi) {
    if (bmi < 18.5) {
      return 'Underweight';
    } else if (bmi < 25) {
      return 'Normal';
    } else {
      return 'Overweight';
    }
  }

  String getInterpretation(double bmi) {
    if (bmi < 18.5) {
      return 'You have a lower than normal body weight. Try to eat more.';
    } else if (bmi < 25) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a higher than normal body weight. Try to exercise more.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Male';
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedGender == 'Male'
                            ? Colors.pink
                            : const Color(0xFF111328),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.male, size: 80),
                          const SizedBox(height: 10),
                          Text('Male', style: GoogleFonts.poppins(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = 'Female';
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: selectedGender == 'Female'
                            ? Colors.pink
                            : const Color(0xFF111328),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.female, size: 80),
                          const SizedBox(height: 10),
                          Text('Female', style: GoogleFonts.poppins(fontSize: 18)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Height', style: GoogleFonts.poppins(fontSize: 18)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(height.toString(),
                          style: GoogleFonts.poppins(fontSize: 50)),
                      Text(' cm', style: GoogleFonts.poppins(fontSize: 18)),
                    ],
                  ),
                  Slider(
                    value: height.toDouble(),
                    min: 100,
                    max: 220,
                    activeColor: Colors.pink,
                    inactiveColor: Colors.grey,
                    onChanged: (double value) {
                      setState(() {
                        height = value.round();
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight', style: GoogleFonts.poppins(fontSize: 18)),
                        Text(weight.toString(),
                            style: GoogleFonts.poppins(fontSize: 50)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (weight > 1) weight--;
                                });
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1D1E33),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age', style: GoogleFonts.poppins(fontSize: 18)),
                        Text(age.toString(),
                            style: GoogleFonts.poppins(fontSize: 50)),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  if (age > 1) age--;
                                });
                              },
                              icon: const Icon(Icons.remove),
                            ),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                              icon: const Icon(Icons.add),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              double bmi = calculateBMI();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultPage(
                    bmi: bmi,
                    resultText: getResultText(bmi),
                    interpretation: getInterpretation(bmi),
                  ),
                ),
              );
            },
            child: Container(
              color: Colors.pink,
              width: double.infinity,
              height: 60,
              child: Center(
                child: Text('Calculate', style: GoogleFonts.poppins(fontSize: 20)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ResultPage extends StatelessWidget {
  final double bmi;
  final String resultText;
  final String interpretation;

  const ResultPage({
    required this.bmi,
    required this.resultText,
    required this.interpretation,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator', style: GoogleFonts.poppins()),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1D1E33),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('Your Result',
                      style: GoogleFonts.poppins(fontSize: 35, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text(resultText,
                      style: GoogleFonts.poppins(
                          fontSize: 22, color: resultText == 'Normal' ? Colors.green : Colors.red)),
                  const SizedBox(height: 20),
                  Text(bmi.toStringAsFixed(1),
                      style: GoogleFonts.poppins(fontSize: 100, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 20),
                  Text(
                    interpretation,
                    style: GoogleFonts.poppins(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              color: Colors.pink,
              width: double.infinity,
              height: 60,
              child: Center(
                child: Text('Re - Calculate',
                    style: GoogleFonts.poppins(fontSize: 20, color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
