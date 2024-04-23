import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, required this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => widget.child!,
          ),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: [
        Center(
          child:Image(
            color: Colors.greenAccent,
            image: NetworkImage('https://cdn-icons-png.flaticon.com/128/1384/1384023.png'),
          height: 100,width:50,),
        ),
       Positioned(
          bottom: 50,
          left: 160,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Positioned(child: Stack(
                alignment: Alignment.bottomCenter,
              ),
                ),
              Text('from',style: TextStyle(color: Color.fromARGB(255, 128, 125, 125),fontSize: 10,fontWeight: FontWeight.bold),),
              
              Row(
                children: [
                  Image(
                    
                    alignment: Alignment.center,
                    image: NetworkImage('https://cdn-icons-png.flaticon.com/128/15071/15071740.png',),
                  color: Colors.white,
                  height:30,
                  width: 30,),
                   
                  Text(
                    'Meta',selectionColor: Colors.black,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13, fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ],
          ),
        ),
        
      ]),
    );
  }
}