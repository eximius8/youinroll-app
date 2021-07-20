import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tiktok_flutter/data/demo_data.dart';
import 'package:tiktok_flutter/data/video.dart';
import 'package:http/http.dart' as http;

/*
class YouVid {
  final int id;
  final bool isPremium;

  final int id;
  final String title;

  YouVid({
    required this.userId,
    required this.id,
    required this.title,
  });

  factory YouVid.fromJson(Map<String, dynamic> json) {
    return YouVid(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}




Future<Album> fetchAlbum() async {
  final response =
  await http.get(Uri.parse('https://youinroll.com/lib/ajax/getRecomendedVideos.php'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}
 */

class VideosAPI {
  List<Video> listVideos = <Video>[];

  VideosAPI() {
    load();
  }

  void load() async {
    listVideos = [];
    // await getVideoList();
  }

  Future<List<Video>> getVideoList() async {
    var data = await FirebaseFirestore.instance.collection("Videos").get();

    var videoList = <Video>[];
    var videos;

    if (data.docs.length == 0) {
      await addDemoData();
      videos = (await FirebaseFirestore.instance.collection("Videos").get());
    } else {
      videos = data;
    }

    videos.docs.forEach((element) {
      Video video = Video.fromJson(element.data());
      videoList.add(video);
    });

    return videoList;
  }

  Future<Null> addDemoData() async {
    for (var video in data) {
      await FirebaseFirestore.instance.collection("Videos").add(video);
    }
  }
}
