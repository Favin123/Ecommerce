import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'order.dart';
import 'profile.dart';

class ButtonNav extends StatefulWidget {
  const ButtonNav({super.key});

  @override
  State<ButtonNav> createState() => _ButtonNavState();
}

class _ButtonNavState extends State<ButtonNav> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    OrderPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        selectedItemColor: Colors.deepPurple,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: AnimatedScale(
                scale: _selectedIndex == 0 ? 1.2 : 1.0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedIndex == 0 ? Color(0xFFEDE7F6) : Colors.transparent, // Light purple background
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.home,
                    key: ValueKey(_selectedIndex == 0),
                    color: _selectedIndex == 0 ? Color(0xFF512DA8) : Colors.grey, // Deep purple for selected, grey for unselected
                  ),
                ),
              ),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: AnimatedScale(
                scale: _selectedIndex == 1 ? 1.2 : 1.0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedIndex == 1 ? Color(0xFFEDE7F6) : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.shopping_cart,
                    key: ValueKey(_selectedIndex == 1),
                    color: _selectedIndex == 1 ? Color(0xFF512DA8) : Colors.grey,
                  ),
                ),
              ),
            ),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              child: AnimatedScale(
                scale: _selectedIndex == 2 ? 1.2 : 1.0,
                duration: Duration(milliseconds: 300),
                child: Container(
                  decoration: BoxDecoration(
                    color: _selectedIndex == 2 ? Color(0xFFEDE7F6) : Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  padding: EdgeInsets.all(10),
                  child: Icon(
                    Icons.person,
                    key: ValueKey(_selectedIndex == 2),
                    color: _selectedIndex == 2 ? Color(0xFF512DA8) : Colors.grey,
                  ),
                ),
              ),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}