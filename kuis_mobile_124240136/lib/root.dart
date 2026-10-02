import 'package:flutter/material.dart';
import 'package:kuis_mobile_124240136/screens/home.dart';
import 'package:kuis_mobile_124240136/screens/profile.dart';

class Root extends StatefulWidget {
  final String userEmail;

  const Root({super.key, required this.userEmail});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      Homescreen(), 
      ProfileScreen(username: widget.userEmail),
    ];
    
    List<String> titleScreens = ["Sepatu Super", "Profil Saya"];
    
    return Scaffold(
      appBar: AppBar(
        // INI AGAR APPBAR DINAMIS MENGIKUTI TAB YG LAGI DIPILIH
        title: Text(titleScreens[_selectedIndex]),
      ),

      body: screens[_selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // INI BIAR TAU ICON MANA YG SEDANG AKTIF
        onTap: (value) {
          setState(() {
            _selectedIndex = value; // INI BAKAL NGUBAH INDEX PAS TAB DITEKAN 
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}