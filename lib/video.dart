import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:tiktok_flutter/constants.dart';

class VideoService {
  static Future<List> getFeed({page = 1}) async {
    List videos = [];

    Uri url = Uri.https(Api.domain, Api.getFeed, {'page': '$page'});

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = convert.jsonDecode(response.body);

      videos = jsonResponse;
    }

    return videos;
  }
}
