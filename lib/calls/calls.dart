import 'package:flutter/material.dart';
import 'package:whatsapp_clone/calls/personal_call.dart';
import 'package:whatsapp_clone/custome/appbar.dart';

class ScreenCalls extends StatelessWidget {
  ScreenCalls({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarone(),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                CircleAvatar(
                  child: Image.asset('assets/copy-link.png',width: 40,height: 40,),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Create call Links',
                      style: TextStyle(fontSize: 16),
                    ),
                    const Text(
                      'Share a link for your WhatsApp call',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
           SizedBox(height: 10),
    Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Recent',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
          
          Expanded(
            child: ListView.builder(
              itemCount: activeUsers.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(userImages[index]),
                  ),
                  title: Text(activeUsers[index]),
                  subtitle: Row(
                    children: [
                       Icon(Icons.north_east, size:18,color:  Colors.green,),
                      Text('12:34 PM'),
                     
                    ],
                  ),
                  trailing: const Icon(Icons.call),
                  
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => AudioCall(name: activeUsers[index], image:userImages[index] ),));
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
        },
        backgroundColor: Color.fromARGB(255, 62, 113, 64),
        child: const Icon(Icons.add_call),
      ),
    );
  }
}
 List<String> activeUsers = [
    'srk',
    'vijay',
    'allu',
    'srya',
    'danush',
    'mohanlal',
    'mammootty',
    'ajith',
    'dq',
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
