import 'package:flutter/material.dart';

class RoomTab extends StatefulWidget {
  const RoomTab({Key? key}) : super(key: key);

  @override
  _RoomTabState createState() => _RoomTabState();
}

class _RoomTabState extends State<RoomTab> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            onTap: () {
              print("dasdsa");
            },
            title: Text(index.toString()),
          ),
        );
      },
    );
  }
}

class ChatMain extends StatefulWidget {
  const ChatMain({Key? key}) : super(key: key);
//https://youinroll.com/message/getAll?api=1.0&peer_id=s100

  @override
  _ChatMainState createState() => _ChatMainState();
}

class _ChatMainState extends State<ChatMain> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
