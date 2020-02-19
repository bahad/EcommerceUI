import 'package:ecommerceapp/explorepage.dart';
import 'package:ecommerceapp/favoritespage.dart';
import 'package:ecommerceapp/homepage.dart';
import 'package:ecommerceapp/profilepage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int bottomNavBarIndex = 0;

  void _incrementTab(index) {
    setState(() {
      bottomNavBarIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: bottomNavBarIndex == 0 ? HomePage() : bottomNavBarIndex == 1 ? ExplorePage() : bottomNavBarIndex == 2 ? FavoritesPage() : ProfilePage(),
        bottomNavigationBar: BottomNavigationBar(
      currentIndex: bottomNavBarIndex,
      type: BottomNavigationBarType.shifting,
      //unselectedIconTheme: IconThemeData(color: Colors.grey),
      //fixedColor: Colors.red,
      selectedIconTheme: IconThemeData(color: Colors.black),
      items: [
        BottomNavigationBarItem( 
            icon: Icon(Icons.shop, color: Colors.black.withOpacity(0.8)),
            title: new Text(
              'Shop',
              style: TextStyle(color: Colors.black),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.explore, color: Colors.black.withOpacity(0.8)),
            title: new Text(
              'Explore',
              style: TextStyle(color: Colors.black),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite, color: Colors.black.withOpacity(0.8)),
            title: new Text(
              'Favorites',
              style: TextStyle(color: Colors.black),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_pin, color: Colors.black.withOpacity(0.8)),
            title: new Text(
              'Profile',
              style: TextStyle(color: Colors.black),
            ))
      ],
      onTap: (index) {
        _incrementTab(index);
      },
    ));
  }
}
