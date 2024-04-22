import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PersonalChat extends StatefulWidget {
  final String userImages;
  final String userName;

  const PersonalChat({required this.userImages, required this.userName});

  @override
  _PersonalChatState createState() => _PersonalChatState();
}

class _PersonalChatState extends State<PersonalChat> {
  final List<String> _messages = [];
  final TextEditingController _textEditingController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  Future<void> _loadMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _messages.addAll(prefs.getStringList('messages') ?? []);
    });
  }

  Future<void> _saveMessages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('messages', _messages);
  }

  void _sendMessage(String message) {
    if (message.isNotEmpty) {
      setState(() {
        _messages.add(message);
      });
      _textEditingController.clear();
      _saveMessages();
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
              backgroundImage: NetworkImage(widget.userImages),
              radius: 20,
            ),
            SizedBox(width: 8.0),
            Text(
              widget.userName,
              style: TextStyle(fontStyle: FontStyle.italic, fontSize: 18, color: Colors.white),
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
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Container(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 195, 255, 167),
                      borderRadius: BorderRadius.circular(7.0),
                    ),
                    child: Text(
                      _messages[index],
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
                      onSubmitted: _sendMessage,
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
