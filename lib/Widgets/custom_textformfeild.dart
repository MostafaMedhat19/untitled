import 'package:flutter/material.dart'; // Needed for TextFormField and Icons

class CustomText extends StatelessWidget {
  final IconData icon;
  final String content;
  final TextEditingController textEditingController;

  const CustomText({
    super.key,
    required this.textEditingController,
    required this.icon,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TextFormField(
        controller: textEditingController,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          labelText: content,
          border: const OutlineInputBorder(),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please enter $content';
          }
          return null;
        },
      ),
    );
  }
}
