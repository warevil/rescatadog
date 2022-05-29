import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rescatadog/widgets/notify_box.dart';

const int testNumber = 1;
void main() {
  // Define a test. The TestWidgets function also provides a WidgetTester
  // to work with. The WidgetTester allows building and interacting
  // with widgets in the test environment.
  testWidgets('MyWidget has a title and message', (tester) async {
    // Create the widget by telling the tester to build it.

    await tester.pumpWidget(const MyWidget(number: testNumber, title: 'xd'));

    // Create the Finders.
    final titleFinder = find.text(testNumber.toString());

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({
    super.key,
    required this.title,
    required this.number,
  });

  final String title;
  final int number;

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        body: NotifyBox(number: testNumber),
      ),
    );
  }
}
