import 'package:flutter/material.dart';

ValueNotifier<int>IndexChangeNotifire = ValueNotifier(0);
class bottomNavigationWidget extends StatelessWidget {
  const bottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(valueListenable: IndexChangeNotifire, 
    builder: (context, int newIndex, _){
       return  BottomNavigationBar(
      currentIndex: newIndex,
      onTap: (index){
        IndexChangeNotifire.value = index;
      },
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      // backgroundColor: Colors.black,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      selectedIconTheme:const IconThemeData(
        color: Colors.black
      ),
      unselectedIconTheme:const IconThemeData(
        color: Colors.black
      ),
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.chat_sharp),
      label: 'Chats'),
      BottomNavigationBarItem(icon: Icon(Icons.update),
      label: 'Updates'),
      BottomNavigationBarItem(icon: Icon(Icons.group),
      label: 'Community'),
      BottomNavigationBarItem(icon: Icon(Icons.call_sharp),
      label: 'calls'),
      
      

      ],
    );
  },
  );
}

}  
    
   