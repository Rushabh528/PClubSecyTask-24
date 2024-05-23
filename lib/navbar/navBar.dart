import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';
import 'package:secytask/navbar/MyItems/MyItems.dart';
import 'package:secytask/navbar/cartPage.dart';
import 'package:secytask/navbar/chatPage/chatListPage.dart';
import 'package:secytask/navbar/homePage.dart';
import 'package:secytask/navbar/profile/profile.dart';
import './MyItems/uploadProduct.dart';

String name0 = 'Rushabh';
String email0 = 'rb123';
String contact0 = '9999999999';

class navBar extends StatefulWidget {
  const navBar({super.key});

  @override
  State<navBar> createState() => _navBarState();
}

class _navBarState extends State<navBar> {
  int _selectedIndex = 0;
  List<Map<String, String>> cartItems = [];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _addToCart(Map<String, String> item) {
    setState(() {
      cartItems.add(item);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Item added to cart!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildPage(_selectedIndex),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8),
        child: GNav(
          rippleColor: Colors.grey[100]!,
          hoverColor: Colors.grey[700]!,
          haptic: true,
          tabBorderRadius: 10,
          tabActiveBorder: Border.all(color: Colors.black, width: 1),
          tabBorder: Border.all(color: Colors.grey, width: 1),
          tabShadow: [
            BoxShadow(color: Colors.grey.withOpacity(0.5), blurRadius: 8)
          ],
          curve: Curves.easeIn,
          duration: Duration(milliseconds: 750),
          gap: 6,
          color: Color(0xff990011),
          activeColor: Colors.white,
          iconSize: 24,
          tabBackgroundColor: Color(0xff990011).withOpacity(1),
          padding: EdgeInsets.symmetric(
              horizontal: 15, vertical: 5), // navigation bar padding
          tabs: [
            GButton(
              icon: LineIcons.home,
              text: 'Home',
            ),
            GButton(
              icon: LineIcons.shoppingCart,
              text: 'Cart',
            ),
            GButton(
              icon: LineIcons.facebookMessenger,
              text: 'Chat',
            ),
            GButton(
              icon: LineIcons.dollarSign,
              text: 'My Items',
            ),
            GButton(
              icon: LineIcons.user,
              text: 'Profile',
            ),
          ],
          selectedIndex: _selectedIndex,
          onTabChange: _onItemTapped,
        ),
      ),
    );
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return homePage(onAddToCart: _addToCart);
      case 1:
        return cartPage(
          cartItems: cartItems,
        );
      case 2:
        return chatListPage();
      case 3:
        return myItems(
          productCards: productCards,
        );
      case 4:
        return profilePage(
          name: name0,
          email: email0,
          contact: contact0,
        );
      default:
        return homePage(onAddToCart: _addToCart);
    }
  }
}
