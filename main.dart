import 'package:flutter/material.dart';
import 'dart:async';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(useMaterial3: true),
      home: Date(),
    );
  }
}

class Date extends StatefulWidget {
  Date({Key? key}) : super(key: key);

  @override
  State<Date> createState() => _DateState();
}

class _DateState extends State<Date> {
   String a= 'Stop';
  Timer?rep;
  bool but=true;
  Duration dur=Duration(seconds: 0);
  starttimer(){
    rep=  Timer.periodic(Duration(microseconds: 1), (timer) {setState(() {
      int sec = dur.inSeconds+1;
      dur= Duration(seconds: sec);

    }); });
    
    
  }
  Ac(){
      setState(() {
         if (rep!.isActive){
                      a="Resume";
                      rep!.cancel();
                      

                    }
                    else{
                      starttimer();
                      a="Stop";
                    }
                    
      });
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  color: Colors.blueGrey,
                  padding:EdgeInsets.all(20),
                  child: Text(dur.inHours.toString().padLeft(2,'0'),style: TextStyle(fontSize: 50),),
                ),
                Text('houers',style: TextStyle(fontSize: 33),),
              
              ],
              
            ),
            
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                  Container(
                    color: Colors.blueGrey,
                    padding:EdgeInsets.all(20),
                    child: Text(dur.inMinutes.remainder(60).toString().padLeft(2,'0'),style: TextStyle(fontSize: 50),),
                  ),
                  Text('min',style: TextStyle(fontSize: 33),)
                          ],
                        ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: Colors.blueGrey,
                      padding:EdgeInsets.all(20),
                      child: Text(dur.inSeconds.remainder(60).toString().padLeft(2,'0'),style: TextStyle(fontSize: 50),),
                    ),
                    Text('sec',style: TextStyle(fontSize: 33),)
                  ],
                ),
              ],
            ),
            but ?
            Container(margin: EdgeInsets.only(top: 30),
              child: ElevatedButton(onPressed: (
              ){
                starttimer();
                but=!but;

              }, child: Text('start',style: TextStyle(fontSize: 33),)))
              : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: (){
                   Ac();
                  
                  }, child: Text
                  ( a,style: TextStyle(fontSize: 33),)),
                  SizedBox(width: 10,),
                  ElevatedButton(onPressed: (){
                    setState(() {
                       rep!.cancel();
                      dur=Duration(seconds: 0);
                      but=!but;
                    });
                   
                  }, child: Text('cancel',style: TextStyle(fontSize: 33),)),
                ],
              )
          ],
        ),
      )
    );
  }
}
