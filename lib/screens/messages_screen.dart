import 'package:flutter/material.dart';
//import 'package:stacked_services/stacked_services.dart';
import 'package:tiktok_flutter/utils/tik_tok_icons_icons.dart';
import 'package:tiktok_flutter/screens/chat_screen/chat_screen.dart';

class MessagesScreen extends StatefulWidget {
  MessagesScreen({Key? key}) : super(key: key);

  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: Colors.white,
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.black12))),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  width: 20,
                ),
                Row(
                  children: [
                    Text(
                      "Все сообщения",
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                IconButton(
                  icon: const Icon(Icons.chat),
                  onPressed: () => {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ChatScreen())
                    )
                  },
                )
              ],
            ),
          ),
          SizedBox(
            height: 250,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                TikTokIcons.messages,
                size: 80,
                color: Colors.black45,
              )
            ],
          ),
          SizedBox(height: 25),
          Text(
            "Сообщения чата",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 3),
          Text(
            "И обновления",
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.normal),
          ),
        ]),
      ),
    );
  }
}
