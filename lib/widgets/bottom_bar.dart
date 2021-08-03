import 'dart:io';

import 'package:flutter/material.dart';
import 'package:tiktok_flutter/screens/feed_viewmodel.dart';
import 'package:tiktok_flutter/utils/tik_tok_icons_icons.dart';
import 'package:get_it/get_it.dart';
import 'package:tiktok_flutter/widgets/cust_icns_icons.dart';
import 'package:path/path.dart';

class BottomBar extends StatelessWidget {
  static const double NavigationIconSize = 20.0;
  static const double CreateButtonWidth = 38.0;

  const BottomBar({Key? key}) : super(key: key);

  Widget get customCreateIcon => Container(
      width: 45.0,
      height: 27.0,
      child: Stack(children: [
        Container(
            margin: EdgeInsets.only(left: 10.0),
            width: CreateButtonWidth,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 250, 45, 108),
                borderRadius: BorderRadius.circular(7.0))),
        Container(
            margin: EdgeInsets.only(right: 10.0),
            width: CreateButtonWidth,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 32, 211, 234),
                borderRadius: BorderRadius.circular(7.0))),
        Center(
            child: Container(
          height: double.infinity,
          width: CreateButtonWidth,
          decoration: BoxDecoration(
              color: GetIt.instance<FeedViewModel>().actualScreen == 0
                  ? Colors.white
                  : Colors.black,
              borderRadius: BorderRadius.circular(7.0)),
          child: Icon(
            Icons.add,
            color: GetIt.instance<FeedViewModel>().actualScreen == 0
                ? Colors.black
                : Colors.white,
            size: 20.0,
          ),
        )),
      ]));

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context);
    bool isHomeRoute;

    if (route != null) {
      isHomeRoute = route.settings.name == '/';
      print(isHomeRoute);
    } else {
      isHomeRoute = true;
    }

    return Container(
      decoration:
          BoxDecoration(border: Border(top: BorderSide(color: Colors.black12))),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 5,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              menuButton('Главная', CustIcns.home_active, 0, 20.0, CustIcns.home_hover ), //TikTokIcons.home,
              menuButton('Просмотры', TikTokIcons.search, 1, 20.0, TikTokIcons.search),
              /*SizedBox(
                width: 10,
              ),*/
              /* menuButton('',
                  CustIcns.camera,
                  2,
              ),*/
              menuButton('', Icons.video_call, 2, 35.0, Icons.video_call),
              /* Icon(
                CustIcns.camera,
                size: 30,
                color: (isHomeRoute ? Colors.white : Colors.black),
              ),*/ //customCreateIcon,
            /*  SizedBox(
                width: 10,
              ),*/
              menuButton('Мессенджер', CustIcns.plane_active, 3, 20.0, CustIcns.plane_hover),
              menuButton('Я', TikTokIcons.profile, 4, 20.0, TikTokIcons.profile)
            ],
          ),
          SizedBox(
            height: Platform.isIOS ? 40 : 10,
          )
        ],
      ),
    );
  }

  Widget menuButton(String text, IconData icon, int index, double isize, IconData iconAccent) {

    var iconColor = GetIt.instance<FeedViewModel>().actualScreen == 0
        ? GetIt.instance<FeedViewModel>().actualScreen == index
        ? Colors.white
        : Colors.white70
          : GetIt.instance<FeedViewModel>().actualScreen == index
          ? Colors.black
          : Colors.black54;

    if (GetIt.instance<FeedViewModel>().actualScreen == 0 && index == 2){
      iconColor = Colors.white;
    }

    return GestureDetector(
        onTap: () {
          GetIt.instance<FeedViewModel>().setActualScreen(index);
        },
        child: Container(
          height: 55,
          width: 70,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(GetIt.instance<FeedViewModel>().actualScreen == index
                  ? icon
                  : iconAccent,
                  color: iconColor,
                /*  GetIt.instance<FeedViewModel>().actualScreen == 0
                      ? GetIt.instance<FeedViewModel>().actualScreen == index
                          ? Colors.white
                          : Colors.white70
                      : GetIt.instance<FeedViewModel>().actualScreen == index
                          ? Colors.black //twcolor
                          : Colors.black54, */
                  size: isize),
             SizedBox(
                height: 7,
              ),
              Text(
                text,
                style: TextStyle(
                    fontWeight:
                    GetIt.instance<FeedViewModel>().actualScreen == index
                            ? FontWeight.bold
                            : FontWeight.normal,
                    color: GetIt.instance<FeedViewModel>().actualScreen == 0
                        ? GetIt.instance<FeedViewModel>().actualScreen == index
                            ? Colors.white
                            : Colors.white70
                        : GetIt.instance<FeedViewModel>().actualScreen == index
                            ? Colors.black
                            : Colors.black54,
                    fontSize: 11),
              )
            ],
          ),
        ));
  }
}
