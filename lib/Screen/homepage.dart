import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        title: Text("Firebase Miner"),
        actions: [GestureDetector(onTap:(){
          FirebaseAuth.instance.signOut();
        },child:Icon(Icons.logout)),SizedBox(width: 10,)],
      ),
      body: Center(
        child: Column(

          children: [
            SizedBox(height: 25,),
            (user.photoURL == null) ? CircleAvatar(radius: 40,child: Icon(Icons.person,color: Colors.black,size: 40,),backgroundColor: Colors.grey,): CircleAvatar(radius: 40,backgroundImage: NetworkImage("${user.photoURL}"),),
            SizedBox(height: 10,),
            Text("Name : ${user.displayName}",style: TextStyle(fontWeight: FontWeight.bold),),
            SizedBox(height: 5,),
            Text("Email : ${user.email}",style: TextStyle(fontWeight: FontWeight.bold),),

          ],
        ),
      ),
    );
  }
}
