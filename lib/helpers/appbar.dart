import 'package:flutter/material.dart';

class appBar0 extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const appBar0({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
            color: Color(0xffFCF6F5),
            fontFamily: 'Piazzolla_24pt',
            fontWeight: FontWeight.w500),
      ),
      automaticallyImplyLeading: false,
      backgroundColor: Color(0xff990011),
    );
  }

  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
