import 'package:http/http.dart' as http;
import 'package:jsonparse/model/post.dart';

Future<Post?> serverrequest() async {
  try {
    String url = "https://jsonplaceholder.typicode.com/posts/1";
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      Post post = postFromJson(response.body);
      return post;
    }
  } catch (e) {
    print(e);
  }
}
