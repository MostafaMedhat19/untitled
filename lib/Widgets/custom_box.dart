import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final IconData icons;
  final String content ;
  const CustomBox({super.key ,required this.icons , required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icons),
          const SizedBox(height: 10,),
          Text(content)

        ],
      ),
    );
  }
}
