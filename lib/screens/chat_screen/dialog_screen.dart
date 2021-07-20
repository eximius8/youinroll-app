import 'package:flutter/material.dart';
import "dart:math";
import 'package:http/http.dart';
import 'dart:convert';

class MsgSall extends StatefulWidget {
  const MsgSall({Key? key}) : super(key: key);

  @override
  _MsgSallState createState() => _MsgSallState();
}

class _MsgSallState extends State<MsgSall> {
  List msgs = [];

  void getData() async {
    String url = 'https://youinroll.com/message/getAll?api=1.0&peer_id=s100';
    Response response = await get(Uri.parse(url));
    Map data = jsonDecode(response.body);
    print(data['response']);
    setState(() {
      msgs = data['response'];
    });
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  var list = [
    'https://youinroll.com/res.php?src=storage/uploads/916a102143c0f3271b02aec7eb21bb50-1.jpg&q=100&w=130&h=130',
    'https://youinroll.com/res.php?src=storage/uploads/1d7158cbfecbbb9b32f19f19c2704dc7-953.jpg&q=100&w=130&h=130',
    'https://youinroll.com/res.php?src=storage/uploads/0441ab2158097e44f0cd4114af279dc0-10.jpg&q=100&w=130&h=130',
    'https://lh3.googleusercontent.com/a-/AOh14GjQz0OrLXTiR4pDkNG0rgRVSDT3GHBqbSVZVVGmvA=s96-c',
    'https://youinroll.com/res.php?src=storage/uploads/98f609f9b85a4b23e62b7c3de8c52ea2-1052.png&q=100&w=130&h=130'
  ];
  var namelist = [
    'Никита Вадимович',
    'Виктория Ревенская',
    'Михаил Трунов',
    'Максим Урсул',
    'Кибергвардия'
  ];

  final _random = new Random();
  // var  greycolorr = Colors.grey.shade100;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: msgs.length,
      reverse: true,
      itemBuilder: (context, index) {
        return ListTile(
          isThreeLine: true,
          leading: CircleAvatar(
            backgroundImage: NetworkImage(list[_random.nextInt(list.length)]),
          ),
          subtitle: Container(
            decoration: new BoxDecoration(
              color: Color(0xFFF5F5F5),
              borderRadius: BorderRadius.circular(20),
            ),
            //  color: const Color(0xFFF5F5F5),
            child: Padding(
                padding: EdgeInsets.fromLTRB(10, 30, 5, 10),
                child: Text(
                  "${msgs[index]['message']}",
                  style: TextStyle(color: Colors.black),
                )),
          ),
        );
      },
    );
  }
}

class ChatMain extends StatefulWidget {
  const ChatMain({Key? key}) : super(key: key);

  @override
  _ChatMainState createState() => _ChatMainState();
}

class _ChatMainState extends State<ChatMain> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          child: MsgSall(),
        ),
        Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: TextFormField(
              decoration: InputDecoration(
                  hintText: "Cообщение",
                  //  labelText: "Message",
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: Icon(Icons.gradient),
                          color: Colors.black,
                          onPressed: () {
                            // pickImage(source: 'Gallery');
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15.0),
                        child: InkWell(
                          child: Text(
                            'Отправить',
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                                fontSize: 16.0),
                          ),
                          onTap: () {},
                        ),
                      ),
                    ],
                  ),
                  prefixIcon: IconButton(
                    icon: Icon(Icons.camera_alt),
                    onPressed: () {},
                    color: Colors.black,
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0))),
              onFieldSubmitted: (value) {},
            ),
          ),
        ),
      ],
    );
  }
}

class DialogScreen extends StatefulWidget {
  const DialogScreen({Key? key}) : super(key: key);

  @override
  _DialogScreenState createState() => _DialogScreenState();
}

class _DialogScreenState extends State<DialogScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Чат'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.call),
            tooltip: 'Аудиозвонок',
            onPressed: () => {},
          ),
          IconButton(
            icon: const Icon(Icons.video_call),
            tooltip: 'Видеозвонок',
            onPressed: () => {},
          ),
        ],
      ),
      body: ChatMain(),
    );
  }
}
