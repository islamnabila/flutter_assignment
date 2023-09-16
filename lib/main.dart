//module 5 assignment
import 'package:flutter/material.dart';

void main(){
  runApp( MyApp());
}
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        elevation: 70,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.add_business),
            Text("Home", style: TextStyle(fontSize: 25, color: Colors.white),),
            Icon(Icons.search)
          ],
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is mod 5 Assignment", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: RichText(text: TextSpan(
                style: TextStyle(color: Colors.orange, fontSize: 25),
               children: [
                 TextSpan(text: "My", style: TextStyle(color: Colors.pink, fontSize: 23)),
                 TextSpan(text: " phone",style: TextStyle(color: Colors.blue, fontSize: 15)),
                 TextSpan(text: " name", style: TextStyle(color: Colors.purple, fontSize: 20)),
                 TextSpan(text: " Poco X3")

               ]
              ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
