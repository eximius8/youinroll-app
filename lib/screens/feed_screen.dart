import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tiktok_flutter/data/video.dart';
import 'package:tiktok_flutter/screens/feed_viewmodel.dart';
import 'package:tiktok_flutter/screens/messages_screen.dart';
//import 'package:tiktok_flutter/screens/profile_screen.dart';
import 'package:tiktok_flutter/screens/search_screen.dart';
import 'package:tiktok_flutter/widgets/actions_toolbar.dart';
import 'package:tiktok_flutter/widgets/bottom_bar.dart';
import 'package:tiktok_flutter/widgets/video_description.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:video_player/video_player.dart';
import 'package:tiktok_flutter/screens/screens.dart';

import '../data/vid_player.dart';

import 'package:tiktok_flutter/video.dart';



class FeedScreen extends StatefulWidget {
  FeedScreen({Key? key}) : super(key: key);

  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  final locator = GetIt.instance;
  final feedViewModel = GetIt.instance<FeedViewModel>();

  @override
  void initState() {
    feedViewModel.loadVideo(0);
    feedViewModel.loadVideo(1);

    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FeedViewModel>.reactive(
        disposeViewModel: true,
        builder: (context, model, child) => videoScreen(),
        viewModelBuilder: () => feedViewModel);
  }

  Widget videoScreen() {
    return Scaffold(
      backgroundColor: GetIt.instance<FeedViewModel>().actualScreen == 0
          ? Colors.black
          : Colors.white,
      body: scrollFeed(),
    );
  }


  Widget scrollFeed() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(child: currentScreen()),
        BottomBar(), // меню навигации
      ],
    );
  }

  Widget feedVideos() {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.online_prediction),
          color: Colors.white,
          onPressed: () {
            print("start streaming");
          },
        ),
        title: Padding(
          padding: EdgeInsets.only(left: 0, right: 0),
          child: const TabBar(
            tabs: [
              Tab(
                  child: Text(
                      'Подписки',
                      style: TextStyle(color: Colors.white)
                  )
              ),
              Tab(
                  child: Text(
                      'Отслеживаемые',
                      style: TextStyle(color: Colors.white)
                  )
              ),
            ],
          ),
        ),
      ),
        body: TabBarView(
          children: [
            Icon(Icons.directions_car),
            Stack(
              children: [
                PageView.builder(
                  controller: PageController(
                    initialPage: 0,
                    viewportFraction: 1,
                  ),
                  itemCount: 1, //feedViewModel.videoSource?.listVideos.length,
                  onPageChanged: (index) {
                   // index = index % (feedViewModel.videoSource!.listVideos.length);
                   // feedViewModel.changeVideo(index);
                  },
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                   // index = index % (feedViewModel.videoSource!.listVideos.length);
                    return videoCard(
                        Video(
                            id: "1",
                            user: "Mikhail Trunov",
                            userPic: "https:\/\/youinroll.com\/res.php?src=storage\/uploads\/7ee9a035a2191d7be4f006791a3eda5a-580.jpg&q=100&w=50&h=auto",
                            videoTitle: "dasdsa",
                            songName: "dasdsa",
                            likes: "50",
                            comments: "78",
                            url: "https://youinroll.com/storage/media/dc376e0e7a62bf6fc5f86ef3cd993384-240.mp4",
                        )
                    ) ;//videoCard(feedViewModel.videoSource!.listVideos[index]);
                  },
                ),
                SafeArea(
                  child: Container(
                    /*padding: EdgeInsets.only(top: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.online_prediction),
                              color: Colors.white,
                              onPressed: () {
                                print("start streaming");
                              },
                            ),

                          Text('Подписки | ',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)
                          ),
                          Text('Отслеживаемые',
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white)
                          ),
                        ]
                    ),*/
                  ),
                ),
              ],
            ),
          ],
        ),
    ),
    );
  }

  Widget currentScreen() {
    switch (feedViewModel.actualScreen) {
      case 0:
        return feedVideos();
      case 1:
        return SearchScreen();
      case 2:
        return MessagesScreen();
      case 3:
        return LoginScreen();
      default:
        return feedVideos();
    }
  }

  Widget videoCard(Video video) {
    video.controller?.play();
    print(video.controller);
    return Stack(
      children: [
      //  video.controller != null
        true
            ?  VideoPlayerScreen() /* GestureDetector(
                onTap: () {
                  if (video.controller!.value.isPlaying) {
                    video.controller?.pause();
                  } else {
                    video.controller?.play();
                  }
                },
                child: SizedBox.expand(
                    child: FittedBox(
                  fit: BoxFit.cover,
                  child: SizedBox(
                    width: video.controller?.value.size.width ?? 0,
                    height: video.controller?.value.size.height ?? 0,
                    child: VideoPlayer(video.controller!),
                  ),
                 )
                ),
              )*/
            : Container(
                color: Colors.black,
                child: Center(
                  child: Text(
                      "Загрузка",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                VideoDescription(video.user, video.videoTitle, video.songName),
                ActionsToolbar(video.likes, video.comments,
                    "https:\/\/youinroll.com\/res.php?src=storage\/uploads\/7ee9a035a2191d7be4f006791a3eda5a-580.jpg&q=100&w=50&h=auto"),
              ],
            ),
            SizedBox(height: 20)
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    feedViewModel.controller?.dispose();
    super.dispose();
  }
}
