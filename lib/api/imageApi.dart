import 'dart:convert';

import 'package:esthelogy_project/models/imageModel.dart';
import 'package:http/http.dart' as http;

class ImageApi {
  static Future<List<ImageModel>> getImages() async {
    final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));

    if (response.statusCode == 200) {
      List<dynamic> imagesJson = jsonDecode(response.body);
      print(imagesJson);
      return imagesJson.map((imageJson) => ImageModel.fromJson(imageJson)).toList();
    } else {
      throw Exception('Failed to load images');
    }
  }

}