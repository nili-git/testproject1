import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:jsonparse/model/postmodel.dart';

class DemoClass extends StatefulWidget {
  const DemoClass({Key? key}) : super(key: key);

  @override
  _DemoClassState createState() => _DemoClassState();
}

class _DemoClassState extends State<DemoClass> {
  bool loading = true;
  bool isedit = false;
  Postmodel? _postmodel;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController uemail = TextEditingController();
  TextEditingController upassword = TextEditingController();

  Future submitData(String name, String job) async {
    var response = await http.post(Uri.https('reqres.in', 'api/users'),
        body: {"name": name, "job": job});

    if (response.statusCode == 201) {
      return postmodelFromJson(response.body);
    } else {
      return null;
    }
  }

  Future updatestate(String? id) async {
    var response =
        await http.put(Uri.parse('https://reqres.in/api/users/$id'), body: {
      'title': uemail.text,
    });
    print(response.body);
    if (response.statusCode == 200) {
      print("success");
      return postmodelFromJson(response.body);
    } else {
      throw Exception('Failed to update album.');
    }
  }

  Future deletestate(int id) async {
    var response =
        await http.delete(Uri.parse('https://reqres.in/api/users/$id'));

    if (response.statusCode == 204) {
      print("success");
    
      // return postmodelFromJson(response.body);
    } else {
      throw Exception('Failed to update album.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Testing'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                child: TextFormField(
                                    controller: email,
                                    decoration: const InputDecoration(
                                      border: InputBorder.none,
                                      labelText: 'Email',
                                    ))))),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Stack(
                        alignment: const Alignment(0, 0),
                        children: <Widget>[
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 15, right: 15, top: 5),
                                  child: TextFormField(
                                      controller: password,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        labelText: 'Your password',
                                      )))),
                          Positioned(
                              right: 15,
                              child: RaisedButton(
                                  onPressed: () {
                                    // _controller.clear();
                                  },
                                  child: const Text('SHOW')))
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          child: RaisedButton(
                            color: const Color.fromRGBO(76, 175, 80, 1),
                            onPressed: () async {
                              _postmodel =
                                  await submitData(email.text, password.text);
                              loading = false;
                              email.text = "";
                              password.text = "";
                              isedit = false;
                              setState(() {});
                            },
                            child: const Text(
                              'Submit',
                              style: TextStyle(color: Colors.white),
                            ),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(18.0),
                                side: const BorderSide(color: Colors.green)),
                          ),
                        )),
                    const SizedBox(height: 50),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        loading
                            ? const CircularProgressIndicator()
                            : Text(_postmodel!.job),
                        const SizedBox(
                          width: 20,
                        ),
                        IconButton(
                            onPressed: () async {
                              //email.text=_postmodel!.name;
                              //password.text=_postmodel!.job;
                              isedit = true;
                              uemail.text = _postmodel!.job;
                              setState(() {});
                            },
                            icon: const Icon(
                              Icons.edit,
                              size: 30,
                              color: Colors.green,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () async {
                              setState(() {
                                deletestate(2);
                              });
                            },
                            icon: const Icon(
                              Icons.delete,
                              size: 30,
                              color: Colors.red,
                            )),
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              ///
              ///
              ///
              ///
              isedit
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15, top: 5),
                                      child: TextFormField(
                                          controller: uemail,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: _postmodel?.name,
                                            labelText: 'Email',
                                          ))))),
                          Padding(
                            padding: const EdgeInsets.all(10),
                            child: Stack(
                              alignment: const Alignment(0, 0),
                              children: <Widget>[
                                Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 15, right: 15, top: 5),
                                        child: TextFormField(
                                            controller: upassword,
                                            obscureText: true,
                                            decoration: InputDecoration(
                                              border: InputBorder.none,
                                              labelText: 'Your password',
                                              hintText: _postmodel?.job,
                                            )))),
                                Positioned(
                                    right: 15,
                                    child: RaisedButton(
                                        onPressed: () {
                                          // _controller.clear();
                                        },
                                        child: const Text('SHOW')))
                              ],
                            ),
                          ),
                          Padding(
                              padding: const EdgeInsets.all(10),
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                child: RaisedButton(
                                  color: Color.fromRGBO(76, 175, 80, 1),
                                  onPressed: () async {
                                    await updatestate("2");
                                    isedit = false;

                                    setState(() {});
                                  },
                                  child: const Text(
                                    'Update',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: const BorderSide(
                                          color: Colors.green)),
                                ),
                              ))
                        ])
                  : const Text("no edit"),

              ///
              ///
              ///
              ///
            ],
          ),
        ));
  }
}
