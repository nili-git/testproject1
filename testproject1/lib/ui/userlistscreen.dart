import 'package:flutter/material.dart';
import 'package:jsonparse/model/usermodel.dart';
import 'package:jsonparse/srever/userserver.dart';

class UserList extends StatefulWidget {
  const UserList({Key? key}) : super(key: key);

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  List userList = [];
  List<User>? displayuser;
  bool loading = true;

  Future fetchData() async {
    var user = await userserverrequest();
    loading = false;
    userList = user;
    setState(() {});
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Main screen"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
           child:FutureBuilder(
             future: fetchData(),
             builder: (ctx,snapshot){
                return ListView.builder(
              itemCount: userList.length,
              itemBuilder: (ctx, i) {
                return ListTile(
                  title: Text(userList[i].name),
                  subtitle: Text(userList[i].email),
                  trailing: Text(userList[i].address.city),
                );
              });
           

           },)
        ));
  }
}
