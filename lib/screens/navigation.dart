import 'package:flutter/material.dart';
import 'package:aqualink/utils/theme.dart';
import 'package:aqualink/screens/home.dart';
import 'package:aqualink/screens/articles.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  _NavigationState createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0; // Déclaration de la variable selectedIndex

  static final List<Widget> _widgetOptions = <Widget>[
    const HomePage(title: "Accueil"),
    const Articles()
  ];

  void onItemTapped(int index) {
    setState(() {
      selectedIndex =
          index; // Mise à jour de selectedIndex lors de la sélection d'un élément de la navigation
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(selectedIndex),
        ),
        bottomNavigationBar: navigationBar(context),
        extendBody: true);
  }

  BottomNavigationBar navigationBar(BuildContext context) {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Accueil',
        ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.equalizer),
        //   label: 'Statistique',
        // ),
        // BottomNavigationBarItem(
        //   icon: Icon(Icons.compare_arrows),
        //   label: 'Comparaison',
        // ),
        BottomNavigationBarItem(
          icon: Icon(Icons.article),
          label: 'Articles',
        ),
      ],
      currentIndex: selectedIndex,
      selectedItemColor: AppTheme.darkPrimaryColor,
      unselectedItemColor: AppTheme.lightGrayColor,
      showUnselectedLabels: false,
      onTap: onItemTapped,
    );
  }
}
