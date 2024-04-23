import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:whatsapp_clone/adapter.dart';
import 'package:whatsapp_clone/home.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:whatsapp_clone/splash_screen.dart';


void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  
  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(MessageListAdapter());
  await Hive.openBox<List<String>>('messages_box');
  
  runApp(MyApp());

}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen
      (child: ScreenMainPage()),
      
    );
  
  }
}