import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:myapp/main.dart'; // Pastikan nama package sesuai dengan nama proyek Anda

void main() {
  testWidgets('BMI Calculator test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const BMICalculatorApp());

    // Verify that the gender selection widget is present.
    expect(find.text('Male'), findsOneWidget);
    expect(find.text('Female'), findsOneWidget);

    // Interact with the slider (height adjustment).
    await tester.drag(find.byType(Slider), const Offset(20.0, 0.0));
    await tester.pump();

    // Interact with weight increment button.
    final incrementButton = find.byIcon(Icons.add);
    await tester.tap(incrementButton);
    await tester.pump();

    // Verify changes (if there's a specific text update or UI change).
    expect(find.text('61'), findsOneWidget); // Assuming weight starts at 60
  });
}
