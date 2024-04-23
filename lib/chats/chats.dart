import 'package:flutter/material.dart';
import 'package:whatsapp_clone/chats/achivedScreen.dart';
import 'package:whatsapp_clone/chats/database.dart';
import 'package:whatsapp_clone/chats/personal_chat.dart';
import 'package:whatsapp_clone/chats/slectedcontact.dart';
import 'package:whatsapp_clone/constant.dart';
import 'package:whatsapp_clone/custome/appbar.dart';

class ChatScreen extends StatelessWidget {
  
  const ChatScreen({
    Key? key,
   
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
                    Navigator.push(context, MaterialPageRoute(builder: (context) => PersonalChat(index: index,),));
                  },
                  leading: CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(whatsapp[index]["Dp"]),
                  ),
                  title: Text(whatsapp[index]["name"],
                      style: const TextStyle(color: Colors.black)),
                  subtitle:  Text(whatsapp[index]["recent"],style: TextStyle(fontWeight: FontWeight.w500) ,),
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
              itemCount: whatsapp.length,
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



List<String> archivedChats = []; 

