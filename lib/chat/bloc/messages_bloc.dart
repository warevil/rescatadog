const messagesReceived = ['x', 'y'];

class MessageBloc {
  final List<String> messages = [];

  Stream<List<String>> get getMessages async* {
    for (String message in messagesReceived) {
      await Future.delayed(const Duration(seconds: 2));
      messages.add(message);
    }

    yield messages;
  }
}
