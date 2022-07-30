import 'package:flutter/material.dart';
import 'package:rescatadog/chat/bloc/messages_bloc.dart';
import '../../db/data.dart';
import './widgets/chat_item.dart';
import '../../widgets/custom_text_box.dart';
import 'constants.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return getBody();
  }

  getBody() {
    return SingleChildScrollView(
      child: Column(
        children: [
          getHeader(),
          getChats(),
        ],
      ),
    );
  }

  getHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(15, 60, 15, 5),
      decoration: const BoxDecoration(),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                      ChatWords.chats,
                      style: TextStyle(
                          fontSize: 28,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    )),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const CustomTextBox(
            hint: ChatWords.search,
            prefix: Icon(Icons.search, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  final List<ChatMessage> _chatMessages = [];

  // More messages will be yielded overtime
  Stream<ChatMessage> _chat() async* {
    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(username: 'Rescatista', message: 'Hola');

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(username: 'Adoptante', message: 'Hola amigo');

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(
        username: 'Rescatista', message: 'Qué te pareció Scooby?');

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(username: 'Adoptante', message: 'Es un gran perro');

    await Future<void>.delayed(const Duration(seconds: 3));
    yield ChatMessage(username: 'Rescatista', message: 'De hecho');
  }

  getChats() {
    // final messagesBloc = new MessageBloc();
    // return StreamBuilder(
    //   stream: _chat(),
    //   builder: (context, AsyncSnapshot<ChatMessage> snapshot) {
    //     if (snapshot.hasData) {
    //       _chatMessages.add(snapshot.data!);

    //       return ListView.builder(
    //         // scrollDirection: Axis.vertical,
    //         shrinkWrap: true,
    //         itemCount: _chatMessages.length,
    //         itemBuilder: (context, index) {
    //           final ChatMessage chatItem = _chatMessages[index];
    //           return ListTile(
    //             // user name
    //             leading: Text(
    //               chatItem.username,
    //               style: const TextStyle(
    //                   fontWeight: FontWeight.bold, fontSize: 20),
    //             ),
    //             // message
    //             title: Text(
    //               chatItem.message,
    //               style: TextStyle(
    //                   fontSize: 20,
    //                   // use different colors for different people
    //                   color: chatItem.username == 'Rescatista'
    //                       ? Colors.pink
    //                       : Colors.blue),
    //             ),
    //           );
    //         },
    //       );
    //     }
    //     return const LinearProgressIndicator();
    //   },
    // );

    // return StreamBuilder(
    //   // stream: messagesBloc.getMessages,
    //   builder: (_, AsyncSnapshot snapshot) {
    //     return ListView.builder(
    //       itemBuilder: (context, index) {
    //         return ListTile(
    //           title: Text('xd'),
    //         );
    //       },
    //     );
    //   },
    // );

    return ListView(
      padding: const EdgeInsets.all(10),
      shrinkWrap: true,
      children: List.generate(
        chats.length,
        (index) => ChatItem(
          chats[index],
          onTap: () {},
        ),
      ),
    );
  }
  // getChats() {
  //   return ListView(
  //     padding: const EdgeInsets.all(10),
  //     shrinkWrap: true,
  //     children: List.generate(
  //       chats.length,
  //       (index) => ChatItem(
  //         chats[index],
  //         onTap: () {},
  //       ),
  //     ),
  //   );
  // }
}

class ChatMessage {
  String username;
  String message;
  ChatMessage({required this.username, required this.message});
}
