import 'package:flutter/material.dart';
import 'package:whatsapp_clone/calls/calls.dart' as calls;
import 'package:whatsapp_clone/chats/chats.dart' as chats;
import 'package:whatsapp_clone/communication/community.dart';
import 'package:whatsapp_clone/custome/bottom_navigations.dart';
import 'package:whatsapp_clone/updates/update.dart';

class ScreenMainPage extends StatelessWidget {
  ScreenMainPage({Key? key});

  final _pages = [
    chats.ChatScreen(
    
    ),
    ScreenUpdate(
      StatusImage: StatusImage,
      StatusData: StatusData,
    ),
    ScreenCommunity(),
    calls.ScreenCalls(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: IndexChangeNotifire,
          builder: (context, int index, _) {
            return _pages[index];
          },
        ),
      ),
      bottomNavigationBar: bottomNavigationWidget(),
    );
  }
}
