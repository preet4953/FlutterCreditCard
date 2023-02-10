import 'package:flutter/material.dart';
import 'package:simpleapp/Pages/home.dart';
import 'package:simpleapp/Pages/upload.dart';
import 'package:simpleapp/Pages/profile.dart';

class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=> _HomePageState();
}

class _HomePageState extends State<HomePage>{
  int currentIndex=0;
  final screens=[
    Home(),
    Upload(),
    Profile(),
  ];
  @override
  Widget build(BuildContext context){
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('MainPage'),
      // ),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        unselectedItemColor: Colors.white,
        currentIndex: currentIndex,
        onTap: (index)=>setState(() {
          currentIndex=index;
        }),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
              backgroundColor: Colors.blue,

          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.upload),
            label: 'Upload',
            backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
            backgroundColor: Colors.blue,
          ),

        ],
      )
    );
  }
}