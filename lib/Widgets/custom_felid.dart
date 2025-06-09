import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String image;
  final String name;
  final String address;

  const CustomField({
    super.key,
    required this.address,
    required this.image,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
     crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar( radius: 30 , backgroundImage: NetworkImage(image),),
        const SizedBox(height: 8),
        Row(

          children: [
            Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(width: 8),
            Text(address),
          ],
        ),
      ],
    );
  }
}
