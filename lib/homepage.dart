import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isToggled1 = false;
  bool isToggled2 = false;


  void toggleButton1()
  {
    final ref = FirebaseDatabase.instance.ref('/');
    int val = isToggled1?1:0;
    ref.child('/').update({'relay1':val});
    setState(() {
      isToggled1 = !isToggled1;
    });
  }

  void toggleButton2()
  {
    final ref = FirebaseDatabase.instance.ref('/');
    int val = isToggled2?1:0;
    ref.child('/').update({'relay2':val});
    setState(() {
      isToggled2 = !isToggled2;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text("LAB E-YANTRA",style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold,),)),
          backgroundColor: Colors.black,
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.blueAccent, Colors.purpleAccent], // Define your gradient colors
              ),
            ),
          ),
          bottom: PreferredSize(
            child: Container(
              color:Colors.white,
              height: 2.0,
              width: double.infinity,
            ),
            preferredSize: const Size.fromHeight(5),
          ),
        ),
      body: Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.red,),
          height: 100,
          width: MediaQuery.of(context).size.width/1.5,
          child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text(
          'LIGHT 1',
          style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
          onPressed: toggleButton1,
          child: Text(isToggled1?"ON":"OFF"),
          ),],),
        ),
        Container(
          decoration: BoxDecoration(color: Colors.blue,),
          height: 100,
          width: MediaQuery.of(context).size.width/1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'LIGHT 2',
                style: TextStyle(fontSize: 20.0),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: toggleButton2,
                child: Text(isToggled2?"ON":"OFF"),
              ),],),
        ),
      ],
    ),

      )
    );
  }
}
