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
    'https://youinroll.com/res.php?src=storage/uploads/98f609f9b85a4b23e62b7c3de8c52ea2-1052.png&q=100&w=130&h=130',
    'https://youinroll.com/res.php?src=storage/uploads/9ae27853864395ae85529ff85beb2054-1.jpg&q=100&w=27&h=27',
    'https://lh3.googleusercontent.com/a-/AOh14GjOCyVcO1y2-yxspj2ynl3GLA9QXyYCjL-Rm_2f=s96-c',
    'https://youinroll.com/res.php?src=storage/uploads/a2489b0ec34f9f8526d2d3417f32106d-688.jpg&q=100&w=27&h=27',
    'https://youinroll.com/res.php?src=storage/uploads/affa4876de1b21520874df6095f71ac8-3062.jpg&q=100&w=130&h=130',
    'https://lh3.googleusercontent.com/a-/AOh14GjMjP5p3G6ae_ieb_2csOBYVgcGSJaBypCOxtk9BA=s96-c',
    'https://youinroll.com/res.php?src=storage/uploads/6d06cabce9869d87b3e9c8eded76172e-462.jpg&q=100&w=130&h=130',
    'https://youinroll.com/res.php?src=storage/uploads/313714d8680383ced90b654492cc2153-1139.png&q=100&w=130&h=130',
    'https://youinroll.com/res.php?src=storage/uploads/730d4764d4a4f3b344c6c8f4ff06fbec-304.gif&q=100&w=130&h=130',
    'https://lh3.googleusercontent.com/a-/AOh14GihbFcJ7JzqRAFF8NOjA-DfZCTm-OvUtZtZdCvA=s96-c',
    'https://youinroll.com/res.php?src=storage/uploads/75c11fe05d9b29c8ef2c40064aa3805f-615.jpg&q=100&w=130&h=130'
  ];
  var namelist = [
    'Никита Вадимович',
    'Виктория Ревенская',
    'Михаил Трунов',
    'Максим Tomrol',
    'Кибергвардия',
    'Ирина Иванова',
    'David',
    'Nikolay',
    'Peter',
    'Алексей Кругляков',
    "Николай Меренцов",
    "Илья Дорохова",
    "Алена Сергеева",
    "Светлана Леонидовна",
    "Мария",
    "Виктория Андреевна",
    'Anton',
    'Ivan',
    'Sergey',
    'Pavel'

  ];

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

