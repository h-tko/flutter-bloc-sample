import 'package:bloc_sample/src/models/image_model.dart';
import 'package:http/http.dart' show Client;
import 'dart:convert';

class SceneryImageProvider {
  Client client = Client();

  Future<List<ImageModel>> fetchImageList() async {
    final response = await client.get(
        "https://firebasestorage.googleapis.com/v0/b/blog-1a47d.appspot.com/o/json%2Fdata.json?alt=media&token=e67da5e7-b8d4-4000-9dc3-394e6a5d1549");

    if (response.statusCode == 200) {
      List<dynamic> jsonArray = JsonDecoder().convert(response.body);
      return jsonArray.map((i) => ImageModel(i)).toList();
    } else {
      throw Exception('faild to load post');
    }
  }
}
