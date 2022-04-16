import 'package:flutter/material.dart';
import 'package:jsonparse/model/usermodel.dart';
import 'package:jsonparse/srever/userserver.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List userList = [];
  bool loading = true;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
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
          child: loading
              ? Text("loading")
              : ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (ctx, index) {
                    return Container(
                      child: Text(userList[index].name),
                    );
                  }),
        ));
  }
}
