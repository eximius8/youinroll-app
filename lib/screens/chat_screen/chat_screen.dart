import 'package:flutter/material.dart';
import 'package:tiktok_flutter/screens/chat_screen/room_tab.dart';
import 'package:tiktok_flutter/screens/chat_screen/chat_tab.dart';
import 'package:tiktok_flutter/screens/chat_screen/video_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Михаил Трунов'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.video_call),
              tooltip: 'Open shopping cart',
              onPressed: () => {
                print("dasdsa"),
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => VideoScreen()),
                )
              },
            ),
          ],
          bottom: TabBar(
            tabs: [
              Tab(text: "Чаты"),
              Tab(text: "Комнаты"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatTab(),
            /*
              Под именем пользователя указывать когда был в сети
              3 часа назад
              в воскресенье
              была в сети вчера
              прочитано на прошлой неделе вчера и т.п.for

              один пользователь

              на главной значки белые
              на остальных черные!!!!!

              при нажатии фиолетовые


        */

            RoomTab(),
          ],
        ),
        /* floatingActionButton: FloatingActionButton(
          onPressed: () => setState(() => _count++),
          tooltip: 'Increment Counter',
          child: const Icon(Icons.add),
        ),*/
      ),
    );
  }
}
