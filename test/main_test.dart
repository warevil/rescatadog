import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rescatadog/main.dart';

void main() {
  testWidgets('Rescatadog test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    expect(find.byIcon(Icons.arrow_drop_up), findsWidgets);
  });
}
