import 'package:http/http.dart' as http;
import 'package:jsonparse/model/usermodel.dart';

Future userserverrequest() async {
  try {
    //  String url = "https://jsonplaceholder.typicode.com/users";
    var response =
        await http.get(Uri.https("jsonplaceholder.typicode.com", "users"));
    if (response.statusCode == 200) {
      // var jsonData = userFromJson(response.body);
      //  List<User> users =[];
      //  for(var u in jsonData){
      //    User user=User(id: u.id, name: u.name, username: u.username, email: u.email, address: u.address, phone: u.phone, website: u.website, company: u.company);
      //   users.add(user);
      //  }
      return userFromJson(response.body);
    }
  } catch (e) {
    print(e);
  }
}

