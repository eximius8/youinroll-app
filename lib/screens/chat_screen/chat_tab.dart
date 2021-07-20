import 'package:flutter/material.dart';
import "dart:math";

import 'package:tiktok_flutter/screens/chat_screen/dialog_screen.dart';


class ChatTab extends StatefulWidget {
  const ChatTab({Key? key}) : super(key: key);

  @override
  _ChatTabState createState() => _ChatTabState();
}

class _ChatTabState extends State<ChatTab> {
  var list = [
    'https://youinroll.com/res.php?src=storage/uploads/916a102143c0f3271b02aec7eb21bb50-1.jpg&q=100&w=130&h=130',
    'https://youinroll.com/res.php?src=storage/uploads/1d7158cbfecbbb9b32f19f19c2704dc7-953.jpg&q=100&w=130&h=130',
    'https://youinroll.com/res.php?src=storage/uploads/0441ab2158097e44f0cd4114af279dc0-10.jpg&q=100&w=130&h=130',
    'https://lh3.googleusercontent.com/a-/AOh14GjQz0OrLXTiR4pDkNG0rgRVSDT3GHBqbSVZVVGmvA=s96-c',
    'https://youinroll.com/res.php?src=storage/uploads/98f609f9b85a4b23e62b7c3de8c52ea2-1052.png&q=100&w=130&h=130'];
  var namelist = [
    'Никита Вадимович',
    'Виктория Ревенская',
    'Михаил Трунов',
    'Максим Урсул',
    'Кибергвардия'];

  final _random = new Random();

  //final useravaUrl = 'https://youinroll.com/res.php?src=storage/uploads/916a102143c0f3271b02aec7eb21bb50-1.jpg&q=100&w=130&h=130';
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return
          ListTile(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DialogScreen()),
              );
            },
            leading: CircleAvatar(
              backgroundImage: NetworkImage(list[_random.nextInt(list.length)]),
            ),
            title: Text(namelist[_random.nextInt(namelist.length)]),

          );
      },
    );
  }
}

