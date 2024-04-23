import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:whatsapp_clone/chats/database.dart';

class PersonalChat extends StatefulWidget {
  PersonalChat({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  _PersonalChatState createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
  List<String> messages = [];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _loadMessages() async {
    final box = await Hive.openBox<List<String>>('messages_box');
    messages = List<String>.from(box.get(widget.index.toString()) ?? []);
    setState(() {});
  }

  void _sendMessage(String message) async {
    if (message.isNotEmpty) {
      messages.add(message);
      _textEditingController.clear();

      final box = await Hive.openBox<List<String>>('messages_box');
      box.put(widget.index.toString(), messages);

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 62, 113, 64),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(whatsapp[widget.index]["Dp"]),
              radius: 20,
            ),
            SizedBox(width: 8.0),
            Text(
              whatsapp[widget.index]["name"],
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.videocam, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.call, color: Colors.white),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert, color: Colors.white),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 195, 255, 167),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Text(
                      messages[index],
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    height: 50,
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        suffixIcon: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.attach_file_rounded),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.attach_money),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.camera_alt),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8.0),
                CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 25,
                  child: IconButton(
                    icon: Icon(Icons.send),
                    color: Colors.white,
                    onPressed: () {
                      _sendMessage(_textEditingController.text);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
