import 'package:flutter/material.dart';
import '../../db/data.dart';
import './widgets/chat_item.dart';
import '../../widgets/custom_text_box.dart';

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
      child: Column(children: [
        getHeader(),
        getChats(),
      ]),
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
                        "Chats",
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
              hint: "Search",
              prefix: Icon(Icons.search, color: Colors.grey),
            ),
          ],
        ));
  }

  getChats() {
    return ListView(
        padding: const EdgeInsets.all(10),
        shrinkWrap: true,
        children: List.generate(
            chats.length,
            (index) => ChatItem(
                  chats[index],
                  onTap: () {},
                )));
  }
}
