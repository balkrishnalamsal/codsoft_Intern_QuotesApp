import 'package:flutter/material.dart';
import 'package:quotesapp/QuotesProvider.dart/quotesProvider.dart';
import 'package:quotesapp/Screen/FavouriteScreen.dart';
import 'package:quotesapp/Screen/HomeScreen.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _MyAppState();
}

class _MyAppState extends State<NavigationPage> {
  int _currentIndex = 0;

  List listofscreen = [HomeScreen(), FavouriteScreen()];


  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.purple,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Favourite"),
            selectedColor: Colors.pink,
          ),
        ],
      ),
      body: listofscreen[_currentIndex],
    );
  }
}
