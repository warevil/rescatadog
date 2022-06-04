import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rescatadog/chat/widgets/chat_item.dart';

const chatItem = {
  // "image": "",
  "fname": "Juan",
  "lname": "Perez",
  "name": "Juan Perez",
  "skill": "Mecánico",
  "last_text":
      "Lorem ipsum is a placeholder text commonly used to demonstrate the visual form of a document",
  "date": "1 min",
  "notify": 4,
};

void main() {
  testWidgets('Chat item works', (tester) async {
    await tester.pumpWidget(const MyWidget());

    // Create the Finders.
    final titleFinder = find.text('Juan Perez');

    // Use the `findsOneWidget` matcher provided by flutter_test to
    // verify that the Text widgets appear exactly once in the widget tree.
    expect(titleFinder, findsOneWidget);
  });
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ChatItem(
          chatItem,
        ),
      ),
    );
  }
}
