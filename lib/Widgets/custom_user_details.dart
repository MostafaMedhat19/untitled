import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomUserDetails extends StatelessWidget {
  String name ;
  String image ;
  final description ;
   CustomUserDetails({super.key , required this.description , required this.name , required this.image});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        child: Column(
          children: [
              Image.network(image),
              Text(name),
              Text(description.toString())

          ],
        ),
      ),
    );
  }
}
