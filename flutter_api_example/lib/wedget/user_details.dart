import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {


  UserDetailsPage({Key? key,required this.fullName, required this.imagePath}) :super(key: key);
  String fullName;
  String imagePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User Detalis"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 80,
              backgroundColor: Colors.tealAccent,
              backgroundImage: NetworkImage(imagePath),
            ),
            const SizedBox(height: 10.0,),
            Text(fullName,
            style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w800),),
          ],
        ),
      ),
    );
  }
}
