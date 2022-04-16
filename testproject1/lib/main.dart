import 'package:flutter/material.dart';
import 'package:jsonparse/ui/apipostfromfield.dart';
import 'package:jsonparse/ui/homepage.dart';
import 'package:jsonparse/ui/mainscreen.dart';
import 'package:jsonparse/ui/userlistscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _selectedItemIndex = 0;
  final List pages = [
    HomePage(),
    const DemoClass(),
     const MainScreen(),
    const UserList(),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.black,
          selectedIconTheme:const IconThemeData(
            color: Colors.blue,),
          currentIndex: _selectedItemIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (int index) {
            setState(() {
              _selectedItemIndex = index;
            });
          },
          items:const  [
            BottomNavigationBarItem(
            label: "",
              icon: Icon(Icons.home_outlined,),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.create_new_folder_outlined,),
            ),
            BottomNavigationBarItem(
             label: "",
              icon: Icon(Icons.menu_book_outlined,),
            ),
            BottomNavigationBarItem(
              label: "",
              icon: Icon(Icons.account_circle_outlined, ),
            ),
          ],
        ),
        body: pages[_selectedItemIndex]
      ),
    );
  }
}
