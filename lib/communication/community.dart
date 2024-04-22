import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:whatsapp_clone/constant.dart';
import 'package:whatsapp_clone/custome/appbar.dart';

class ScreenCommunity extends StatelessWidget {
  const ScreenCommunity({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBarone(),
      body:  Container(
      color: const Color.fromARGB(255, 240, 232, 232),
      child: Column(
        children: [
      Container(
        width: double.infinity,
        height: 80,
       color: Colors.white,
        child:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
                children: [
                 Stack(
                   children: [
                     Container(
                      decoration: BoxDecoration(
                         color: Colors.grey,
                     borderRadius: BorderRadius.circular(10)
                      ),
                               width: 65,
                               height: 60,
                               child: const Icon(Icons.groups_2,color: Colors.white,size: 40,),
                     ),
                     const Positioned(
                      right: 0,
                      bottom: 0,
                      child: CircleAvatar(
                                  radius: 13,
                                  backgroundColor:Colors.green,
                                  child: Icon(Icons.add,color: Colors.white,),
                                ), )
                   ],
                 ),
                 kWidth10,
                 const Text("New community",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                ],
          ),
        ),
      ),
      const SizedBox(height: 8,),
      Container(
        width: double.infinity,
        height: 320,
        color: Colors.white,
        child: Column(
          children: [
            Container(
                  width: double.infinity,
                  height: 80,
                 color: Colors.white,
                 child:  Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Row(
                            children: [
                             Container(
                              decoration:  BoxDecoration(
                                 image: const DecorationImage(image:  NetworkImage("https://yt3.googleusercontent.com/gizUTRt3mGlEsAEfvvLWR9PIaTAeOhXBT89pTuQ6CcrAww1tWRlcskmWVK9sahEf-KWZZ3iJCw=s900-c-k-c0x00ffffff-no-rj")),
                             borderRadius: BorderRadius.circular(10)
                              ),
                      width: 65,
                      height: 60,
                             ),
                             kWidth10,
                             const Text("Asianet news",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                            ],
                      ),
                 ),
                ),
                const Divider(color: Colors.black,),
                 ListTile(
                  leading: Container(
                    height: 50,
                    width: 55,
                    decoration: BoxDecoration(
                       color: const Color.fromARGB(255, 206, 243, 164),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: const Icon(Icons.campaign,color:Colors.green,size: 40,),
                  ),
                  title: const Text("Announcements",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),),
                  subtitle: const Row(
                    children: [
                      Text("~Asianet:"),
                      Text("Breaking News.....",style: TextStyle(fontSize:15,fontWeight: FontWeight.w400,color: Colors.black87 ),),
                    ],
                  ),
                  trailing: const Column(
                    children: [
                      Text("yesterday",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                      Kheight10,
                      Icon(Icons.volume_off),
                    ],
                  ),
                ),
                Kheight10,
                const ListTile(
                  leading:  CircleAvatar(
                     child: Image(image: NetworkImage("https://yt3.googleusercontent.com/gizUTRt3mGlEsAEfvvLWR9PIaTAeOhXBT89pTuQ6CcrAww1tWRlcskmWVK9sahEf-KWZZ3iJCw=s900-c-k-c0x00ffffff-no-rj")),
                  ),
                  title:Text("Asianet News:Today",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500,),) ,
                  subtitle: Text("~Asianet News:The Indian sta.."),
                  trailing:  Column(
                    children: [
                      Text("yesterday",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 15),),
                      Kheight10,
                      Icon(Icons.volume_off),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child:  Row(
                    children: [
                      Icon(Icons.navigate_next,size: 30,),
                      kWidth10,
                      Text("View all",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 20),)
                    ],
                  ),
                )
          ],
        ),
      ),
       
        ],
      ),
    )
    );
  }
}