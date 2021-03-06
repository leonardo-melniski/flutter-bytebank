
import 'dart:convert';

import 'package:alurabytebank/models/post.dart';
import 'package:http/http.dart' as http;

Future<List<Post>> requestPosts() async {
  try {
    var response = await http.get('https://jsonplaceholder.typicode.com/posts');
    final List<dynamic> decoded = json.decode(response.body);
    return decoded.map((json) => Post.fromJson(json)).toList();
  } catch (e) {
    print('catch>');
    print(e);
    return null;
  }
}