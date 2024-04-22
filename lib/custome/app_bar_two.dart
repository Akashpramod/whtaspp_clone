import 'package:flutter/material.dart';

class AppBarWidgetTwo extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidgetTwo({Key? key}) : super(key: key);

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        IconButton(
          icon: Icon(Icons.camera_alt),
          onPressed: () {},
          color: Colors.white,
        ),
       
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
          color: Colors.white,
        ),
      ],
      title: Text(
        'WhatsApp',
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Color.fromARGB(255, 62, 113, 64),
    );
  }
}
