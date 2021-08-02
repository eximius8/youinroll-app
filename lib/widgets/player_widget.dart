import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:video_player/video_player.dart';


class VidListik extends StatefulWidget {
  final page;
  const VidListik({Key? key, this.page}) : super(key: key);

  @override
  _VidListikState createState() => _VidListikState();
}

class _VidListikState extends State<VidListik> {

  var isLoading = true;
  var videoList;


  void getData() async {
    Uri url = Uri.https('youinroll.com', '/lib/ajax/getRecomendedVideos.php', {
      'page': '${widget.page}'
    });
    Response response = await get(url);
    print(response);
    List data = jsonDecode(response.body);
    print(data.length);
    setState(() {
      videoList = data;
      isLoading = false;
    });
  }


  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading){
      return Container(
        child: Center(
          child: Text("Загрузка"),
        ),
      );
    }
    return Scaffold(
      body: ListView.builder(
        itemCount: videoList.length,
        itemBuilder: (context, index) {
          return VideoApp(); /*ListTile(
            title: Text(videoList[index]['id'].toString()),
          );*/
        },
      ),
    );
  }
}






// from player example
class VideoApp extends StatefulWidget {
  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<VideoApp> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4')
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
    _controller.setLooping(true);
    _controller.initialize().then((_) => setState(() {}));
    _controller.play();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _controller.value.isInitialized
          ? AspectRatio(
        aspectRatio: _controller.value.aspectRatio,
        child: VideoPlayer(_controller),
      )
          : Container(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
}





