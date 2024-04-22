import 'package:flutter/material.dart';
import 'package:whatsapp_clone/custome/appbar.dart';

class ScreenUpdate extends StatelessWidget {
  final List<String> StatusImage;
  final List<String> StatusData;
  const ScreenUpdate({Key? key, required this.StatusImage, required this.StatusData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarone(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("status", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300)),
                  Icon(Icons.more_vert)
                ],
              ),
            ),
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage("https://wallpapercave.com/wp/wp8328381.jpg"),
              ),
              title: Text('My status'),
              subtitle: Text("Tap to add status updates"),
            ),
             Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          'Recent Update',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    ),
            ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return ListTile(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StatusView(imageUrl: StatusImage[index]),
                      ),
                    );
                  },
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(StatusImage[index]),
                  ),
                  title: Text(StatusData[index]),
                  subtitle: Text("$index minutes ago"),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(height: 5),
              itemCount: StatusImage.length,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color.fromARGB(255, 62, 113, 64),
        child: const Icon(Icons.camera_alt, color: Colors.white),
      ),
    );
  }
}

class StatusView extends StatelessWidget {
  final String imageUrl;
  const StatusView({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Status')),
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}


List <String> 
      StatusImage = [
        "https://img.wallpapersafari.com/tablet/768/1024/77/69/Ehpv3y.jpg",
        "https://live.staticflickr.com/2890/13218433134_d7e5efb4a9.jpg",
        "https://www.enwallpaper.com/wp-content/uploads/ws-Winter-Scenery-640x1136-1-500x888.jpg",
        "https://th.bing.com/th/id/OIP.A51AWZKvWYK-Ss9jnnlIbAHaLG?w=587&h=880&rs=1&pid=ImgDetMain",
        "https://cdn.wallpapersafari.com/56/85/Xz6giP.jpg",
        "https://i.pinimg.com/originals/e6/65/d1/e665d195c3d5a66f9d4c420668e37572.jpg",
        "https://th.bing.com/th/id/OIP.j52SeexZEeUwsooT-GP5PQHaNK?&rs=1&pid=ImgDetMain",
        "https://th.bing.com/th/id/OIP.eUM4FdFFkJXXgvSzCvm56AHaNK?rs=1&pid=ImgDetMain",
      ];
   List<String>StatusData = [
        "Asnad",
        "Sibin",
        "Vishnu",
        "Rebin",
        "Farooq",
        "Akash",
        "Akshay",
        "sanjay",
        "rahul",
        "arjun"
      ];

