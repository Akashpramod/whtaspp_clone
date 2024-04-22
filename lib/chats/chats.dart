import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chats/achivedScreen.dart';
import 'package:whatsapp_clone/chats/personal_chat.dart';
import 'package:whatsapp_clone/chats/slectedcontact.dart';
import 'package:whatsapp_clone/constant.dart';
import 'package:whatsapp_clone/custome/appbar.dart';

class ChatScreen extends StatelessWidget {
  final List<String> activeUsers;
  final List<String> userImages;
  final List<String> archivedChats; 
  const ChatScreen({
    Key? key,
    required this.activeUsers,
    required this.userImages,
    required this.archivedChats,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarone(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: Colors.black,
              height: 50,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ArchivedScreen(archivedChats: archivedChats), 
                  ));
                },
                child: const Padding(
                  padding: EdgeInsets.only(left: 15.0, top: 8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.archive_outlined,
                        color: Colors.grey,
                      ),
                      kWidth10,
                      Text('Archived', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalChat(userImages: userImages[index], userName: activeUsers[index],),));
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(userImages[index]),
                  ),
                  title: Text(activeUsers[index],
                      style: const TextStyle(color: Colors.black)),
                  subtitle:  Text(data[index],style: TextStyle(fontWeight: FontWeight.w500) ,),
                  trailing: Column(
                    children: [
                      
                      const Text('17:57', style: TextStyle(color: Colors.grey)),
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Colors.green,
                        child: Text("1",style: TextStyle(color: Colors.white),),
                      )
                    ],
                  ),
                  minVerticalPadding: 25,
                );
              },
              itemCount: activeUsers.length,
            ),
          ],
        ),
       
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => SelectedContact()));
        },
        backgroundColor: Color.fromARGB(255, 62, 113, 64),
        child: const Icon(Icons.chat,),
      ),
    );
  }
}

List<String> activeUsers = [
  'Sharukh',
  'vijay',
  'AlluArjun',
  'Srya',
  'Danush',
  'Mohanlal',
  'Mammootty',
  'Ajith',
  'Dq',
];

List<String> userImages = [
  'https://4.bp.blogspot.com/-CCW346J8k7Y/VwgAIHGxSvI/AAAAAAAAE1o/KMFbHMkgqQkOrgJZGl8V29IYc2eNy2dAA/s1600/Shah-Rukh-Khan-HD-Wallpaper-Download.jpg',
  'https://th.bing.com/th/id/OIP.os0rOpkR4LShqGJKBNmXHQAAAA?rs=1&pid=ImgDetMain',
  'https://1.bp.blogspot.com/-E9BFcqb0XNg/XvNhVJH7YBI/AAAAAAABD4M/Id2OlZSIn-At29Tb7QZTqLjDIy_tE5g7gCK4BGAsYHg/s2048/allu-arjun-unseen-stills-from%2B-dj%2B%25281%2529.jpg',
  'https://th.bing.com/th/id/OIP.jnFj6yB3bi3C-EKuuv8_rwHaHX?rs=1&pid=ImgDetMain',
  'https://th.bing.com/th/id/OIP.2JUq1SUxNXI-iK1ncXQQFgAAAA?rs=1&pid=ImgDetMain',
  'https://th.bing.com/th/id/OIP.jEKmYi2ojP6lsp8AqmlLzwHaHj?w=1000&h=1020&rs=1&pid=ImgDetMain',
  'https://th.bing.com/th/id/OIP.S_b3v8Wf5LtjHiszY9HwhQHaHv?w=512&h=598&rs=1&pid=ImgDetMain',
  'https://th.bing.com/th/id/OIP.jq3-CT46TjlXQJuaeYYNbAHaHv?w=1080&h=1130&rs=1&pid=ImgDetMain',
  'https://th.bing.com/th/id/OIP.XDQV7wwEE4SJGZzJkjuEUwAAAA?w=204&h=204&rs=1&pid=ImgDetMain',
];

List<String>data =[
"Don't forget, we havem a meeting",
"Just saw this ",
"Hey, do you have any plans today",
"Remember to pick up milk ",
"I'm so proud of you ",
"please send me the report ",
"Let's grab lunch together ",
"I need your advice ",
"Sending virtual hugs your way,",
];

List<String> archivedChats = []; 

