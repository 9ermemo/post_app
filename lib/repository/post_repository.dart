import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:posts_app/data/model/post_model.dart';

import '../urls/PostUrl.dart';

class PostRepository {
  Future<List<PostModel>> fetchData() async {
    List<PostModel> posts = [];
    http.Response response = await http.get(Uri.parse(fetchPosts));

    try {
      if (response.statusCode == 200) {
        List data = jsonDecode(response.body);
        posts = data.map((post) => PostModel.fromJson(post)).toList();
      }
    } catch (e) {
      print(e);
    }

    return posts;
  }
}
